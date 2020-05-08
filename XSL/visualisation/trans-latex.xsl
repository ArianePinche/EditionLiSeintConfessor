<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://fn.com"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:strip-space elements="*"/>
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>

   
    <!-- paramètre pour choisir les types d'apparats qu'on ne souhaite pas afficher -->
    <xsl:param name="deletedAppType" select="'etym.|casAbs|inv.|outil|erreur|proPer'"/>
    
    
    <!-- paramètre pour le nombre de mots maximal dans le lemme de l'apparat critique -->
    <xsl:param name="maxWordsEllipsisDefault" as="xs:integer" select="10"/>
    <!-- paramètre pour le nombre de mots à faire apparaitre en début de lemme -->
    <xsl:param name="defaultStartingWordEllipsis" as="xs:integer" select="3"/>
    <!-- paramètre pour le nombre de mots à faire apparaitre en fin de lemme -->
    <xsl:param name="defaultEndingWordEllipsis" as="xs:integer" select="3"/>
    
    <!-- régularisation des espaces pour le rendu -->
    <xsl:function name="fn:nbsp" as="xs:string">
        <xsl:param name="text" as="xs:string"/>
        <xsl:sequence select="normalize-space(replace(replace($text, '&#160;', ' '), '\s+', ' '))"/>
    </xsl:function>

    <!-- compter le nombre de mots d'un lemme -->
    <xsl:function name="fn:countWords" as="xs:integer">
        <xsl:param name="lemma" required="yes" as="node()"/>
        <xsl:sequence select="count(tokenize(fn:normalized($lemma), '\s+'))"/>
    </xsl:function>

    <!-- fonction pour générer le lemme complet-->
    <xsl:function name="fn:normalized" as="xs:string">
        <xsl:param name="token" required="yes" as="node()"/>
        <xsl:value-of>
            <xsl:apply-templates select="$token" mode="lemma" />
        </xsl:value-of>
    </xsl:function>

    <!-- fonction pour gérer la présentation des lemmes avec ellipse d'un passage quand nécessaire -->
    <xsl:function name="fn:ellipsis" as="xs:string">
        
        <xsl:param name="token"/>
        <xsl:param name="maxWordsEllipsis" as="xs:integer"/>
        <xsl:param name="startingWords" as="xs:integer"/>
        <xsl:param name="endingWords" as="xs:integer"/>

        <xsl:variable name="text" select="fn:nbsp(fn:normalized($token))"/>
        <xsl:variable name="tokenized" select="tokenize($text, '\s+')"/>
        <xsl:variable name="nb_tokens" select="count($tokenized)"/>
        
        <xsl:choose>
            <xsl:when test="$nb_tokens &gt; $maxWordsEllipsis">
                <xsl:value-of>
                    <xsl:value-of
                        select="string-join(subsequence($tokenized, 1, $startingWords), ' ')"/>
                    <xsl:text> [...] </xsl:text>
                    <xsl:value-of
                        select="string-join(subsequence($tokenized, $nb_tokens - $endingWords + 1, $endingWords), ' ')"
                    />
                </xsl:value-of>
            </xsl:when>
            <xsl:otherwise>
                <xsl:sequence select="$text"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <!-- fonction pour générer la liste des témoins après le lemme -->
    <xsl:function name="fn:witness">
        <xsl:param name="wit"/>
        <xsl:for-each select="tokenize($wit, '\s+')">
            <xsl:variable name="witTok">
                <xsl:value-of select="replace(., '#', '')"/>
            </xsl:variable>
            <xsl:variable name="witLet">
                <xsl:value-of select="replace($witTok, '\d+', '')"/>
            </xsl:variable>
            <xsl:variable name="witNum">
                <xsl:value-of select="replace($witTok, '\D+', '')"/>
            </xsl:variable>
            <xsl:value-of select="$witLet"/>
            <xsl:text>\up{</xsl:text>
            <xsl:value-of select="$witNum"/>
            <xsl:text>}</xsl:text>
            <xsl:if test="position() != (last())">
                <xsl:text> </xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:function>

<!-- Template général du document LateX -->
    <xsl:template match="tei:TEI">
        <xsl:variable name="witfile">
            <xsl:value-of select="tokenize(replace(base-uri(.), '.xml', ''), '/')[last()]"/>
            <!-- récupération du nom du fichier courant -->
        </xsl:variable>
        <xsl:result-document href="/Users/arianepinche//Dropbox/these/corpus/latex/{concat($witfile,'.tex')}">
            <xsl:variable name="title">
                <xsl:value-of select=".//tei:titleStmt/tei:title"/>
            </xsl:variable>
            <xsl:text>
\documentclass[12pt,a4paper]{book}
\usepackage[utf8x]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage{graphicx}
\usepackage[french]{babel}
\usepackage{times}
\usepackage{lettrine}
\usepackage{setspace}
\usepackage{lineno}
\usepackage{ulem}
\usepackage{color}
\usepackage{sectsty}
\usepackage{fancyhdr}
\usepackage{reledmac}
\paragraphfont{\mdseries\itshape}
\author{Ariane Pinche}
\title{}

\begin{document}
\pagestyle{fancy}
\fancyhead[LE,RO]{ \thepage}
\fancyhead[RE, LO]{\textsc{</xsl:text><xsl:value-of select="$title"/>}} <xsl:text>\renewcommand{\headrule}{}
\fancyfoot[C]{}
\Xmaxhnotes{.33\textheight}
\renewcommand{\footfudgefiddle}{68}
\Xbeforenotes[A]{10pt}
\Xafterrule[A]{5pt}
\Xnotefontsize[A]{\scriptsize}
\Xnotenumfont[A]{\bfseries}
\Xarrangement[A]{paragraph}
\Xparafootsep{$\parallel$~}
\lineation{page}
\linenummargin{outer}
\begin{spacing}{1,5}
</xsl:text>
<xsl:apply-templates/> 
            
\end{spacing}
\end{document} 
</xsl:result-document>
</xsl:template>

    <!-- suppression des metadonnées -->    
<xsl:template match="tei:teiHeader"/>

   <!-- Structure générale du texte -->
    <xsl:template match="tei:text">
        <xsl:text>
﻿\begin{center}
\section*{</xsl:text>
        <xsl:value-of select="preceding-sibling::node()//tei:titleStmt/tei:title"/>
        <xsl:text>}
\end{center}</xsl:text>

\beginnumbering
        <xsl:apply-templates/>

\endnumbering
    </xsl:template>
    
    <xsl:template match="tei:div"><xsl:text>
\paragraph*{}</xsl:text>
        <xsl:apply-templates select="./tei:div"/>
\vspace{-20pt}
    </xsl:template>
    
    <xsl:template match="tei:div[@type='section']">
        <xsl:text>
\subparagraph*{}
      </xsl:text>
        <xsl:if test="./preceding-sibling::tei:head">
            <xsl:if test="./@n='1'">
<xsl:text>
\pstart
\noindent\textit{</xsl:text>
                <xsl:apply-templates select="./preceding-sibling::tei:head"/>
                <xsl:text>}</xsl:text>
\pend</xsl:if>
</xsl:if>
\pstart
        <xsl:if test="./@n = '1'">
            <xsl:value-of select="parent::tei:div/@n"/>
            <xsl:text>. </xsl:text>
        </xsl:if>
        <xsl:apply-templates/>
        <xsl:text>
\pend
\vspace{-30pt}
</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:div/tei:div/tei:p">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:note" mode="#all">
        <xsl:text>\footnote{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    <xsl:template match="tei:lem" mode="#all">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template match="tei:bibl" mode="#all"/>
    
    <xsl:template match="tei:persName | tei:placeName" mode="#all">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template match="tei:choice" mode="#all">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
   
    
    <!-- mise en page de l'édition normalisee -->
    <xsl:template match="tei:reg" mode="#all">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    <xsl:template match="tei:expan" mode="#all">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    <xsl:template match="tei:corr">
        <xsl:choose>
            <xsl:when test="@type = 'add'">
                <xsl:if test="ancestor::tei:l">
                    <xsl:text>\relax </xsl:text>
                </xsl:if>
                <xsl:text>[</xsl:text>
                <xsl:apply-templates/>
                <xsl:text>]</xsl:text>
            </xsl:when>
            <xsl:when test="@type = 'del'">
                <xsl:text>(</xsl:text>
                <xsl:apply-templates/>
                <xsl:text>)</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
   
    <!--
    <xsl:template match="tei:del[@type='exponctué']">\dotuline{<xsl:apply-templates/>}</xsl:template>
    <xsl:template match="tei:del[@type='raturé']">\sout{<xsl:apply-templates/>}</xsl:template>
    -->

    <!-- suppression des graphies originales -->
    <xsl:template match="tei:orig" mode="#all"/>
    <xsl:template match="tei:abbr" mode="#all"/>
    <xsl:template match="tei:sic" mode="#all"/>
    
    <!-- suppression du texte rubriqué, repris dans les titres de chapitre -->
    <xsl:template match="tei:hi[@rend = 'rubricated orig']" mode="#all"/>
    <xsl:template match="tei:hi[@rend = 'orig']" mode="#all"/>
    
   
    <!-- Gestion ponctuation -->
    <xsl:template match="tei:pc[@type='orig']" mode="#all"/>
    <xsl:template match="tei:pc[not(@type='orig')]" mode="#all">
        <xsl:choose>
            <xsl:when test="text()= '-'"/>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
  
    <!-- Mise en page de la signalisation des sauts de colonnes -->
    
    <xsl:template match="tei:cb">
        <xsl:choose>
            <xsl:when test="preceding-sibling::tei:pc/text() = '-'">
                <xsl:text>{\small[fol.</xsl:text>
                <xsl:value-of select="preceding::tei:pb[1]/@n"/>
                <xsl:value-of select="@n"/>
                <xsl:text>]}</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>&#160;{\small[fol.</xsl:text>
                <xsl:value-of select="preceding::tei:pb[1]/@n"/>
                <xsl:value-of select="@n"/>
                <xsl:text>]}&#160;</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <!-- Mise en page des vers -->
    <xsl:template match="tei:lg" mode="#all">
        <xsl:text> \\ %
</xsl:text>
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    <xsl:template match="tei:l" mode="#all">
        <xsl:apply-templates mode="#current"/>
        <xsl:text> \\ %
        </xsl:text>
    </xsl:template>
   
    
    <!-- Mise en page éléments de style -->

    <xsl:template match="tei:hi[@rend = 'decorated-initial']">
        <xsl:text>\textbf{\Large{</xsl:text>
        <xsl:apply-templates mode="#current"/>
        <xsl:text>}}</xsl:text>
    </xsl:template>

    <xsl:template match="tei:hi[@rend = 'italic']" mode="#all">
        <xsl:text>\textit{</xsl:text>
        <xsl:apply-templates mode="#current"/>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template match="tei:hi[@rend = 'exp']" mode="#all">
        <xsl:text>\up {</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template match="tei:said[@xml:lang = 'lat'] | tei:said[@xml:lang = 'grec']" mode="#all">
        <xsl:text>\textit{</xsl:text>
        <xsl:apply-templates mode="#current"/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    <xsl:template match="tei:quote[@xml:lang = 'lat'] | tei:quote[@xml:lang = 'grec']" mode="#all">
        <xsl:text>\textit{</xsl:text>
        <xsl:apply-templates mode="#current"/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    <xsl:template match="tei:seg[@xml:lang = 'lat'] | tei:seg[@xml:lang = 'grec']" mode="#all">
        <xsl:text>\textit{</xsl:text>
        <xsl:apply-templates mode="#current"/>
        <xsl:text>}</xsl:text>
    </xsl:template>
   
    <xsl:template match="tei:seg[@type = 'number']" mode="#all">
        <xsl:text>\textsc{</xsl:text>
        <xsl:apply-templates mode="#current"/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    <xsl:template match="tei:said" mode="#all">
        <xsl:text>\og </xsl:text>
        <xsl:apply-templates/>
        <xsl:text>\fg{}</xsl:text>
    </xsl:template>
    
    
    <!-- Mise en page spécifique des lemmes -->
    
    <xsl:template match="tei:rdg" mode="#all"/>
    
    
    <xsl:template match="tei:hi[@rend = 'decorated-initial']" mode="lemma">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:lg" mode="lemma">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template match="tei:l" mode="lemma">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
        
    <xsl:template match="tei:cb" mode="lemma"/>
    
    <xsl:template match="tei:corr" mode="lemma">
            <xsl:apply-templates mode="#current"/>        
    </xsl:template>

    <!-- fin mise en page -->
    
    <!-- Mise en place de l'apparat critique -->
    <xsl:template match="tei:app">
        <xsl:choose>
           <!-- Cas n°1 : pour les apparats qui ne contiennent que des leçons avec un type à supprimer => suppression de l'apparat -->
            <xsl:when
                test="tei:rdg[matches(@type, $deletedAppType)] and not(tei:rdg[not(matches(@type, $deletedAppType))])">
                <xsl:apply-templates select="tei:lem"/>
            </xsl:when>
            <!-- Cas n°2 : pour les apparats qui des leçons avec un type à supprimer et un autre type => suppression uniquement des leçons concernées -->
            <xsl:when
                test="tei:rdg[matches(@type, $deletedAppType)] and tei:rdg[not(matches(@type, $deletedAppType))]">
                <xsl:for-each select="tei:lem">
                    <xsl:text>\edtext{</xsl:text>
                    <xsl:apply-templates/>
                    <xsl:text>}</xsl:text>
                </xsl:for-each>
                <xsl:text>{\lemma{</xsl:text>
                <xsl:value-of
                    select="fn:ellipsis(tei:lem, $maxWordsEllipsisDefault, $defaultStartingWordEllipsis, $defaultEndingWordEllipsis)"/>
                <xsl:if test="tei:lem/@wit">
                    <xsl:text>~\textit{</xsl:text>
                    <xsl:for-each select="tokenize(tei:lem/@wit, '\s+')">
                        <xsl:variable name="last" select=".[last()]"/>
                        <xsl:variable name="witTok">
                            <xsl:value-of select="replace(., '#', '')"/>
                        </xsl:variable>
                        <xsl:variable name="witLet">
                            <xsl:value-of select="replace($witTok, '\d+', '')"/>
                        </xsl:variable>
                        <xsl:variable name="witNum">
                            <xsl:value-of select="replace($witTok, '\D+', '')"/>
                        </xsl:variable>
                        <xsl:value-of select="$witLet"/>
                        <xsl:text>\up{</xsl:text>
                        <xsl:value-of select="$witNum"/>
                        <xsl:text>}</xsl:text>
                        <xsl:if test="position() != last()">
                            <xsl:text>&#160;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:text>}</xsl:text>
                </xsl:if>
                <xsl:text>}\Afootnote{</xsl:text>
                <xsl:variable name="last" select="tei:rdg[not(matches(@type, $deletedAppType))][last()]"/>
                <xsl:for-each select="tei:rdg[not(matches(@type, $deletedAppType))]">
                   <xsl:apply-templates/>
                    <xsl:if test="./@cause">
                        <xsl:text>~\textit{</xsl:text>
                        <xsl:value-of select="./@cause"/>
                        <xsl:text>}</xsl:text>
                    </xsl:if>
                    <xsl:text>~\textit{</xsl:text>
                    <xsl:value-of select="fn:witness(./@wit)"/>
                    <xsl:if test=". != ($last)">
                        <xsl:text>,</xsl:text>
                        <xsl:text>&#160;</xsl:text>
                    </xsl:if>
                    <xsl:text>}</xsl:text>
                </xsl:for-each>
                <xsl:text>}}</xsl:text>
            </xsl:when>
            <!-- Cas n°3 : pour les apparats qui ne contiennent pas de leçon avec un type à supprimer -->
            <xsl:otherwise>
                <xsl:for-each select="tei:lem">
                    <xsl:text>\edtext{</xsl:text>
                    <xsl:apply-templates/>
                    <xsl:text>}</xsl:text>
                </xsl:for-each>
                <xsl:text>{\lemma{</xsl:text>
                <xsl:value-of
                    select="fn:ellipsis(tei:lem, $maxWordsEllipsisDefault, $defaultStartingWordEllipsis, $defaultEndingWordEllipsis)"/>
                <xsl:if test="tei:lem/@wit">
                    <xsl:text>~\textit{</xsl:text>
                    <xsl:value-of select="fn:witness(./@wit)"/>
                    <xsl:text>}</xsl:text>
                </xsl:if>
                <xsl:text>}\Afootnote{</xsl:text>
                <xsl:variable name="last" select="tei:rdg[last()]"/>
                <xsl:for-each select="tei:rdg">
                   <xsl:apply-templates/>
                    <xsl:if test="./@cause">
                        <xsl:text>~\textit{</xsl:text>
                        <xsl:value-of select="./@cause"/>
                        <xsl:text>}</xsl:text>
                    </xsl:if>
                    <xsl:text>~\textit{</xsl:text>
                    <xsl:value-of select="fn:witness(./@wit)"/>
                    <xsl:if test=". != ($last)">
                        <xsl:text>,</xsl:text>
                        <xsl:text>&#160;</xsl:text>
                    </xsl:if>
                    <xsl:text>}</xsl:text>
                </xsl:for-each>
                <xsl:text>}}</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    

</xsl:stylesheet>
