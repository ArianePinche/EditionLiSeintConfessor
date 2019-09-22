<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="TEI">
        <xsl:for-each select=".">
            <xsl:variable name="witfile">
                <xsl:value-of select="replace(base-uri(.), '.xml', '')"/>
                <!-- récupération du nom du fichier courant -->
            </xsl:variable>
        <xsl:result-document href="{concat($witfile,'TEI','.xml')}">
        <xsl:copy>      
        <xsl:copy-of select="teiHeader"/>       
        <xsl:apply-templates select="text"/>
        </xsl:copy> 
        </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    <!-- copie les éléments de structuration du texte -->
    <xsl:template match="text|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>   
    <xsl:template match="body|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <!-- transformation de l'élément w 
        avec création d'un @pos (POS) et @msd(tags de morphologie) à la place de @type -->
    <xsl:template match="w">
        <xsl:element name="w" >
            <xsl:copy-of select="@xml:id"/>
            <xsl:copy-of select="@n"/>
            <xsl:copy-of select="@lemma"/> 
            <xsl:analyze-string select="@type" regex="^POS=([A-Za-z]+)\|(.*)">
           <xsl:matching-substring>
               <xsl:attribute name="pos" select="regex-group(1)"/>
               <xsl:attribute name="msd" select="regex-group(2)"/>
           </xsl:matching-substring>
               <xsl:non-matching-substring>
                   <xsl:message select="."/>
               </xsl:non-matching-substring>
           </xsl:analyze-string>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>   
</xsl:stylesheet>