<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <!-- enlève les espaces de l'element cité / balise nécessaire pour le traitement LaTeX-->
    <xsl:strip-space elements="*"/>
    <xsl:output method="text" encoding="UTF-8"/>
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
            <xsl:apply-templates/> \end{spacing} \end{document} </xsl:result-document>
    </xsl:template>
    <xsl:template match="tei:teiHeader"/>
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
    <xsl:template match="tei:div">
        <xsl:text>\paragraph*{}</xsl:text>
        <xsl:apply-templates select="./tei:div"/>
        ﻿﻿\vspace{-20pt}
    </xsl:template>

    <xsl:template match="tei:div[@type='section']">
        <xsl:text>
\subparagraph*{}

</xsl:text>
        <xsl:if test="./preceding-sibling::tei:head">
            <xsl:if test="./@n='1'"><xsl:text>\pstart
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
﻿﻿\vspace{-30pt}
</xsl:text>
</xsl:template>
    <xsl:template match="tei:div/tei:div/tei:p">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:note">
        <xsl:text>\footnote{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    <!-- mise en page de l'édition normalisee -->
    <xsl:template match="tei:reg">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    <xsl:template match="tei:expan">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    <xsl:template match="tei:corr">
        <xsl:choose>
            <xsl:when test="@type = 'add'">
                <xsl:if test="ancestor::tei:l"><xsl:text>\relax </xsl:text></xsl:if><xsl:text>[</xsl:text>
                <xsl:value-of select="./text() | .//tei:reg/text() | .//tei:expan/text() | .//tei:ex/text()"/>
                <xsl:text>]</xsl:text>
            </xsl:when>
            <xsl:when test="@type = 'del'">
                <xsl:text>(</xsl:text>
                <xsl:value-of select="./text() | .//tei:reg/text() | .//tei:expan/text() | .//tei:ex/text()"/>
                <xsl:text>)</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:del[@type='exponctué']">\dotuline{<xsl:apply-templates/>}</xsl:template>
    <xsl:template match="tei:del[@type='raturé']">\sout{<xsl:apply-templates/>}</xsl:template>
    <xsl:template match="tei:persName|tei:placeName">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:choice">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:orig"/>
    <xsl:template match="tei:abbr"/>
    <xsl:template match="tei:sic"/>
    
    
    
    <xsl:template match="tei:pc">
        <xsl:choose>
            <xsl:when test="@type = 'orig'"/>
            <xsl:when test="text() = '-'"/>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:lg">
        \\
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:l">
        <xsl:apply-templates/> \\ </xsl:template>
    <xsl:strip-space elements="tei:pc tei:cb tei:pc"/>
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
    
    
    <xsl:template match="tei:hi[@rend = 'decorated-initial']">
        <xsl:text>\textbf{\Large{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}}</xsl:text>
    </xsl:template>

    <xsl:template match="tei:hi[@rend = 'italic']">
        <xsl:text>\textit{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    <xsl:template match="tei:hi[@rend = 'green']">
        <xsl:text>\textcolor{green}{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template match="tei:hi[@rend = 'exp']">
        <xsl:text>\up {</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template match="tei:hi[@rend = 'rubricated orig']"/>
    <xsl:template match="tei:hi[@rend = 'orig']"/>

    <xsl:template match="tei:said[@xml:lang = 'lat'] | tei:said[@xml:lang = 'grec']">
        <xsl:text>\textit{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    <xsl:template match="tei:quote[@xml:lang = 'lat'] | tei:quote[@xml:lang = 'grec']">
        <xsl:text>\textit{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    <xsl:template match="tei:seg[@xml:lang = 'lat'] | tei:seg[@xml:lang = 'grec']">
        <xsl:text>\textit{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    <xsl:template match="tei:bibl"/>
    <xsl:template match="tei:seg[@type = 'number']">
        <xsl:text>\textsc{</xsl:text>
        <xsl:copy-of select="."/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    <xsl:template match="tei:said">
        <xsl:text>\og </xsl:text>
        <xsl:apply-templates/>
        <xsl:text>\fg{}</xsl:text>
    </xsl:template>


    <xsl:template match="text()">
        <xsl:value-of select="replace(., '\s+', ' ')"/>
    </xsl:template>

    <!-- fin mise en page -->

    <xsl:template match="tei:app">
        <xsl:for-each select="tei:lem">
                    <xsl:text>\edtext{</xsl:text>
                    <xsl:apply-templates/>
                    <xsl:text>}</xsl:text>
        </xsl:for-each>
        <xsl:text>{\lemma{</xsl:text>
        <xsl:apply-templates
            select=".//tei:lem[not(ancestor::tei:l)]/text()
            | .//tei:lem/tei:hi[not(@rend='rubricated orig')]/text()
            | .//tei:lem/tei:hi[not(@rend='rubricated orig')]/tei:choice 
            | .//tei:lem/tei:hi[not(@rend='rubricated orig')]/tei:pc 
            | .//tei:lem/tei:hi[not(@rend='rubricated orig')]/tei:placeName/text()
            | .//tei:lem/tei:hi[not(@rend='rubricated orig')]/tei:placeName/tei:pc
            | .//tei:lem/tei:hi[not(@rend='rubricated orig')]/tei:placeName/tei:choice
            | .//tei:lem/tei:hi[not(@rend='rubricated orig')]/tei:persName/text()
            | .//tei:lem/tei:hi[not(@rend='rubricated orig')]/tei:persName/tei:pc
            | .//tei:lem/tei:hi[not(@rend='rubricated orig')]/tei:persName/tei:choice
            | .//tei:lem[not(ancestor::tei:l)]/tei:choice 
            | .//tei:lem/tei:pc/tei:choice 
            | .//tei:lem/tei:persName/text()
            | .//tei:lem/tei:persName/tei:pc
            | .//tei:lem/tei:persName/tei:choice
            | .//tei:lem/tei:placeName
            | .//tei:lem/tei:pc[@type='reg'] 
            | .//tei:lem/tei:corr[@type='del'] 
            | .//tei:lem/tei:corr[@type='add' and not(ancestor::tei:l)]/text()
            | .//tei:lem/tei:seg
            "/>
        <xsl:call-template name="vers"/>
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
            <xsl:for-each select="tokenize(./@wit, '\s+')">
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
                <xsl:if test=". != ($last)">
                    <xsl:text>&#160;</xsl:text>
                </xsl:if>
            </xsl:for-each>
            <xsl:if test=". != ($last)">
                <xsl:text>,</xsl:text>
                <xsl:text>&#160;</xsl:text>
            </xsl:if>
            <xsl:text>}</xsl:text>
        </xsl:for-each>
        <xsl:text>}}</xsl:text>
    </xsl:template>

    <xsl:template name="vers">
        <xsl:for-each select="tei:lem/tei:lg/tei:l | tei:lem/tei:l ">
            <xsl:apply-templates select="./text() | tei:app | tei:choice | tei:pc[@type='reg']/text() | tei:persName | tei:placeName"/>
            <xsl:if test="position() != last()">
                <xsl:text> / </xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
