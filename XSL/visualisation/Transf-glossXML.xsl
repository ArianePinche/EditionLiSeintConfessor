<?xml version="1.0" encoding="UTF-8"?>

    <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
        xmlns="http://www.tei-c.org/ns/1.0"
        xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
        exclude-result-prefixes="xs tei" 
        version="2.0">
        <xsl:template match="TEI">
            <xsl:copy-of select="teiHeader"/>
            <xsl:element name="text">
            <xsl:apply-templates select="body"/>
            </xsl:element>
        </xsl:template>
        
</xsl:stylesheet>