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
        
        
        
        <xsl:result-document href="../../resultats//Vocalisme2_itonique.tsv">
            
            <!-- Traitement des vocalismes / Plan // ac la Petie Grammaire de l'ancien picard-->
            
            <!-- 1. Voyelles protoniques -->
            <!-- i  -->
      
            <xsl:text>&#10;&#10;</xsl:text>
            <xsl:text>A initial en hiatus + pas de palatalisation&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(text(), '^ca\w*$') and not(matches(@lemma, '^ca\w*\d?$'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                    <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:sort order="ascending" select="count(current-group())"/>
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§32 -- E PROTONIQUE + s > PIC. i&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(fn:normalize(@lemma), '^\w*(o|a)is') and matches(text(), '\w*[^o|^a]is')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:sort order="ascending" select="."/>
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§34 – e protonique + l/n > i, ei&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(fn:normalize(@lemma), '^\w*(ei)(n)?(gn|ll)') and matches(text(), '^\w*[^e]i(n)?(gn|ll)')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:sort order="ascending" select="count(current-group())"/>
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§34 – o initial + n > a + n&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@lemma, '^\w?o(n|m)\w*\d?$') and matches(text(), '^\w?a(n|m)')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:sort order="ascending" select="."/>
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@lemma, 'damage')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:sort order="ascending" select="."/>
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§36 – Dissibilation de O&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@lemma, 'corrocier|doloros|escomeniier|glotonerie|onorer|onor*')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by=".">
                    <xsl:sort order="ascending" select="count(current-group())"/>
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§36 – Dissibilation de i&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@lemma, 'Ph(i|e)lippe|porriture|privilege|religïon|signifi*|Sicile|visiter|iprocrisie')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by=".">
                    <xsl:sort order="ascending" select="count(current-group())"/>
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
            
            
        </xsl:result-document>
    </xsl:template>
    
    
</xsl:stylesheet>
