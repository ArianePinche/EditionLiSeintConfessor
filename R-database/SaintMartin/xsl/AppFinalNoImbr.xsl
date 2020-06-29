<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" version="2.0">
    <xsl:output  method="xml" indent="yes" standalone="no" />
    <xsl:strip-space elements="*"/>
    <xsl:template match="/">
        <xsl:result-document href="SM_selection_Final.xml">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates/>
        </TEI>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader" >
        <xsl:element name="teiHeader" namespace="http://www.tei-c.org/ns/1.0">
            
            <xsl:element name="fileDesc" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>
        
    </xsl:template>
    <xsl:template match="tei:titleStmt">
        <xsl:copy-of select="."/>
    </xsl:template>
    <xsl:template match="tei:publicationStmt">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="tei:sourceDesc">
        <xsl:copy-of select="."/>
    </xsl:template>
    <xsl:template match="tei:profileDesc"/>
    <xsl:template match="tei:encodingDesc"/>
    
    <xsl:template match="tei:app">
            <xsl:for-each select=".">
                <xsl:element name="app" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:attribute name="n">
                        <xsl:number count="tei:app" format="1" level="any"/>
                    </xsl:attribute>
                    <xsl:element name="lem" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:attribute name="wit" select="tei:lem/@wit">
                        </xsl:attribute>
                        <xsl:value-of select="tei:lem/text()"/>
                    </xsl:element>
                   <xsl:copy-of select="tei:rdg"/>
                </xsl:element>
            </xsl:for-each>
            <xsl:apply-templates select="tei:lem/tei:app"/>
    </xsl:template>
     
    <xsl:template match="tei:text">
        <xsl:element name="text" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:element name="body" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:element name="p" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:apply-templates />
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
   
    
</xsl:stylesheet>
