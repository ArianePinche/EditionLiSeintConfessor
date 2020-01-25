<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="TEI">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="teiHeader"/>
    
    <xsl:template match="text">
        <xsl:apply-templates select="descendant::app"/>
    </xsl:template>
    
    <xsl:template match="app" name="app">
        <xsl:if test="rdg[contains(@wit, '#G1') and not(@type|@cause)]">
        <xsl:for-each select=".">
            <xsl:element name="app">
                <xsl:element name="lem">
                    <xsl:if test="lem[@wit]">
                <xsl:attribute name="wit">
                    <xsl:value-of select="lem/@wit"/>
                </xsl:attribute>
                    </xsl:if>
            <xsl:apply-templates select="lem"/>
            </xsl:element>
            <xsl:copy-of select="rdg"/>
            <xsl:text>&#10;</xsl:text></xsl:element>
        </xsl:for-each>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="choice">
        <xsl:value-of select="reg|expan|ex|corr"/>
    </xsl:template>
    
    
</xsl:stylesheet>