<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    xmlns:saxon="http://saxon.sf.net/"
    version="2.0"
    xmlns:my="my:my">
    
    <xsl:output method="xml" encoding="UTF-8" indent="yes" />
    
    <xsl:variable name="seq" select="//(w | pc)" />
    
    <xsl:function name="my:index-of" as="xs:integer*">
        <xsl:param name="pSeq" as="node()*"/>
        <xsl:param name="pNode" as="node()"/>
        <xsl:sequence select="for $s in (1 to count($pSeq)) return $s[$pSeq[$s] is $pNode]"/>
    </xsl:function>
    
    <xsl:template match="w | pc" saxon:threads="8">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="xml:id">
                <xsl:value-of select="my:index-of($seq, .)" />
            </xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>