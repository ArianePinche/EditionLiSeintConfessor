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
    <xsl:template match="/">



        <xsl:result-document href="../analyseCorpus_itonique.tsv">

            <!-- Traitement des vocalismes / Plan // ac la Petie Grammaire de l'ancien picard-->

            <!-- 1. Voyelles toniques -->
            <!-- i  -->

            <xsl:text>&#10;&#10;</xsl:text>
            <xsl:text>-ilius , -ilis > pic. ius, ieus&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(text(), '\w*i(e)?us')]" group-by="@lemma">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:value-of select="."/>
                    <xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Cas sparticulier des adverbes</xsl:text><xsl:text>&#10;</xsl:text>
            <xsl:for-each-group
                select="//w[matches(text(), '\w*i(e)?us\w*') and contains(@type, 'ADVgen')]"
                group-by="@lemma">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by=".">
                    <xsl:value-of select="."/>
                    <xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
            <xsl:text>Cas sparticulier fils</xsl:text><xsl:text>&#10;</xsl:text>
            <xsl:for-each-group
                select="//w[matches(@lemma, 'fil\d?')]" 
                group-by=".">
        
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="."/>
                    <xsl:text>&#09;</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
            <xsl:text>&#10;&#10;</xsl:text>
            <xsl:text>Vérification de au/o avec la conjugaison du verbe voloir&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma='voloir']" group-by="@type">
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by=".">
                    <xsl:sort order="ascending" select="."/>
               <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/>
               <xsl:text>&#09;</xsl:text>
           </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
           </xsl:for-each-group>
            <xsl:text>&#10;&#10;</xsl:text>
            <xsl:text>Alternance graphique o/ou/eu&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@lemma, '^\w*or\d?$')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by="lower-case(.)">
                    <xsl:sort order="ascending" select="."/>
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;&#10;</xsl:text>
            <xsl:text>O fermé sous l’influence de yod > oi, o pic.&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@lemma, '^\w*oi\w*$') and not(matches(text(), '^\w*oi\w*$'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:sort order="ascending" select="."/>
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>

        </xsl:result-document>
    </xsl:template>


</xsl:stylesheet>
