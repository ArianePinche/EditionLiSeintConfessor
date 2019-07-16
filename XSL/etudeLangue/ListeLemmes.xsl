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
        
        <xsl:for-each-group select=".//w" group-by="@lemma">
            <xsl:sort select="current-grouping-key()" order="ascending" data-type="text"/>
           <xsl:choose>   
               <xsl:when test="contains(@type, 'NOMpro')"/>
               <xsl:when test="contains(@type, 'PON')"/>
               <xsl:when test="contains(@type, 'OUT')"/>
               <xsl:otherwise>
               <xsl:value-of select="current-grouping-key()"/>
            <xsl:text>&#9;</xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>&#9;</xsl:text>
            <xsl:for-each-group select="current-group()" group-by="text()">
                <xsl:sort select="text()" order="ascending" data-type="text"/>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#9;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#9;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
               </xsl:otherwise>
           </xsl:choose>
        </xsl:for-each-group>
    </xsl:template>
</xsl:stylesheet>
