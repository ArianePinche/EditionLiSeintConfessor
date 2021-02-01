<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="descendant::lg"/>
    </xsl:template>
    
    <xsl:template match="lg">
        <xsl:value-of select="ancestor::TEI/teiHeader/descendant::titleStmt/title"/><xsl:text> (</xsl:text>
        <xsl:value-of select="ancestor::div[@type='chapter']/@n"/><xsl:text>.</xsl:text><xsl:value-of select="ancestor::div[@type='section']/@n"/><xsl:text>)&#10;</xsl:text>
        <xsl:apply-templates select="l"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:template match="l|persName|placeName" >
        <xsl:apply-templates/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    <xsl:template match="note"/>
    
    
    <xsl:template match="app">
        <xsl:apply-templates select="lem"/>
    </xsl:template>
    
    <xsl:template match="text()">
        <xsl:value-of select="." disable-output-escaping="yes" />
    </xsl:template>
    
    <xsl:template match="choice">
        <xsl:value-of select="text()| .//reg/text() | .//expan/text() | .//ex/text() | .//corr/text()"/>
    </xsl:template>
    
    <xsl:template match="pc[@type='reg']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="note|lb"/>
    
   
</xsl:stylesheet>