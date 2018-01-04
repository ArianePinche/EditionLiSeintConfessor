<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:strip-space elements="div"/>
    <xsl:output method="text" />
    <xsl:template match="head"/>
    <xsl:template match="p | said | l">
        <xsl:value-of select="normalize-space()"/>
    </xsl:template>
    <xsl:template match="TEI">
        <xsl:variable name="doc"><xsl:apply-templates /></xsl:variable>
        <xsl:variable name="doc2" select="$doc"/>
        <xsl:value-of select='$doc2'/>
    </xsl:template>
    
    <xsl:template match="teiHeader" />
    
</xsl:stylesheet>