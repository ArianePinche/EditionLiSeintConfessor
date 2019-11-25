<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://fn.com"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    
    <xsl:output method="text"></xsl:output>
    
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
    
   <!-- Gossen 71 subj imparfaits en aisse -->     
        <xsl:value-of select="count(//w[matches(@msd, $subjonctifImparfait)])"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select="//w[matches(@msd, $subjonctifImparfait) and matches(text(), 'aisse')]" group-by="@lemma">
            <xsl:variable name="lemma" select="current-grouping-key()"/>
            <xsl:value-of select="$lemma"/><xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="current-group()" group-by=".">
                <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=$lemma and matches(@msd, $subjonctifImparfait) and not(matches(text(), 'aisse'))]" group-by='.'>
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                </xsl:for-each-group>    
                <xsl:text>&#10;</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>
        
  <!-- Première personne du pluriel (Gossen §78)-->
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Troisième personne du pluriel en -isent au pluriel</xsl:text><xsl:text>&#10;</xsl:text>
        <xsl:text>formes en -isent :</xsl:text><xsl:value-of select="count(//w[matches(@msd, $P6) and matches(@msd, $indicatifParfait) and matches(text(), 'is(s)?ent$')])"/><xsl:text>&#09;</xsl:text>
        <xsl:text>formes autres :</xsl:text><xsl:value-of select="count(//w[matches(@msd, $P6) and matches(@msd, $indicatifParfait) and not(matches(text(), 'is(s)?ent$'))])"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select="//w[matches(@msd, $P6) and matches(@msd, $indicatifParfait) and matches(text(), 'is(s)?ent$')]" group-by="@lemma">
            <xsl:variable name="lemma" select="current-grouping-key()"/>
            <xsl:value-of select="$lemma"/><xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="current-group()" group-by=".">
                <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=$lemma and matches(@msd, $P6) and matches(@msd, $indicatifParfait) and not(matches(text(), 'is(s)?ent$'))]" group-by='.'>
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                </xsl:for-each-group>    
                <xsl:text>&#10;</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>
        
    </xsl:template>
</xsl:stylesheet>