<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://fn.com"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <!-- Fonction pour normaliser le texte en unicode et sans accent -->
    <xsl:function name="fn:normalize">
        <xsl:param name="input"/>
        <xsl:value-of
            select="translate(normalize-unicode(lower-case($input), 'NFKD'), 'áàâäéèêëíìîïóòôöúùûü', 'aaaaeeeeiiiioooouuuu')"
        />
    </xsl:function>
    <xsl:output method="text"/>

    <xsl:template match="/">
        
        <xsl:text>Dissimilation de O $37&#10;</xsl:text>
        <xsl:call-template name="occurrencesPhen">
            <xsl:with-param name="condition" select="//w[matches(fn:normalize(@lemma), 'corrocier|doloros|escomeniier|glotonerie|onorer|onor')]"/>
        </xsl:call-template>
        <xsl:text>Dissimilation de i $37&#10;</xsl:text>
        <xsl:call-template name="occurrencesPhen">
            <xsl:with-param name="condition" select="//w[matches(fn:normalize(@lemma), 'ph(i|e)lippe|porriture|privilege|religïon|signifi|sicile|visiter|iprocrisie')]"/>
        </xsl:call-template>
    </xsl:template>


    <xsl:template name="occurrencesPhen">
        <xsl:param name="condition" required="yes"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Mot&#09;Nombres d'occurrences total&#09;Nombre d'occurrences&#10;</xsl:text>
        <xsl:for-each-group select="$condition" group-by="fn:normalize(@lemma)">
            <xsl:sort select="current-grouping-key()" order="ascending"/>
            <xsl:variable name="lemma" select="current-grouping-key()"/>
            <xsl:text>Lemme : </xsl:text>
            <xsl:value-of select="$lemma"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="count(//w[fn:normalize(@lemma) = $lemma])"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[fn:normalize(@lemma) = $lemma]"
                group-by="fn:normalize(text())">
                <xsl:sort select="current-grouping-key()" order="ascending"/>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <!-- Règle pour repérer les alternances graphiques -->
    <xsl:template name="occurrencesAlt">
        <!-- condition 1 = xpath + graphie attendue -->
        <xsl:param name="condition1" required="yes"/>
        <!--condtion 1 = graphie alternative -->
        <xsl:param name="condition2" required="yes"/>
        <xsl:text>Mot&#09;Nombre total&#09;Nombre d'occurrences en condition 1&#09;Nombre d'occurrences condition 2&#10;</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select="$condition1" group-by="fn:normalize(@lemma)">
            <xsl:sort select="current-grouping-key()" order="ascending"/>
            <xsl:variable name="lemma" select="current-grouping-key()"/>
            <xsl:if test="//w[fn:normalize(@lemma) = current-grouping-key() and matches(fn:normalize(text()), $condition2)]">
                <xsl:text>Lemme : </xsl:text>
                <xsl:value-of select="$lemma"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(//w[fn:normalize(@lemma) = $lemma])"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of
                    select="count(//w[fn:normalize(@lemma) = current-grouping-key() and matches(fn:normalize(text()), $condition2)])"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:for-each-group select="//w[fn:normalize(@lemma) = $lemma]"
                    group-by="fn:normalize(text())">
                    <xsl:sort select="current-grouping-key()" order="ascending"/>
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>&#10;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

</xsl:stylesheet>
