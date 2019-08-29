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
        <xsl:text>Alternance ar/er suivi de consonne&#10;</xsl:text>
        <!-- regex ar+cons -->
        <xsl:variable name="regex_ar_consonnes" select="'ar[hzrtpqsdfghjklmwxcvbn]'"/>
        <xsl:variable name="regex_er_consonnes" select="'er[hzrtpqsdfghjklmwxcvbn]'"/>

        <xsl:text>Mots avec ar/er&#10;</xsl:text>
        <xsl:for-each-group
            select="//w[matches(text(), $regex_ar_consonnes) and not(matches(@type, 'OUT|VER'))]"
            group-by="@lemma">
            <xsl:sort select="current-grouping-key()" order="ascending"/>
            <xsl:if
                test="//w[@lemma = current-grouping-key() and matches(text(), $regex_er_consonnes)]">
                <xsl:variable name="lemma" select="current-grouping-key()"/>
                <xsl:value-of select="$lemma"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(//w[@lemma = $lemma])"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(//w[@lemma = current-grouping-key() and matches(text(), $regex_er_consonnes)])"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:for-each-group select="//w[@lemma = $lemma]" group-by="lower-case(text())">
                    <xsl:sort select="current-grouping-key()" order="ascending"/>
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>&#10;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        
        <xsl:call-template name="occurrencesAlt">
            <xsl:with-param name="condition1" select="//w[matches(fn:normalize(text()), $regex_ar_consonnes) and not(matches(@type, 'OUT|VER'))]"/>
            <xsl:with-param name="condition2" select="$regex_er_consonnes"/>
        </xsl:call-template>
        
    </xsl:template>
    
    
    
    <xsl:template name="occurrencesAlt">
        <xsl:param name="condition1" required="yes"/>
        <xsl:param name="condition2" required="yes"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select="$condition1" group-by="@lemma">
            <xsl:sort select="current-grouping-key()" order="ascending"/>
            <xsl:variable name="lemma" select="current-grouping-key()"/>
            <xsl:if
                test="//w[@lemma = current-grouping-key() and matches(text(),$condition2)]">
                <xsl:value-of select="$lemma"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(//w[@lemma = $lemma])"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
            <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(//w[@lemma = current-grouping-key() and matches(text(),$condition2)])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = $lemma]" group-by="lower-case(text())">
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
    

    <xsl:template name="occurrencesPhen">
        <xsl:param name="condition" required="yes"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select="$condition" group-by="@lemma">
            <xsl:sort select="current-grouping-key()" order="ascending"/>
            <xsl:variable name="lemma" select="current-grouping-key()"/>
            <xsl:text>(</xsl:text>
            <xsl:value-of select="$lemma"/>
            <xsl:text>)&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = $lemma])"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = $lemma]" group-by="lower-case(fn:normalize(text()))">
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

</xsl:stylesheet>
