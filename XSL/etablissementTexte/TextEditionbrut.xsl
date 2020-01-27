<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
        xpath-default-namespace="http://www.tei-c.org/ns/1.0"
        exclude-result-prefixes="xs" version="2.0">    
        <xsl:output method="xml" indent="yes"/>
        <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <div type="text">
            <xsl:apply-templates select="descendant::body"/>
        </div>
    </xsl:template>
    <xsl:template match="div">
        <div>
            <xsl:apply-templates/>
        </div>   
    </xsl:template>
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>   
    </xsl:template>
    <xsl:template match="lg">
        <p>
            <xsl:apply-templates/>
        </p>   
    </xsl:template>
    
    <xsl:template match="head"/>
    
    <xsl:template match="choice">
        <xsl:apply-templates select="reg | expan | ex | corr | pc"/>
    </xsl:template>
    
    <xsl:template match="pc">
        <xsl:if test="@type='reg'">
        <xsl:value-of select="."/>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template match="hi[contains(rend, 'orig')]"/>
    
    <xsl:template match="corr[@type='del']"/>
        
    
    <xsl:template match="app">
        <xsl:choose>
            <xsl:when test="rdg[contains(@wit, 'G1')]">
                <choix>
                <Edition>
                    <xsl:apply-templates select="lem"/>
                </Edition>
                <xsl:element name="G1">
                    <xsl:attribute name="type">
                        <xsl:choose>
                            <xsl:when test="rdg[@type|@cause]">
                                <xsl:value-of select="rdg/@type | rdg/@cause"/>
                            </xsl:when>
                            <xsl:otherwise>semantique</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                    <xsl:apply-templates select="rdg[contains(@wit, 'G1')]"/>
                </xsl:element>
                </choix>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="lem"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    
</xsl:stylesheet>