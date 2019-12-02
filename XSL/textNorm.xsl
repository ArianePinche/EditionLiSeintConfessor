<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://fn.com"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    <!-- resoudre probleme espace -->
    <xsl:preserve-space elements="pc"/>
    <xsl:template match="/">
        <xsl:for-each select="TEI">
            <xsl:variable name="uri" select="replace(base-uri(), '.xml', '')"/>
        <xsl:result-document href="concat(uri, '.txt')"> <!-- reprendre l'injection de xpath  -->
            <xsl:apply-templates select="descendant::body"/>
         </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="p">
        <xsl:apply-templates/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    <xsl:template match="head">
        <xsl:apply-templates/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    <xsl:template match="div">
        <xsl:apply-templates/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    <xsl:template match="hi[matches(@rend, 'orig')]"/>
    <xsl:template match="app">
        <xsl:apply-templates select="lem"/>
    </xsl:template>
    <xsl:template match="choice">
        <xsl:value-of select="reg|expan|ex|corr"/>
    </xsl:template>
    <xsl:template match="pc">
        <xsl:choose>
            <xsl:when test="@type='reg'">
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:when test="@ana='number'">
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:when test="choice">
                <xsl:value-of select="descendant::reg"/>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>   
    </xsl:template>
    
   
    
</xsl:stylesheet>