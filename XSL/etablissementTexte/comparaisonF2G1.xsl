<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    
    <xsl:output method="text"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <xsl:result-document href="{concat('../../resultats/app/comparaisonF2G1' , '.tsv')}">
            <xsl:apply-templates select="descendant::teiHeader"/>
            <xsl:apply-templates select="descendant::body"/>
        </xsl:result-document>
    </xsl:template>
    <xsl:variable name="temoin1" select="'#G1'"/>
    <xsl:variable name="temoin2" select="'#F2'"/>
    <xsl:variable name="leçonsVariantes">
        <xsl:value-of select="count(//rdg[contains(@wit, $temoin1) and contains(@wit, $temoin2)])"/>
    </xsl:variable>
    
    
    <xsl:template match="teiHeader"/>
    
    <xsl:template match="body">
        <xsl:text>Nb de leçons communes entre les deux témoins :</xsl:text>
        <xsl:value-of select="count(//rdg[contains(@wit, $temoin1) and contains(@wit,$temoin2)])"/><xsl:text>&#10;</xsl:text>
        <xsl:text>Nb de leçons divergentes entre les deux témoins </xsl:text><xsl:value-of select="$temoin1"/><xsl:text> sans </xsl:text>><xsl:value-of select="$temoin2"/><xsl:text>: </xsl:text>
        <xsl:value-of select="count(//rdg[contains(@wit, $temoin1) and not(contains(@wit, $temoin2))])"/><xsl:text>&#10;</xsl:text>
        <xsl:text>Nb de leçons divergentes entre les deux témoins </xsl:text><xsl:value-of select="$temoin2"/><xsl:text> sans </xsl:text>><xsl:value-of select="$temoin1"/><xsl:text>: </xsl:text>
        <xsl:value-of select="count(//rdg[contains(@wit, $temoin2) and not(contains(@wit, $temoin1))])"/><xsl:text>&#10;</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:call-template name="rdgOm">
        </xsl:call-template>
        <xsl:call-template name="rdgSem">
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="rdgOm">
        <xsl:for-each-group select="//rdg[contains(@wit, $temoin1) and contains(@wit, $temoin2) and @cause]" group-by="@cause">
            <xsl:sort select="@cause"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:value-of select="current-grouping-key()"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Pourcentage : </xsl:text>
            <xsl:value-of select="count(current-group()) div $leçonsVariantes * 100"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Pourcentage de leçons uniquement avec les deux témoins : </xsl:text>
            <xsl:value-of select="count(current-group()[@wit='#F2 #G1']) div count(current-group()) * 100"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Lemme </xsl:text><xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="current-group()" group-by="preceding-sibling::lem">
                <xsl:sort select="count(current-group())"  order="descending"/>
                <xsl:apply-templates select="preceding-sibling::lem"/>
                <xsl:if test="preceding-sibling::lem[@wit]">
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="preceding-sibling::lem/@wit"/>
                    <xsl:text>)</xsl:text>
                </xsl:if>
                <xsl:text>&#09;</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="."/>
                <xsl:text> (</xsl:text>
                <xsl:value-of select="replace(@wit, '#', '')"/>
                <xsl:text>)</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:template name="rdgSem">
        <xsl:text>&#10;Leçons d'ordre sémantique (</xsl:text>
        <xsl:value-of select="count(//rdg[contains(@wit, $temoin1) and contains(@wit, $temoin2) and not(@cause|@type)])"/><xsl:text>)</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Pourcentage : </xsl:text>
        <xsl:value-of select="count(//rdg[contains(@wit, $temoin1) and contains(@wit, $temoin2) and not(@cause|@type)]) div $leçonsVariantes * 100"/>
        <xsl:text>&#10;</xsl:text>
       <xsl:text>Pourcentage de leçons uniquement avec les deux témoins : </xsl:text>
        <xsl:value-of select="count(//rdg[@wit='#F2 #G1' and not(@cause|@type)]) div count(//rdg[contains(@wit, $temoin1) and contains(@wit, $temoin2) and not(@cause|@type)]) * 100"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>&#10;</xsl:text> 
        <xsl:text>Lemme </xsl:text><xsl:text>&#09;</xsl:text><xsl:text>Leçon</xsl:text><xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select="//rdg[contains(@wit, $temoin1) and contains(@wit, $temoin2) and not(@cause|@type)]" group-by="text()">
            <xsl:sort select="count(current-group())" order="descending"/>    
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
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    
    
    
    <xsl:template match="choice">
        <xsl:value-of select="reg | expan | ex | corr"/>
    </xsl:template>
    
    
</xsl:stylesheet>
