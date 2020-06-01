<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <xsl:output method="text"/>
    
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <xsl:for-each select="descendant::TEI">
            <xsl:variable name="witfile">
                <xsl:value-of select="tokenize(replace(base-uri(.), '.xml', ''), '/')[last()]"/>
           </xsl:variable>
            <xsl:result-document href="{concat($witfile,'.tsv')}">
        <xsl:text>form&#09;lemma&#09;POS&#09;morph&#10;</xsl:text>
        <xsl:apply-templates select="//w"/>
        </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="w">
        <xsl:value-of select="replace(., '\s+', '')"/>
        <xsl:text>&#09;</xsl:text>
        <xsl:value-of select="@lemma"/>
        <xsl:text>&#09;</xsl:text>
        <xsl:value-of select="@pos"/>
        <xsl:text>&#09;</xsl:text>
        <xsl:value-of select="@msd"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>