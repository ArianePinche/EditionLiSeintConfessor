<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://fn.com"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:function name="fn:normalize">
        <xsl:param name="input"/>
        <xsl:value-of
            select="translate(normalize-unicode(lower-case($input), 'NFKD'), 'áàâäéèêëíìîïóòôöúùûü', 'aaaaeeeeiiiioooouuuu')"
        />
    </xsl:function>
    <xsl:output method="text"/>
    
    <!-- Personnes -->
    <xsl:variable name="P1" select="'PERS.=1\|NOMB.=s'"/>
    <xsl:variable name="P2" select="'PERS.=2\|NOMB.=s'"/>
    <xsl:variable name="P3" select="'PERS.=3\|NOMB.=s'"/>
    <xsl:variable name="P4" select="'PERS.=1\|NOMB.=p'"/>
    <xsl:variable name="P5" select="'PERS.=2\|NOMB.=p'"/>
    <xsl:variable name="P6" select="'PERS.=3\|NOMB.=p'"/>
    
    <!-- temps et mode -->
    <xsl:variable name="indicatifPresent" select="'MODE=ind\|TEMPS=pst\|'"/>
    <xsl:variable name="subjonctifPresent" select="'MODE=sub\|TEMPS=pst\|'"/>
    <xsl:variable name="indicatifImparfait" select="'MODE=ind\|TEMPS=ipf\|'"/>
    <xsl:variable name="subjonctifImparfait" select="'MODE=sub\|TEMPS=ipf\|'"/>
    <xsl:variable name="indicatifParfait" select="'MODE=ind\|TEMPS=psp\|'"/>
    <xsl:variable name="indicatifFutur" select="'MODE=ind\|TEMPS=fut\|'"/>
    <xsl:variable name="conditionnel" select="'MODE=con\|'"/>
    <xsl:variable name="imperatif" select="'MODE=imp\|'"/>
    
    
    
    <xsl:template match="/">

        <xsl:text>&#10;</xsl:text>
        <xsl:text>Participes présents</xsl:text><xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select="//w[matches(@pos, 'VERppa')]" group-by="@lemma">
            <xsl:sort select="@lemma" order="ascending"/>
            <xsl:variable name="lemma" select="current-grouping-key()"/>
            <xsl:value-of select="$lemma"/><xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="current-group()" group-by=".">
                <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
       
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
</xsl:stylesheet>