<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE TEI SYSTEM "../entity-Wauchier.dtd">

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <!-- enlève les espaces de l'element cité / balise nécessaire pour le traitement LaTeX-->
    <xsl:strip-space elements="*"/>
    <xsl:output method="text" encoding="UTF-8"/>

    <xsl:template match="teiCorpus">
        <xsl:result-document href="../latex/{concat('saintmartin','.tex')}">
            <xsl:text>
\NeedsTeXFormat{LaTeX2e}
\documentclass[a4paper,twoside,french,12pt]{book}
\usepackage[Verbose]{parallel}
\usepackage[french]{babel}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[pdftex]{graphicx}
\usepackage{lmodern}
\usepackage{lscape}


\usepackage[margin=2.5cm]{geometry}
\usepackage{setspace}
\setlength{\parindent}{1.cm}
\onehalfspacing

\usepackage{eledmac}
\begin{document}
\begin{}
\begin{pages}
        
        </xsl:text>
            <xsl:apply-templates/> \end{pages} \end{document} </xsl:result-document>

    </xsl:template>
    <xsl:template match="tei:teiHeader"/>

    <xsl:template match="/">
        <xsl:text>

\beginnumbering
\pstart</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>
\pend
\endnumbering
\end{Leftside}
 </xsl:text>
    </xsl:template>
    <xsl:template match="tei:text[@n = 'traduction']">
        <xsl:text>
\begin{Righside}
\chapter*{Vie de saint Martin}            
\beginnumbering
\pstart</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>
\pend
\endnumbering
\end{Rightside}
 </xsl:text>
    </xsl:template>

    <xsl:template match="tei:div">
        <xsl:text>\section*{</xsl:text>
        <xsl:value-of select="tei:head"/>
        <xsl:text>}</xsl:text>
        <xsl:apply-templates select="tei:p"/>

    </xsl:template>

    <xsl:template match="tei:div/tei:div">
        <xsl:text>\paragraph*{}</xsl:text>
        <xsl:apply-templates/> \newline \linebreak </xsl:template>

    <xsl:template match="tei:reg">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    <xsl:template match="tei:expan">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    <xsl:template match="tei:orig"/>
    <xsl:template match="tei:abbr"/>

    <xsl:template match="tei:pc">
        <xsl:choose>
            <xsl:when test="@type = 'orig'"/>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:seg[@xml:lang = 'lat']"> \textit{ <xsl:apply-templates/> } </xsl:template>


    <xsl:template match="tei:app">
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template match="tei:rdgGrp">
        <xsl:apply-templates/>
    </xsl:template>


    <xsl:template match="tei:lem">
        <xsl:text>
            \edtext{\\</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}{</xsl:text>
    </xsl:template>

    <xsl:template match="tei:rdgGrp[@type = 'orthographic']/tei:rdg">
        <xsl:text> \lemma{</xsl:text>
        <xsl:value-of select="normalize-space(.)"/>
        <xsl:text>}\Afootnote{\textit{</xsl:text>
        <xsl:value-of select="replace(@wit, '#', '')"/>
        <xsl:text>}}</xsl:text>
    </xsl:template>

    <xsl:template match="tei:rdg[@type = 'omission']">
        <xsl:text>
            \lemma{omission</xsl:text>
        <xsl:text>}\Afootnote{\textit{</xsl:text>
        <xsl:value-of select="replace(@wit, '#', '')"/>
        <xsl:text>}}</xsl:text>
    </xsl:template>

    <xsl:template match="tei:rdgGrp[@type = 'translation']/tei:rdg">
        <xsl:text>
            \lemma{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}\Bfootnote{\textit{</xsl:text>
        <xsl:value-of select="replace(@wit, '#', '')"/>
        <xsl:text>}}</xsl:text>
    </xsl:template>

    <xsl:template match="tei:rdg[@type = 'translation']">
        <xsl:text>
            \lemma{</xsl:text>
        <xsl:value-of select="normalize-space(.)"/>
        <xsl:text>}\Bfootnote{\textit{</xsl:text>
        <xsl:value-of select="replace(@wit, '#', '')"/>
        <xsl:text>}}</xsl:text>
    </xsl:template>

    <xsl:template match="tei:witDetail">
        <xsl:text>
            \lemma{</xsl:text>
        <xsl:value-of select="normalize-space(.)"/>
        <xsl:text>}\Cfootnote{\textit{</xsl:text>
        <xsl:value-of select="replace(@wit, '#', '')"/>
        <xsl:text>}}</xsl:text>
    </xsl:template>

    <xsl:template match="tei:cit/tei:quote">
        <xsl:text>\textit{</xsl:text>
        <xsl:value-of select="normalize-space(.)"/>
        <xsl:text>}</xsl:text>
    </xsl:template>
</xsl:stylesheet>
