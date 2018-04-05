﻿<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <!-- enlève les espaces de l'element cité / balise nécessaire pour le traitement LaTeX-->
    <xsl:strip-space elements="*"/>
    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:template match="/">
        <xsl:variable name="title">
            <xsl:copy-of select="//tei:titleStmt/tei:title"/>
        </xsl:variable>
        <xsl:text>
\documentclass[12pt,a4paper]{report}
\usepackage[utf8x]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage{graphicx}
\usepackage[french]{babel}
\usepackage{times}
\usepackage{lettrine}
\usepackage{setspace}
\usepackage{lineno}
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
\fancyhead[RE, LO]{\textsc{</xsl:text><xsl:value-of
            select="$title"/>}} <xsl:text>\renewcommand{\headrule}{}
\fancyfoot[C]{}

\Xmaxhnotes{.33\textheight}.
\renewcommand{\footfudgefiddle}{68}
\Xbeforenotes[A]{10pt}
\Xafterrule[A]{5pt}
\Xnotefontsize[A]{\scriptsize}
\Xarrangement[A]{paragraph}
\Xparafootsep{$\parallel$~}
\modulolinenumbers[5]
\begin{spacing}{1,5}
</xsl:text>
        <xsl:apply-templates/> \end{spacing} \end{document} </xsl:template>
    <xsl:template match="tei:teiHeader"/>
    <xsl:variable name="title">
        <xsl:copy-of select="//tei:titleStmt/tei:title"/>
    </xsl:variable>


    <xsl:template match="tei:text">
        <xsl:text>
\section*{
        </xsl:text>
        <xsl:value-of select="$title"/>
        <xsl:text>}</xsl:text>

        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:div">
        <xsl:text>\paragraph*{</xsl:text>
        <xsl:if test="tei:head">
            <xsl:apply-templates select="tei:head"/>
        </xsl:if>
        <xsl:text>}</xsl:text>
        <xsl:apply-templates select="./tei:div"/>
    </xsl:template>

    <xsl:template match="tei:div/tei:div">
        <xsl:text>
\subparagraph*{}
\beginnumbering
\pstart
</xsl:text>

        <xsl:if test="./@n = '1'">
            <xsl:value-of select="parent::tei:div/@n"/>
            <xsl:text>. </xsl:text>
        </xsl:if>
        <xsl:apply-templates/>
        <xsl:text>
\pend
\endnumbering
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
                <xsl:text>[</xsl:text>
                <xsl:value-of select="normalize-space(.)"/>
                <xsl:text>]</xsl:text>
            </xsl:when>
            <xsl:when test="@type = 'del'">
                <xsl:text>(</xsl:text>
                <xsl:value-of select="normalize-space(.)"/>
                <xsl:text>)</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:orig"/>
    <xsl:template match="tei:abbr"/>
    <xsl:template match="tei:pc">
        <xsl:choose>
            <xsl:when test="@type = 'orig'"/>
            <xsl:when test="text() = '-'"/>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:lg">
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
            <xsl:choose>
                <xsl:when test="tei:hi[@rend = 'rubricated orig']">
                    <xsl:text>\edtext{</xsl:text>
                    <xsl:apply-templates select="tei:hi/child::node()"/>
                    <xsl:text>}</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>\edtext{</xsl:text>
                    <xsl:apply-templates/>
                    <xsl:text>}</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <xsl:text>{\lemma{</xsl:text>
        <xsl:apply-templates
            select="./tei:lem/text() | ./tei:lem/tei:hi/text() | ./tei:lem/tei:hi/tei:choice | ./tei:lem/tei:hi/tei:pc | ./tei:lem/tei:hi/tei:placeName | ./tei:lem/tei:hi/tei:persName | ./tei:lem/tei:choice | ./tei:lem/tei:persName | ./tei:lem/tei:placeName | ./tei:lem/tei:pc | ./tei:lem/tei:corr"/>
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


</xsl:stylesheet>
