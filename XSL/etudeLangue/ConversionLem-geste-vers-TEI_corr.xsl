<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
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
            <teiHeader>
            <fileDesc>
                <titleStmt>
                    <title><xsl:choose>
                            <xsl:when test="matches(base-uri(.), '1857')"><xsl:text>Vie de Saint Martin</xsl:text></xsl:when>
                            <xsl:when test="matches(base-uri(.), '2117')"><xsl:text>Dialogues sur les Vertues de saint Martin</xsl:text></xsl:when>
                            <xsl:when test="matches(base-uri(.), '1743')"><xsl:text>Vie de saint Brice </xsl:text></xsl:when>
                            <xsl:when test="matches(base-uri(.), '2000')"><xsl:text>Vie de saint Gilles </xsl:text></xsl:when>
                            <xsl:when test="matches(base-uri(.), '1761')"><xsl:text>Vie de saint Marcel </xsl:text></xsl:when>  
                            <xsl:when test="matches(base-uri(.), '2114')"><xsl:text>Vie de saint Nicolas </xsl:text></xsl:when>
                            <xsl:when test="matches(base-uri(.), '1742')"><xsl:text>Vie de saint Jérôme </xsl:text></xsl:when>
                            <xsl:when test="matches(base-uri(.), '1744')"><xsl:text>Vie de saint Benoit </xsl:text></xsl:when>
                            <xsl:when test="matches(base-uri(.), '1994')"><xsl:text>Vie de saint Alexis </xsl:text></xsl:when>
                     </xsl:choose>lemmatisée</title>
                    <author>Wauchier de Denain</author>
                    <respStmt>
                        <resp>Transcription et lemmatisation</resp>
                        <persName>Ariane Pinche</persName>
                    </respStmt>
                </titleStmt>
                <publicationStmt>
                    <p>Publication Information</p>
                </publicationStmt>
                <sourceDesc>
                    <p>Lemmatisation issue de Pyrrha :
                        lemmatisation issue de Pie avec le modèle de lemmatisation pour l'ancien français de l'école nationale des chartes.
                        lemmatisation corrigée grâce à l'interface de correction de Pyrrha.
                        <ref target="https://doi.org/10.5281/zenodo.2325428">Pyrrha : Clérice, T., Pilla, J. et Camps, J.-B. (2018).hipster-philology/pyrrha: 1.0.1.</ref>
                        <ref target="emanjavacas/pie v0.2.3. https://doi.org/10.5281/zenodo.1637878">Pie : Manjavacas, E., Kestemont, M et Clérice, T. (2019).</ref>
                        <ref target="https://doi.org/10.5281/zenodo.3237455">Modèle pour l'ancien français : Clérice. T. (2019). chartes/deucalion-model-af: 0.2.0.</ref>
                    </p>
                </sourceDesc>
            </fileDesc>
            </teiHeader>
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
    <xsl:template match="div">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="ab">
        <xsl:copy>
            <xsl:apply-templates/>
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