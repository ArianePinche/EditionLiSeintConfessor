<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
        xpath-default-namespace="http://www.tei-c.org/ns/1.0"
        exclude-result-prefixes="xs tei" version="2.0">    
        <xsl:output method="xml" indent="yes"/>
        <xsl:strip-space elements="*"/>
    
    <xsl:variable name="manuscrit" select="'E2'"/>
    
    
    <xsl:template match="/">
        <xsl:result-document href="{concat('../../resultats/',$manuscrit,'.xml')}">
        <div>
            <xsl:apply-templates select="descendant::body"/>
        </div>
        </xsl:result-document>
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
      <xsl:choose>
          <xsl:when test="@type='orig'"/>
          <xsl:otherwise>
              <xsl:apply-templates/>
          </xsl:otherwise>
      </xsl:choose>
    </xsl:template>
    
    <xsl:template match="lem">
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <xsl:template match="hi[contains(@rend, 'orig')]"/>
    
    <xsl:template match="corr[@type='del']"/>
        
    
    <xsl:template match="app">
        <xsl:choose>
            <xsl:when test="rdg[contains(@wit, $manuscrit)]">
                <choix>
                <Edition>
                    <xsl:apply-templates select="lem"/>
                </Edition>
                <xsl:element name="{$manuscrit}">
                    <xsl:attribute name="type">
                        <xsl:choose>
                            <xsl:when test="rdg[contains(@wit, $manuscrit)][@type|@cause]">
                                <xsl:value-of select="rdg[contains(@wit, $manuscrit)]/@type | rdg[contains(@wit, $manuscrit)]/@cause"/>
                            </xsl:when>
                            <xsl:otherwise>semantique</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                    <xsl:apply-templates select="rdg[contains(@wit, $manuscrit)]"/>
                </xsl:element>
                </choix>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="lem"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    
</xsl:stylesheet>