<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs tei" xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">

        
    <xsl:template match="/">
        <xsl:result-document doctype-system="{processing-instruction('doctype-system')}">
            <xsl:apply-templates/>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="TEI">
        <xsl:variable name="witfile">
            <xsl:value-of select="tokenize(replace(base-uri(.), '.xml','_'), '/')[last()]"/>
            <!-- récupération du nom du fichier courant -->
        </xsl:variable>
    <xsl:result-document href="../../../LiSeinConfessorPandora/data/input/{concat($witfile, '_Pandora', '.xml')}" method="xml">
        <xsl:element name="TEI">
                <xsl:apply-templates/>
        </xsl:element>
    </xsl:result-document>
    </xsl:template>

    <xsl:strip-space elements="choice"/>
    <xsl:strip-space elements="reg"/>
    <xsl:strip-space elements="expan"/>
    <xsl:strip-space elements="ex"/>
    <xsl:strip-space elements="hi"/>

    <xsl:template match="orig"/>
    <xsl:template match="abbr"/>
    <xsl:template match="profileDesc"/>
    <xsl:template match="lb"/>
    <xsl:template match="head"/>

    <xsl:template match="pb"/>
    <xsl:template match="cb"/>
    <xsl:template match="pc[@type = 'orig']"/>
    <xsl:template match="seg[@type='number']"/>
    
    <xsl:template match="ex">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="expan">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="corr">
        <xsl:apply-templates/>
    </xsl:template>
    
      
    <xsl:template match="persName">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="placeName">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="choice">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="reg">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="hi">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="note"/>
    <xsl:template match="pc">
        <xsl:choose>
            <xsl:when test="normalize-space(./text()) = '' or ./text() = '&#160;'">
                <xsl:text> </xsl:text>
            </xsl:when>
            <xsl:when test="@type='orig'">
                <xsl:text/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="rdg"/>
    <xsl:template match="lem">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
        
    <!-- essai ajout seg 
    <xsl:template match="text()">
        <xsl:if test=".='.'">
            <xsl:element name="seg">
                
            </xsl:element>
        </xsl:if>
    </xsl:template>
-->
 </xsl:stylesheet>
