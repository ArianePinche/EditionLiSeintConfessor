<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="text" encoding="UTF-8"/>

    <xsl:template match="teiCorpus">
        <xsl:text>Calcul des pays représentés dans l'index général : &#10;</xsl:text>
        <xsl:for-each-group select="teiHeader/descendant::place" group-by="country[@type = 'pays']">
            <xsl:sort select="count(current-group())" order="descending"/>
            <xsl:value-of select="current-grouping-key()"/>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="count(current-group()) div count(ancestor::teiHeader/descendant::place) * 100"/>
            <xsl:text>% ) :&#10;</xsl:text>
            <xsl:for-each select="current-group()">
                <xsl:value-of select="placeName"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Calcul de pays représentés dans le corpus complet en fonction des occurences de noms de lieux : &#10;</xsl:text>
        <xsl:for-each-group select="teiHeader/descendant::place" group-by="country[@type = 'pays']">
            <xsl:sort select="count(current-group())" order="descending"/>
            <xsl:variable name="id" as="item()*">
                <xsl:for-each select="current-group()">
                    <xsl:value-of select="@xml:id"/>
                </xsl:for-each>
            </xsl:variable>

            <xsl:value-of select="current-grouping-key()"/>
            <xsl:text> : </xsl:text>
            <xsl:variable name="occurrences"
                select="count(ancestor::teiCorpus/descendant::TEI/descendant::body/descendant::placeName[replace(@ref, '#', '') = $id])"/>
            <xsl:value-of select="$occurrences"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="$occurrences div count(ancestor::teiCorpus/descendant::TEI/descendant::body/descendant::placeName) * 100"/><xsl:text>%&#10;</xsl:text>
        </xsl:for-each-group>   
    </xsl:template>
    
    <xsl:template match="TEI">
        <xsl:text>&#10;Calcul de pays représentés dans chaque Vies en fonction des occurences de noms de lieux : &#10;</xsl:text>
        <xsl:for-each-group select="teiHeader/descendant::place" group-by="country[@type = 'pays']">
            <xsl:sort select="count(current-group())" order="descending"/>
            <xsl:variable name="id" as="item()*">
                <xsl:for-each select="current-group()">
                    <xsl:value-of select="@xml:id"/>
                </xsl:for-each>
            </xsl:variable>
            
            <xsl:value-of select="current-grouping-key()"/>
            <xsl:text> : </xsl:text>
            <xsl:variable name="occurrences"
                select="count(ancestor::teiCorpus/descendant::TEI/descendant::body/descendant::placeName[replace(@ref, '#', '') = $id])"/>
            <xsl:value-of select="$occurrences"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="$occurrences div count(ancestor::teiCorpus/descendant::TEI/descendant::body/descendant::placeName) * 100"/><xsl:text>%&#10;</xsl:text>
        </xsl:for-each-group>   
    </xsl:template>


</xsl:stylesheet>
