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
        match="tei:teiCorpus/tei:teiHeader[1]/tei:profileDesc[1]/tei:particDesc[1]/tei:listPerson[1]">
        <xsl:variable name="witfile">
            <xsl:value-of select="tokenize(replace(base-uri(.), '.xml', ''), '/')[last()]"/>
            <!-- récupération du nom du fichier courant -->
        </xsl:variable>
        <xsl:result-document
            href="/Users/arianepinche//Dropbox/these/corpus/latex/IndexNomsPropres.tex">
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
            \author{Ariane Pinche}
            \title{}
            
            \begin{document}
            \pagestyle{fancy}
            \fancyhead[LE,RO]{ \thepage}
            \fancyhead[RE, LO]{\textsc{Index des noms
            propres}}
            \renewcommand{\headrule}{} \fancyfoot[C]{}
            \begin{spacing}{1,5}
            \section*{Index des noms propres}
            \noindent
            <xsl:call-template name="NomPropre"/>
            \end{spacing}
            \end{document}
        </xsl:result-document>
    </xsl:template>

    <xsl:template name="NomPropre">
        <xsl:for-each select="tei:person">
            <xsl:sort order="ascending" select="my:no-accent(tei:persName)"/>
            <xsl:variable name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:variable>
            <xsl:text>\﻿textsc{</xsl:text>
            <xsl:value-of select="tei:persName"/>
            <xsl:text>} </xsl:text>
            <!--  
            <xsl:if test="tei:birth">
                <xsl:text> (</xsl:text>
                <xsl:value-of select="tei:birth"/>
                <xsl:text>-</xsl:text>
                <xsl:value-of select="tei:death"/>
                <xsl:text>)</xsl:text>
            </xsl:if>
            -->
            <xsl:for-each-group
                select="//tei:body//tei:persName[@ref = '#' || $id and not(ancestor::tei:head)]"
                group-by="my:regularize(.)">
                <xsl:apply-templates mode="reg" select="current()"/>
                <xsl:text> :</xsl:text>
                <xsl:for-each-group select="current-group()/ancestor::tei:div[@type = 'chapter']"
                    group-by="@n">
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="@n"/>
                    <xsl:text>, </xsl:text>
                </xsl:for-each-group>
            </xsl:for-each-group>
            \textit{<xsl:value-of select="tei:note"/>}\\
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="tei:persName|tei:placeName" mode="reg">
        <xsl:value-of
            select="my:regularize(.)"/>
    </xsl:template>

</xsl:stylesheet>
