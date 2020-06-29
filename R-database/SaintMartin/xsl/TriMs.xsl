<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei" version="2.0">
    <xsl:output method="xml" indent="yes" standalone="no"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="witness">
        <xsl:choose>
            <xsl:when test="contains(@xml:id, 'C2') or contains(@xml:id, 'C3')"/>
            <xsl:otherwise>
                <xsl:copy-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
   

    <xsl:template match="app">
        <xsl:choose>
            <xsl:when
                test="rdg[not(contains(@wit, 'C1') or contains(@wit, 'E2') or contains(@wit, 'D') or contains(@wit, 'G1') or contains(@wit, 'M') or contains(@wit, 'N') or contains(@wit, 'F2'))]"/>
           
                <xsl:when
                    test="lem[not(contains(@wit, 'C1') or  contains(@wit, 'E2') or contains(@wit, 'D') or contains(@wit, 'G1') or contains(@wit, 'M') or contains(@wit, 'N') or contains(@wit, 'F2'))]"/>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:apply-templates select="node()|@*"/>
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="rdg">
        <xsl:choose>
            <xsl:when test="not(contains(@wit, 'C1') or  contains(@wit, 'E2') or contains(@wit, 'D') or contains(@wit, 'G1') or contains(@wit, 'M') or contains(@wit, 'N') or contains(@wit, 'F2'))"/>
            <xsl:otherwise>
                <xsl:element name="rdg">
                    <xsl:attribute name="wit" select="replace(@wit, '#C2|#C3', '')"/>
                        <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="lem">
                <xsl:element name="lem">
                    <xsl:attribute name="wit" select="replace(@wit, '#C2|#C3', '')"/>
                    <xsl:apply-templates/>
               </xsl:element>
    </xsl:template>
    

</xsl:stylesheet>
