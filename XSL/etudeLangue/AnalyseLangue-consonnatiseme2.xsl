<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://fn.com" xmlns="http://www.tei-c.org/ns/1.0" 
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <xsl:function name="fn:normalize">
        <xsl:param name="input"></xsl:param>
        <xsl:value-of select="translate(normalize-unicode(lower-case($input),'NFKD'), 'áàâäéèêëíìîïóòôöúùûü','aaaaeeeeiiiioooouuuu')"/>
    </xsl:function>
    <xsl:output method="text"/>
    <xsl:template match="/">
       
        <xsl:result-document href="../analyseconsonantisme2.tsv">
            <xsl:text>&#10;</xsl:text>
          <xsl:text>Groupe scy :  ss</xsl:text>
            <xsl:for-each-group select="//w[matches(text(), '^\w*ss\w*') and not(matches(@lemma, '^\w*ss\w*'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                    <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                    <xsl:for-each-group select="current-group()" group-by=".">
                        <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                    </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Groupe scy :  assourdissement de la finale&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(text(), '^\w*che\s?$') and not(matches(@lemma, '^\w*che$'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
        </xsl:result-document>

    </xsl:template>






</xsl:stylesheet>
