<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" version="3.0" xmlns:my="LOCALHOST">
    <xsl:strip-space elements="*" />
    
    <xsl:function name="my:no-accent">
        <xsl:param name="string"/>
        <xsl:value-of select="translate($string, 'áàâäéèêëíìîïóòôöúùûü', 'aaaaeeeeiiiioooouuuu')"/>
    </xsl:function>
    
    
    
    <xsl:output method="text" indent="yes"/>
    
    <xsl:template match="tei:TEI">
        <xsl:variable name="witfile">
            <xsl:value-of select="tokenize(replace(base-uri(.), '.xml', ''), '/')[last()]"/>
            <!-- récupération du nom du fichier courant -->
        </xsl:variable>
        <xsl:result-document
            href="{concat('/Users/arianepinche/Dropbox/transcription/txt/reg/',$witfile, '.reg', '.txt')}"
            method="html" indent="yes">
            <xsl:variable name="adresse">
                <xsl:value-of select="tokenize(tei:body/@n, ':')[last()]"/>
                <!-- récupération dans l'uri uniquement du nom du document -->
            </xsl:variable>
            <xsl:apply-templates select=".//tei:body"/>
        </xsl:result-document>
    </xsl:template>
    <xsl:template match="tei:body/tei:div">
        <xsl:apply-templates select="./tei:div"/>
    </xsl:template>
    
    <xsl:template match="tei:l">
        <xsl:apply-templates/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:lg">
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <xsl:apply-templates/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:template match="tei:persName|tei:placeName">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:choice">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:app">
        <xsl:apply-templates select="tei:lem"/>
    </xsl:template>
    
    <xsl:template match="tei:corr">
        <xsl:choose>
            <xsl:when test="@type = 'add'">
                <xsl:text>[</xsl:text>
                <xsl:apply-templates/>
                <xsl:text>]</xsl:text>
            </xsl:when>
            <xsl:when test="@type = 'del'">
                <xsl:text>(</xsl:text>
                <xsl:apply-templates/>
                <xsl:text>)</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!-- éléments régularisés -->
    
    <xsl:template match="tei:expan">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:ex">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:pc">
        <xsl:choose>
            <xsl:when test="@type='reg'">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="not(@type)">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:said">
        <xsl:text>"</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>"</xsl:text>
    </xsl:template>
    
    <!-- suppression des éléments de la visualisation facsimilaire -->
    <xsl:template match="tei:orig"/>
       
    <xsl:template match="tei:sic"/>
      
    <xsl:template match="tei:abbr"/>
  
    
    <xsl:template match="tei:hi[@rend]">
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <!-- saut de page et de colonne + espace -->
   
    
    <xsl:template match="tei:cb">
        <xsl:text>&#160;[ fol. </xsl:text>
        <xsl:value-of select="preceding::tei:pb[1]/@n"/>
        <xsl:value-of select="@n"/>
        <xsl:text>]&#160;</xsl:text>
    </xsl:template>
    
   <!-- Suppression des notes -->
    <xsl:template match="tei:note"/>
    
    
</xsl:stylesheet>