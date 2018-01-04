<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    xmlns:my="my:my"
    version="2.0">
    
    <xsl:output method="xml" encoding="UTF-8"/>
    
    <xsl:strip-space elements="tei:choice"/>
    <xsl:strip-space elements="tei:reg"/>
    <xsl:strip-space elements="tei:expan"/>
    <xsl:strip-space elements="tei:ex"/>
    <xsl:strip-space elements="tei:hi"/>
    
    <xsl:template match="orig" />
    <xsl:template match="abbr" />
    <xsl:template match="profileDesc"/>
    <xsl:template match="lb"/>
    
    <xsl:template match="pb"/>
    <xsl:template match="cb"/>
    <xsl:template match="pc[@type = 'orig']" />
    <xsl:template match="ex"><xsl:apply-templates /></xsl:template>
    <xsl:template match="expan"><xsl:apply-templates /></xsl:template>
    <xsl:template match="persName"><xsl:apply-templates /></xsl:template>
    <xsl:template match="placeName"><xsl:apply-templates /></xsl:template>
    <xsl:template match="choice"><xsl:apply-templates /></xsl:template>
    <xsl:template match="reg"><xsl:apply-templates /></xsl:template>
    <xsl:template match="hi"><xsl:apply-templates /></xsl:template>
    <xsl:template match="note" />
    <xsl:template match="pc">
        <xsl:choose>
            <xsl:when test="normalize-space(./text()) = ''  or ./text() = '&#160;'"><xsl:text> </xsl:text></xsl:when>
           <xsl:otherwise><xsl:apply-templates /></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="node() | @*">
        
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    
</xsl:stylesheet>