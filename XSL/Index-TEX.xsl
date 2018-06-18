<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="3.0" xmlns:my="LOCALHOST">
   <!-- error de reconnaissance caractères UTF 8 dans latex -->
    <xsl:function name="my:no-accent">
        <xsl:param name="string"/>
        <xsl:value-of select="translate($string, 'áàâäéèêëíìîïóòôöúùûü', 'aaaaeeeeiiiioooouuuu')"/>
    </xsl:function>
    <xsl:function name="my:regularize">
        <xsl:param name="node"/>
        <xsl:variable name="var"
            select="$node/(text() | tei:hi/text() | .//tei:reg/text() | .//tei:expan/text() | .//tei:ex/text() | .//tei:pc[@type = 'reg' and not(text() = '-')])"/>
        <xsl:value-of select="replace(string-join($var), '\s+', ' ')"/>
    </xsl:function>
    <!-- enlève les espaces de l'element cité / balise nécessaire pour le traitement LaTeX-->
    <xsl:strip-space elements="*"/>
    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:template
        match="tei:teiCorpus/tei:teiHeader[1]">
        <xsl:variable name="witfile">
            <xsl:value-of select="tokenize(replace(base-uri(.), '.xml', ''), '/')[last()]"/>
            <!-- récupération du nom du fichier courant -->
        </xsl:variable>
        <xsl:result-document
            href="/Users/arianepinche//Dropbox/these/corpus/latex/Index.tex">
            ﻿\documentclass[12pt,a4paper]{book}
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
            
            \begin{document}
            \pagestyle{fancy}
            \fancyhead[LE,RO]{ \thepage}
            \fancyhead[RE, LO]{\textsc{Index}}
            \renewcommand{\headrule}{} \fancyfoot[C]{}
            ﻿ \setlength{\parindent}{-1em}
            
            ﻿\chapter*{Index}           
            ﻿ ﻿\paragraph*{}
            Cet index a pour objectif de permettre l'identification des noms propreset des toponymes  qui apparaissent dans le recueil des \textit{Seint Confessor} avec toutes leurs formes relevées dans le texte. Ainsi pour un nom donné on trouvera successivement :
            \begin{list}{-}{}
            \item En petites capitales, la forme qui sert de base au regroupement, forme (au cas régime) la plus représentée dans le texte ou la plus aisée pour le classement. Ainsi, les noms de saint sont classés sous la forme de leur prénom uniquement, leur titre apparaissant à la suite entre parenthèses;  
            \subitem Exemple : \textsc{Martin (saint)}
            \item En romain, apparaissent par ordre alphabétique les autres formes du même nom relevées dans le texte ;
            \item Ces formes sont suivies de la référence à la Vie du saint et du ou des chapitres où elles apparaissent. La vie de saint est signalée par le prénom du saint  entre crochets
            \subitem Exemple : [Martin] 
            \item En italiques est donnée l'identification du personnage et du nom de lieu. 
            \end{list}
            \begin{center}
            \section*{Index des noms propres}
            \end{center}
            <xsl:call-template name="NomPropre"/>
            \newpage
            \begin{center}
            \section*{Index des toponymes}
            \end{center}
            <xsl:call-template name="NomLieu"/>
            \end{document}    
            
        </xsl:result-document>
    </xsl:template>

    <xsl:template name="NomPropre">
        <xsl:for-each select="descendant::tei:person">
            <xsl:sort order="ascending" select="my:no-accent(tei:persName)"/>
            <xsl:variable name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:variable>
            <xsl:variable name="persName">
                <xsl:value-of select="tei:persName"/>
            </xsl:variable>
            \textsc{<xsl:value-of select="tei:persName"/>}<xsl:if test="tei:birth">
                <xsl:text> (</xsl:text>
                <xsl:value-of select="tei:birth"/>
                <xsl:text>-</xsl:text>
                <xsl:value-of select="tei:death"/>
                <xsl:text>)</xsl:text>
            </xsl:if>,
            <xsl:for-each-group
                select="//tei:body//tei:persName[@ref = '#' || $id and not(ancestor::tei:head)]"
                group-by="my:regularize(.)">
                <xsl:sort order="ascending" select="current-grouping-key()"/>
                <xsl:text> </xsl:text>
               <xsl:if test="current-grouping-key() != $persName ">
                   <xsl:apply-templates mode="reg" select="current()"/>
                   <xsl:text>: </xsl:text>
                </xsl:if>
                <xsl:for-each-group select="current-group()" group-by="ancestor::tei:body/@n">
                    <xsl:text> </xsl:text>
                    <xsl:call-template name="NomVie"/>
                    <xsl:for-each-group select="current-group()/ancestor::tei:div[@type = 'chapter']"
                        group-by="@n">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="@n"/>
                        <xsl:choose>    
                            <xsl:when test="position() = last()"><xsl:text>; </xsl:text></xsl:when>
                            <xsl:otherwise>, </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each-group>
                </xsl:for-each-group>
            </xsl:for-each-group>
            \textit{<xsl:apply-templates select="tei:note"/>}\\
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="NomLieu">
        <xsl:for-each select="descendant::tei:place">
            <xsl:sort order="ascending" select="my:no-accent(tei:placeName)"/>
            <xsl:variable name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:variable>
            <xsl:variable name="placeName">
                <xsl:value-of select="tei:placeName"/>
            </xsl:variable>
            \textsc{<xsl:value-of select="tei:placeName"/>}<xsl:text>, </xsl:text><xsl:for-each-group
                select="//tei:body//tei:placeName[@ref = '#' || $id and not(ancestor::tei:head)]"
                group-by="my:regularize(.)">
                <xsl:sort order="ascending" select="current-grouping-key()"/>
                <xsl:variable name="ref">
                    <xsl:value-of select="replace(@ref, '#', '')"/>
                </xsl:variable>
                <xsl:text> </xsl:text>
                <xsl:if test="current-grouping-key() != $placeName ">
                    <xsl:apply-templates mode="reg" select="current()"/>
                    <xsl:text>: </xsl:text>
                </xsl:if>
                <xsl:for-each-group select="current-group()" group-by="ancestor::tei:body/@n">
                    <xsl:text> </xsl:text>
                    <xsl:call-template name="NomVie"/>
                    <xsl:for-each-group select="current-group()/ancestor::tei:div[@type = 'chapter']"
                        group-by="@n">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="@n"/>
                            <xsl:choose>    
                                <xsl:when test="position() = last()">
                                    <xsl:choose>
                                        <xsl:when test="ancestor::tei:teiCorpus/tei:teiHeader//tei:place[@xml:id = $ref]/tei:note "><xsl:text>; </xsl:text></xsl:when>
                                        <xsl:otherwise/>
                                    </xsl:choose>
                                </xsl:when>
                            <xsl:otherwise>, </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each-group>
                    <xsl:choose>    
                        <xsl:when test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="ancestor::tei:teiCorpus/tei:teiHeader//tei:place[@xml:id = $ref]/tei:note"/>
                                <xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise/>
                    </xsl:choose>
                </xsl:for-each-group>
                <xsl:choose>    
                    <xsl:when test="position() != last()">
                        <xsl:choose>
                            <xsl:when test="ancestor::tei:teiCorpus/tei:teiHeader//tei:place[@xml:id = $ref]/tei:note"/>
                            <xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise/>
                </xsl:choose>
            </xsl:for-each-group>
            \textit{<xsl:apply-templates select="tei:note"/>}\\
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="tei:persName|tei:placeName" mode="reg">
        <xsl:value-of
            select="my:regularize(.)"/>
    </xsl:template>
    <xsl:template name="NomVie">
        <xsl:choose>
            <xsl:when test="ancestor::tei:body/@n = 'urn:cts:froLit:jns915.jns1856.ciham-fro1'">
                <xsl:text>[Martin]</xsl:text>
            </xsl:when>
            <xsl:when test="ancestor::tei:body/@n = 'urn:cts:froLit:jns915.jns1743.ciham-fro1'">
                <xsl:text>[Brice]</xsl:text>
            </xsl:when>
            <xsl:when test="ancestor::tei:body/@n = 'urn:cts:froLit:jns915.jns1742.ciham-fro1'">
                <xsl:text>[Jérôme]</xsl:text>
            </xsl:when>
            <xsl:when test="ancestor::tei:body/@n = 'urn:cts:froLit:jns915.jns1744.ciham-fro1'">
                <xsl:text>[Benoit]</xsl:text>
            </xsl:when>
            <xsl:when test="ancestor::tei:body/@n = 'urn:cts:froLit:jns915.jns1761.ciham-fro1'">
                <xsl:text>[Marcel]</xsl:text>
            </xsl:when>
            <xsl:when test="ancestor::tei:body/@n = 'urn:cts:froLit:jns915.jns1994.ciham-fro1'">
                <xsl:text>[Alexis]</xsl:text>
            </xsl:when>
            <xsl:when test="ancestor::tei:body/@n = 'urn:cts:froLit:jns915.jns2000.ciham-fro1'">
                <xsl:text>[Gilles]</xsl:text>
            </xsl:when>
            <xsl:when test="ancestor::tei:body/@n = 'urn:cts:froLit:jns915.jns2114.ciham-fro1'">
                <xsl:text>[Nicolas]</xsl:text>
            </xsl:when>
            <xsl:when test="ancestor::tei:body/@n = 'urn:cts:froLit:jns915.jns2117.ciham-fro1'">
                <xsl:text>[Dialogues]</xsl:text>
            </xsl:when>
        </xsl:choose> 
</xsl:template>

</xsl:stylesheet>
