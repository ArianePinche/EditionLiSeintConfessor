<?xml version="1.0" encoding="UTF-8"?>
<!-- source : https://github.com/Jean-Baptiste-Camps/Geste/blob/master/xsl/utils_tei_to_lemmaList.xsl
 @Jean-Baptiste-Camps Jean-Baptiste-Camps Travail referentiel lemmes
    1f4c975 on 9 Nov 2017
-->
<!-- fin chaucemente -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text"/>
    
    <xsl:variable name="mesDocs" select="collection('../xml/?select=*_pos.xml')"/>
    
    
    <xsl:template match="teiCorpus">
        <xsl:result-document href="../../resultats/lemmesNom+ADJ.tsv">
            <xsl:text>&#10;Substantifs</xsl:text>
            <xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select=".//w[matches(@type, 'NOMcom')]" group-by="@lemma">
            <xsl:sort select="count(current-group())" order="descending"/>
                        <xsl:value-of select="current-grouping-key()"/>
                        <xsl:text>&#9;</xsl:text>
                        <xsl:value-of select="count(current-group())"/>
                        <xsl:text>&#10;</xsl:text>
                    </xsl:for-each-group>
                    <xsl:text>&#10;Adjectifs</xsl:text>
            <xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select=".//w[matches(@type, 'ADJqua')]" group-by="@lemma">
            <xsl:sort select="count(current-group())" order="descending"/>
            <xsl:value-of select="current-grouping-key()"/>
            <xsl:text>&#9;</xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
