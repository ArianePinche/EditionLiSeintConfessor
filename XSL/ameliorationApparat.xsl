<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"></xsl:output>
    
    <xsl:template match="/">
        
        <xsl:apply-templates select="descendant::rdg"/>
        
    </xsl:template>
    
    <xsl:template match="rdg">
        <xsl:if test="@cause">
        <app>    
        <xsl:copy-of select="preceding-sibling::lem"/>    
        <xsl:copy-of select="."/>
        </app>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>