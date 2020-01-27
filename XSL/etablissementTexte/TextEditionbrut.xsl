<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
        xpath-default-namespace="http://www.tei-c.org/ns/1.0"
        exclude-result-prefixes="xs" version="2.0">    
        <xsl:output method="text"/>
        <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <div type="text">
            <xsl:apply-templates select="descendant::body"/>
        </div>
    </xsl:template>
    
    
</xsl:stylesheet>