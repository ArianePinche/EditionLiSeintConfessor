<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="text" encoding="UTF-8"/>

    <xsl:template match="teiCorpus">
        <xsl:text>Calcul des pays représentés dans l'index général : &#10;</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Pays&#09;Nb_Occurences&#09;%</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select="teiHeader/descendant::place" group-by="country[@type = 'pays']">
            <xsl:sort select="count(current-group())" order="descending"/>
            <xsl:value-of select="current-grouping-key()"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of
                select="count(current-group()) div count(ancestor::teiHeader/descendant::place) * 100"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
        
        <xsl:text>Calcul des civilisations représentées dans l'index général : &#10;</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Civ.&#09;Nb_Occurences&#09;%</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select="teiHeader/descendant::place" group-by="country[@type = 'civilisation']">
            <xsl:sort select="count(current-group())" order="descending"/>
            <xsl:value-of select="current-grouping-key()"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of
                select="count(current-group()) div count(ancestor::teiHeader/descendant::place) * 100"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
        
        <xsl:text>Calcul de pays représentés dans le corpus complet en fonction des occurrences de noms de lieux : &#10;</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Pays&#09;Nb_Occurences&#09;%</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select="teiHeader/descendant::place" group-by="country[@type = 'pays']">
            <xsl:sort select="count(current-group())" order="descending"/>
            <xsl:variable name="id" as="item()*">
                <xsl:for-each select="current-group()">
                    <xsl:value-of select="@xml:id"/>
                </xsl:for-each>
            </xsl:variable>
            <xsl:value-of select="current-grouping-key()"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:variable name="occurrences"
                select="count(ancestor::teiCorpus/descendant::TEI/descendant::body/descendant::placeName[replace(@ref, '#', '') = $id])"/>
            <xsl:value-of select="$occurrences"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of
                select="$occurrences div count(ancestor::teiCorpus/descendant::TEI/descendant::body/descendant::placeName) * 100"/><xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>
        
        <xsl:text>Calcul de civilisations dans le corpus complet en fonction des occurrences de noms de lieux : &#10;</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Civ.&#09;Nb_Occurences&#09;%</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select="teiHeader/descendant::place" group-by="country[@type = 'civilisation']">
            <xsl:sort select="count(current-group())" order="descending"/>
            <xsl:variable name="id" as="item()*">
                <xsl:for-each select="current-group()">
                    <xsl:value-of select="@xml:id"/>
                </xsl:for-each>
            </xsl:variable>
            <xsl:value-of select="current-grouping-key()"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:variable name="occurrences"
                select="count(ancestor::teiCorpus/descendant::TEI/descendant::body/descendant::placeName[replace(@ref, '#', '') = $id])"/>
            <xsl:value-of select="$occurrences"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of
                select="$occurrences div count(ancestor::teiCorpus/descendant::TEI/descendant::body/descendant::placeName) * 100"/><xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>
        
        <xsl:text>&#10;Calcul de pays représentés dans chaque Vies en fonction des occurrences de noms de lieux&#10;</xsl:text>
        <xsl:apply-templates select="TEI"/>
        
        <xsl:text>&#10;Calcul des pays représentés en fonction de la séries&#10;</xsl:text>
       
        <xsl:text>Pays&#09;serie&#09;Nb_Occurences&#09;%&#09;serie&#09;Nb_Occurences&#09;%</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select="teiHeader/descendant::place" group-by="country[@type = 'pays']">
            <xsl:sort select="count(current-group())" order="descending"/>
            <xsl:variable name="id" as="item()*">
                <xsl:for-each select="current-group()">
                    <xsl:value-of select="@xml:id"/>
                </xsl:for-each>
            </xsl:variable>
            <xsl:value-of select="current-grouping-key()"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:variable name="occurrencesID" select="ancestor::teiCorpus/descendant::TEI/descendant::body/descendant::placeName[replace(@ref, '#', '') = $id]"/>
            <xsl:for-each-group select="$occurrencesID" group-by="ancestor::teiCorpus/descendant::TEI/@type">
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(ancestor::teiCorpus/descendant::TEI[@type=current-grouping-key()]/descendant::body/descendant::placeName[replace(@ref, '#', '') = $id])"/><xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count((ancestor::teiCorpus/descendant::TEI[@type=current-grouping-key()]/descendant::body/descendant::placeName[replace(@ref, '#', '') = $id])) div count(current-group()) * 100"/><xsl:text>&#09;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>   
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Civ.&#09;Nb_Occurences&#09;%</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select="teiHeader/descendant::place" group-by="country[@type = 'civilisation']">
            <xsl:sort select="count(current-group())" order="descending"/>
            <xsl:variable name="id" as="item()*">
                <xsl:for-each select="current-group()">
                    <xsl:value-of select="@xml:id"/>
                </xsl:for-each>
            </xsl:variable>
            <xsl:value-of select="current-grouping-key()"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:variable name="occurrencesID" select="ancestor::teiCorpus/descendant::TEI/descendant::body/descendant::placeName[replace(@ref, '#', '') = $id]"/>
            <xsl:for-each-group select="$occurrencesID" group-by="ancestor::teiCorpus/descendant::TEI/@type">
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(ancestor::teiCorpus/descendant::TEI[@type=current-grouping-key()]/descendant::body/descendant::placeName[replace(@ref, '#', '') = $id])"/><xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count((ancestor::teiCorpus/descendant::TEI[@type=current-grouping-key()]/descendant::body/descendant::placeName[replace(@ref, '#', '') = $id])) div count(current-group()) * 100"/><xsl:text>&#09;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>   
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:template match="TEI">
        <xsl:value-of select="descendant::titleStmt/title"/><xsl:text>&#10;</xsl:text>
        <xsl:text>Pays&#09;Nb_Occurences&#09;%</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select="teiHeader/descendant::place" group-by="country[@type = 'pays']">
            <xsl:sort select="count(current-group())" order="descending"/>
            <xsl:variable name="id" as="item()*">
                <xsl:for-each select="current-group()">
                    <xsl:value-of select="@xml:id"/>
                </xsl:for-each>
            </xsl:variable>
            <xsl:value-of select="current-grouping-key()"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:variable name="occurrencesID" select="ancestor::TEI/descendant::body/descendant::placeName[replace(@ref, '#', '') = $id]"/>
                <xsl:value-of select="count($occurrencesID)"/><xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count($occurrencesID) div count(ancestor::TEI/descendant::body/descendant::placeName) * 100"/><xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>   

        <xsl:text>Civ.&#09;Nb_Occurences&#09;%</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select="teiHeader/descendant::place" group-by="country[@type = 'civilisation']">
            <xsl:sort select="count(current-group())" order="descending"/>
            <xsl:variable name="id" as="item()*">
                <xsl:for-each select="current-group()">
                    <xsl:value-of select="@xml:id"/>
                </xsl:for-each>
            </xsl:variable>
            <xsl:value-of select="current-grouping-key()"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:variable name="occurrencesID" select="ancestor::TEI/descendant::body/descendant::placeName[replace(@ref, '#', '') = $id]"/>
            <xsl:value-of select="count($occurrencesID)"/><xsl:text>&#09;</xsl:text>
            <xsl:value-of select="count($occurrencesID) div count(ancestor::TEI/descendant::body/descendant::placeName) * 100"/><xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>   
        <xsl:text>&#10;</xsl:text>
        
        
        
    </xsl:template>


</xsl:stylesheet>
