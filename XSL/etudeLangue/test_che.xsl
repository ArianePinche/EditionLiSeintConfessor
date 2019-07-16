<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.tei-c.org/ns/1.0" xmlns:fn="http://fn.com"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">

    <xsl:param name="keep-false" select="false()"/>
    <!-- ((^\s*c)|([zrtpqsdfghjklmwxcvbn]c)) -->
    <xsl:variable name="regex_c" select="'^\s*c[^hzrtyuopqsdfghjklmwxcvbn]'"/>
    <xsl:variable name="regex_ch" select="'^\s*ch[^zrtyuopqsdfghjklmwxcvbn]'"/>
    <xsl:variable name="regex_ce" select="'^\s*c[^aäiïhzrtyuopqsdfghjklmwxcvbn]'"/>
    <xsl:variable name="regex_che" select="'^\s*ch[^aäiïhzrtyuopqsdfghjklmwxcvbn]'"/>
    <xsl:variable name="regex_ca" select="'^\s*c[^eëiïhzrtyuopqsdfghjklmwxcvbn]'"/>
    <xsl:variable name="regex_cha" select="'^\s*ch[^eëiïhzrtyuopqsdfghjklmwxcvbn]'"/>
    <xsl:variable name="regex_ci" select="'^\s*c[^aäeëhzrtyuopqsdfghjklmwxcvbn]'"/>
    <xsl:variable name="regex_chi" select="'^\s*ch[^aäeëhzrtyuopqsdfghjklmwxcvbn]'"/>
    <xsl:variable name="lemma_match" select="'^ch?[^zrtyuopqsdfghjklmwxcvbn]'"/>
    
    <xsl:function name="fn:normalize">
        <xsl:param name="input"/>
        <xsl:value-of select="translate(normalize-unicode(lower-case($input),'NFKD'), 'áàâäéèêëíìîïóòôöúùûü','aaaaeeeeiiiioooouuuu')"/>
    </xsl:function>
    
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <xsl:message select="normalize-unicode('éûü')"></xsl:message>
        <xsl:result-document href="../analyseCorpus.txt">
            <group>
                <xsl:attribute name="ch" select="count(//w[matches(fn:normalize(@lemma), $regex_ch)])"/>
                <xsl:attribute name="c" select="count(//w[matches(fn:normalize(@lemma), $regex_c)])"/>
                <xsl:attribute name="che" select="count(//w[matches(fn:normalize(@lemma), $regex_che)])"/>
                <xsl:attribute name="ce" select="count(//w[matches(fn:normalize(@lemma), $regex_ce)])"/>
                <xsl:attribute name="cha" select="count(//w[matches(fn:normalize(@lemme), $regex_cha)])"/>
                <xsl:attribute name="ca" select="count(//w[matches(fn:normalize(@lemma), $regex_ca)])"/>
                <xsl:attribute name="chi" select="count(//w[matches(fn:normalize(@lemma), $regex_chi)])"/>
                <xsl:attribute name="ci" select="count(//w[matches(fn:normalize(@lemma), $regex_ci)])"/>
                
            <xsl:for-each-group select="descendant::w[matches(fn:normalize(@lemma), $lemma_match)]" group-by="@lemma">
                <xsl:sort order="ascending"/>
                <xsl:variable name="sorting-key" select="fn:normalize(current-grouping-key())"/>
                <xsl:variable name="ch" select="//w[@lemma=current-grouping-key() and matches(fn:normalize(./text()), $regex_ch)]"/>
                <xsl:variable name="c" select="//w[@lemma=current-grouping-key() and matches(fn:normalize(./text()), $regex_c)]" />
                <lemma>
                    <!-- Déplacer dans les trois when pour supprimer les resultats negatifs -->
                    <xsl:attribute name="ch" select="count($ch)"/>
                    <xsl:attribute name="c" select="count($c)"/>
                   <label> <xsl:value-of select="$sorting-key||' ' "/> </label>
                <xsl:choose>
                    <!--
                    <xsl:when test="count($ch) and count($c)">
                        <xsl:call-template name="forms">
                            <xsl:with-param name="nodes" select="$ch, $c"/>
                        </xsl:call-template>
                    </xsl:when>
                    -->
                    <xsl:when test="count($ch) and matches($sorting-key, $regex_c)">
                            <xsl:call-template name="forms">
                                <xsl:with-param name="nodes" select="$ch, $c"/>
                            </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="count($c) and matches($sorting-key, $regex_ch)">
                        <xsl:call-template name="forms">
                            <xsl:with-param name="nodes" select="$ch, $c"/>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- Supprimer otherwise pour supprimer les resultats negatifs 
                    <xsl:otherwise>
                        <xsl:call-template name="forms">
                            <xsl:with-param name="nodes" select="$ch, $c"/>
                        </xsl:call-template>
                    </xsl:otherwise>-->
                </xsl:choose>
                </lemma>
            </xsl:for-each-group>
            </group>
        </xsl:result-document>

    </xsl:template>

    <xsl:template name="forms">
        <xsl:param name="nodes" />
        <xsl:for-each-group select="$nodes" group-by="text()">
            <form>
                <xsl:attribute name="count" select="count(current-group())"/>
                <xsl:value-of select="current-grouping-key()"/>
            </form>
        </xsl:for-each-group>
    </xsl:template>




</xsl:stylesheet>
