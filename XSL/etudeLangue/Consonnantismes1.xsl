<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.tei-c.org/ns/1.0" xmlns:fn="http://fn.com"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">

    <xsl:param name="keep-false" select="false()"/>
    <!-- ((^\s*c)|([zrtpqsdfghjklmwxcvbn]c)) -->

    
    <xsl:variable name="regex_c" select="'^\s*\w*c[^hzrtyuopqsdfghjklmwxcvbn]'"/>
    <xsl:variable name="regex_ch" select="'^\s*\w*ch[^zrtyuopqsdfghjklmwxcvbn]'"/>
    <xsl:variable name="lemma_match" select="'^\w*ch?[^zrtyuopqsdfghjklmwxcvbn]'"/>
    
    <xsl:function name="fn:normalize">
        <xsl:param name="input"/>
        <xsl:value-of select="translate(normalize-unicode(lower-case($input),'NFKD'), 'áàâäéèêëíìîïóòôöúùûü','aaaaeeeeiiiioooouuuu')"/>
    </xsl:function>
    
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:message select="normalize-unicode('éûü')"></xsl:message>
        <xsl:result-document href="../../resultats//consonnantismes1.tsv">
          <xsl:text>C - Ch </xsl:text><xsl:text>&#10;</xsl:text>
            <xsl:text>Ch </xsl:text><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[matches(fn:normalize(@lemma), $regex_ch)])"/><xsl:text>&#10;</xsl:text>
            <xsl:text>C </xsl:text><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[matches(fn:normalize(@lemma), $regex_c)])"/><xsl:text>&#10;</xsl:text>
           
            <xsl:for-each-group select="descendant::w[matches(fn:normalize(@lemma), $lemma_match)]" group-by="@lemma">
                <xsl:sort order="ascending"/>
                <xsl:variable name="sorting-key" select="fn:normalize(current-grouping-key())"/>
                <xsl:variable name="ch" select="//w[@lemma=current-grouping-key() and matches(fn:normalize(./text()), $regex_ch)]"/>
                <xsl:variable name="c" select="//w[@lemma=current-grouping-key() and matches(fn:normalize(./text()), $regex_c)]" />
                <xsl:text>lemme : </xsl:text><xsl:value-of select="$sorting-key"/><xsl:text>&#09;ch: </xsl:text><xsl:value-of select="count($ch)"/><xsl:text>&#09;c: </xsl:text><xsl:value-of select="count($c)"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:choose>
                    <xsl:when test="count($ch) and count($c)">
                        <xsl:call-template name="forms">
                            <xsl:with-param name="nodes" select="$ch, $c"/>
                        </xsl:call-template>
                    </xsl:when>
                    
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
                    
                    <xsl:otherwise>
                        <xsl:call-template name="forms">
                            <xsl:with-param name="nodes" select="$ch, $c"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
        </xsl:result-document>

    </xsl:template>

    <xsl:template name="forms">
        <xsl:param name="nodes" />
        <xsl:for-each-group select="$nodes" group-by="text()">
            <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text>
            <xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
        </xsl:for-each-group>
    </xsl:template>




</xsl:stylesheet>
