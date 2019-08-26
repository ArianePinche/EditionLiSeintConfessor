<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:result-document href="../../resultats/Dees-Vocabulaire1.tsv">
    <xsl:text>Etude des graphies du corpus en fonction des cartes linguistiques de A. Dees,
        DEES, Anthonij, DEKKER, Marcel, HUBER, Onno, [et al.], Atlas des formes linguistiques des textes littéraires de l’ancien français, Reprint 2014, Berlin, Boston, De Gruyter, 1987, [En ligne : https://www.degruyter.com/viewbooktoc/product/160190].
&#10;</xsl:text> 
        
        <xsl:text>Carte 53 : Graphie nient&#10;</xsl:text>
        <xsl:call-template name="occurrence">
            <xsl:with-param name="condition" select="//w[@lemma='nïent']"/>
        </xsl:call-template>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Carte 59-60 : Graphie plusieur&#10;</xsl:text>
        <xsl:call-template name="occurrence">
             <xsl:with-param name="condition" select="//w[@lemma='plusor']"/>
         </xsl:call-template>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Carte 104 : Graphie de dolce&#10;</xsl:text>
        <xsl:call-template name="occurrence">
            <xsl:with-param name="condition" select="//w[@lemma='douz' and matches(@type, 'GENRE=f')]"/>
        </xsl:call-template>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Carte 105 : Graphie dous/douz&#10;</xsl:text>
        <xsl:call-template name="occurrence">
            <xsl:with-param name="condition" select="//w[@lemma='douz' and matches(@type, 'GENRE=m')]"/>
        </xsl:call-template>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Carte 106 : Graphie dolent&#10;</xsl:text>
        <xsl:call-template name="occurrence">
            <xsl:with-param name="condition" select="//w[@lemma='dolent']"/>
        </xsl:call-template>
       
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Carte 106 : Graphie drois/droiz&#10;</xsl:text>
        <xsl:call-template name="occurrence">
            <xsl:with-param name="condition" select="//w[@lemma='droit' and matches(text(), 'is|z$')]"/>
        </xsl:call-template>
        
        <xsl:text>Carte 108 : Graphie estrange/estraigne&#10;</xsl:text>
        <xsl:call-template name="occurrence">
            <xsl:with-param name="condition" select="//w[@lemma='estrange']"/>
        </xsl:call-template>
        
        <xsl:text>Carte 115 : Graphie meilleur/mieldre&#10;</xsl:text>
        <xsl:call-template name="occurrence">
            <xsl:with-param name="condition" select="//w[@lemma='meillor' or (@lemma='mieus' and matches(@type,'DEGRE=s'))]"/>
        </xsl:call-template>
            
            <xsl:text>Carte 120 : Graphie plain/plein&#10;</xsl:text>
            <!-- Non cohérent -->
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[@lemma='plein']"/>
            </xsl:call-template>
            
            <xsl:text>Carte 127 : Graphie bel/beau&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='bel1' or @lemma='novel') and matches(@type, 'GENRE=m') and not(ends-with(text(), 's'))]"/>
            </xsl:call-template>
            
            
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template name="occurrence">
        <xsl:param name="condition"/>
        <xsl:text>nb occ.</xsl:text><xsl:value-of select="count($condition)"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select="$condition" group-by="lower-case(.)">
        <xsl:variable name="NbTotal" select="count($condition)"/>
        <xsl:variable name="NbOccurrences" select="count(current-group())"/>
        <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text>
        <xsl:value-of select="$NbOccurrences div $NbTotal * 100"/>
        <xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>