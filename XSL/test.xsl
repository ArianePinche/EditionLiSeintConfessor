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
        <xsl:text>ATICU > age/aige/ege $7</xsl:text>
        <xsl:variable name="regex_ar_consonnes" select="'ar[hzrtpqsdfghjklmwxcvbn]'"/>
        <xsl:variable name="regex_er_consonnes" select="'er[hzrtpqsdfghjklmwxcvbn]'"/>
        <xsl:call-template name="occurrencesAlt">
            <xsl:with-param name="condition1" select="//w[matches(fn:normalize(text()), $regex_ar_consonnes) and not(matches(@type, 'OUT|VER'))]"/>
            <xsl:with-param name="condition2" select="$regex_er_consonnes"/>
        </xsl:call-template>
    </xsl:template>
    
    
    <xsl:template name="forms">
        <xsl:param name="nodes" />
        <xsl:for-each-group select="$nodes" group-by="fn:normalize(text())">
            <xsl:sort select="count(current-group())" order="ascending"/>
            <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text>
            <xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>
    </xsl:template>
    
    
    
    <!-- Règle pour compter des occurences d'un terme avec condition(s) supplémentaire(s) -->
    <xsl:template name="compteOccCond">
        <!-- Ajouter en paramètre la chaine de caractère que constitue le lemme : 'lemme' -->
        <xsl:param name="lemma" required="yes"/>
        <!-- condition : chemin xpath complet pour atteindre le phénomène voulu, ex : //w[matches(@type, 'POS=PROper\|PERS.=3\|NOMB.=p\|GENRE=(m|f)\|CAS=(r|i)$') and @lemma = 'il'] -->
        <xsl:param name="condition" required="yes"/>
        <xsl:text>&#10;lemme : </xsl:text>
        <xsl:value-of select="$lemma"/>
        <xsl:text>&#09;Nombres d'occurrences : </xsl:text>
        <xsl:value-of select="count(//w[@lemma = $lemma])"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:call-template name="forms">
            <xsl:with-param name="nodes" select="$condition"/>
        </xsl:call-template>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:template name="compteOcc">
        <!-- Ajouter en paramètre la chaine de caractère que constitue le lemme : 'lemme' -->
        <xsl:param name="lemma" required="yes"/>
        <xsl:text>&#10;lemme : </xsl:text>
        <xsl:value-of select="$lemma"/>
        <xsl:text>&#09;Nombres d'occurrences : </xsl:text>
        <xsl:value-of select="count(//w[@lemma = $lemma])"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:call-template name="forms">
            <xsl:with-param name="nodes" select="//w[@lemma = $lemma]"/>
        </xsl:call-template>
        
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    


    <xsl:template name="occurrencesPhen">
        <!-- condition : chemin xpath complet pour atteindre le phénomène voulu, ex : //w[matches(@type, 'POS=PROper\|PERS.=3\|NOMB.=p\|GENRE=(m|f)\|CAS=(r|i)$') and @lemma = 'il'] -->
        <xsl:param name="condition" required="yes"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Mot&#09;Nombres d'occurrences total&#09;Nombre d'occurrences&#10;</xsl:text>
        <xsl:for-each-group select="$condition" group-by="fn:normalize(@lemma)">
            <xsl:sort select="count(current-group())" order="ascending"/>
            <xsl:variable name="lemma" select="current-grouping-key()"/>
            <xsl:text>Lemme : </xsl:text>
            <xsl:value-of select="$lemma"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="count(//w[fn:normalize(@lemma) = $lemma])"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:call-template name="forms">
                <xsl:with-param name="nodes" select="//w[fn:normalize(@lemma) = $lemma]"/>
            </xsl:call-template>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:template name="occurrencesAlt">
        <!-- condition 1 = xpath + graphie attendue -->
        <xsl:param name="condition1" required="yes"/>
        <!--condtion 2 = graphie alternative -->
        <xsl:param name="condition2" required="yes"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Mot&#09;Nombre total&#09;Nombre d'occurrences en condition 1&#09;Nombre d'occurrences condition 2&#10;</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select="$condition1" group-by="fn:normalize(@lemma)">
            <xsl:sort select="count(current-group())" order="ascending"/>
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
                <xsl:call-template name="forms">
                    <xsl:with-param name="nodes" select="//w[fn:normalize(@lemma) = $lemma]"/>
                </xsl:call-template>
                <xsl:text>&#10;</xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

</xsl:stylesheet>
