<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="text"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <xsl:apply-templates select="descendant::teiHeader"/>
        <xsl:apply-templates select="descendant::body"/>
    </xsl:template>

    <xsl:template match="teiHeader"/>

    <xsl:template match="body">
        <xsl:text>Nb de leçons divergente entre l'édition et G1 :</xsl:text>
        <xsl:value-of select="count(//rdg[contains(@wit, '#G1')])"/><xsl:text>&#10;</xsl:text>
        <xsl:call-template name="rdgType"/>
        <xsl:call-template name="rdgOm"/>
        <xsl:call-template name="rdgSem"/>
    </xsl:template>

    <xsl:template name="rdgType">
        <xsl:for-each-group select="//rdg[contains(@wit, '#G1') and @type]" group-by="@type">
            <xsl:sort select="@type"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:value-of select="current-grouping-key()"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Pourcentage : </xsl:text>
            <xsl:value-of select="count(current-group()) div 2206 * 100"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Lemme </xsl:text><xsl:text>&#09;</xsl:text><xsl:text>leçon</xsl:text><xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="current-group()" group-by="text()">
                <xsl:sort select="current-grouping-key()"/>
                <xsl:apply-templates select="preceding-sibling::lem"/>
                <xsl:if test="preceding-sibling::lem[@wit]">
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="preceding-sibling::lem/@wit"/>
                    <xsl:text>)</xsl:text>
                </xsl:if>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="."/>
                <xsl:text> (</xsl:text>
                <xsl:value-of select="replace(@wit, '#', '')"/>
                <xsl:text>)</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:template>
    
    <xsl:template name="rdgOm">
        <xsl:for-each-group select="//rdg[contains(@wit, '#G1') and @cause]" group-by="@cause">
            <xsl:sort select="@cause"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:value-of select="current-grouping-key()"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Pourcentage : </xsl:text>
            <xsl:value-of select="count(current-group()) div 2206 * 100"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Lemme </xsl:text><xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="current-group()" group-by="preceding-sibling::lem">
                <xsl:sort select="current-grouping-key()"/>
                <xsl:apply-templates select="preceding-sibling::lem"/>
                <xsl:if test="preceding-sibling::lem[@wit]">
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="preceding-sibling::lem/@wit"/>
                    <xsl:text>)</xsl:text>
                </xsl:if>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
        </xsl:for-each-group>
    </xsl:template>
    
    <xsl:template name="rdgSem">
        <xsl:text>&#10;Leçons d'ordre sémantique (</xsl:text>
        <xsl:value-of select="count(//rdg[contains(@wit, '#G1') and not(@cause|@type)])"/><xsl:text>)</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Pourcentage : </xsl:text>
        <xsl:value-of select="count(//rdg[contains(@wit, '#G1') and not(@cause|@type)]) div 2206 * 100"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Lemme </xsl:text><xsl:text>&#09;</xsl:text><xsl:text>Leçon</xsl:text><xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select="//rdg[contains(@wit, '#G1') and not(@cause|@type)]" group-by="text()">
            <xsl:sort select="current-grouping-key()"/>    
            <xsl:apply-templates select="preceding-sibling::lem"/>
                <xsl:if test="preceding-sibling::lem[@wit]">
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="preceding-sibling::lem/@wit"/>
                    <xsl:text>)</xsl:text>
                </xsl:if>
                <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="replace(@wit, '#', '')"/>
            <xsl:text>)</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>
    </xsl:template>
    
    


    <xsl:template match="choice">
        <xsl:value-of select="reg | expan | ex | corr"/>
    </xsl:template>


</xsl:stylesheet>
