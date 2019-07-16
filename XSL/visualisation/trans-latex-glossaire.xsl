<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE TEI SYSTEM "../entity-Wauchier.dtd">

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="3.0">

    <!-- enlève les espaces de l'element cité / balise nécessaire pour le traitement LaTeX-->
    <xsl:strip-space elements="*"/>
    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:template match="/">
        <xsl:result-document href="../latex/{concat('glossaire','.tex')}">
            <xsl:text>
\documentclass[12pt,a4paper]{report}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage{graphicx}
\usepackage[french]{babel}
\usepackage{times}
\usepackage{lettrine}
\usepackage{setspace}
\begin{document}
\begin{spacing}{1.5}

\title{Glossaire des noms propres}
        </xsl:text>
            <xsl:call-template name="personnage"/>
            <xsl:call-template name="lieu"/> \end{spacing} \end{document} </xsl:result-document>
    </xsl:template>

    <xsl:template match="tei:listPerson" name="personnage"> \paragraph*{Liste des noms de
        personnage} <xsl:for-each select="descendant::tei:person">
            <xsl:sort select="." order="ascending"/>
            <xsl:variable name="idPerson">
                <xsl:value-of select="concat('#', ./@xml:id)"/>
            </xsl:variable>
            <xsl:value-of select="tei:persName"/> : ( \textit{ <xsl:for-each
                select="./ancestor::tei:teiHeader/following-sibling::tei:text//descendant::tei:persName[@ref = $idPerson]">
                <xsl:text> - </xsl:text><xsl:value-of select="."/>, §<xsl:value-of
                    select="ancestor::tei:div[@type = 'chapter']/@n"/><xsl:text> - </xsl:text>
            </xsl:for-each> }) <xsl:value-of select="tei:note"/> \\ </xsl:for-each>
    </xsl:template>


    <xsl:template match="tei:listPlace" name="lieu"> \paragraph*{Liste des noms de lieu}
            <xsl:for-each select="descendant::tei:place">
            <xsl:sort select="." order="ascending"/>
            <xsl:variable name="idPlace">
                <xsl:value-of select="concat('#', ./@xml:id)"/>
            </xsl:variable>
            <xsl:value-of select="tei:placeName"/> : ( \textit{ <xsl:for-each
                select="./ancestor::tei:teiHeader/following-sibling::tei:text//descendant::tei:placeName[@ref = $idPlace]">
                <xsl:text> - </xsl:text><xsl:value-of select="."/>, §<xsl:value-of
                    select="ancestor::tei:div[@type = 'chapter']/@n"/><xsl:text> - </xsl:text>
            </xsl:for-each> }) <xsl:value-of select="tei:note"/> \\ </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
