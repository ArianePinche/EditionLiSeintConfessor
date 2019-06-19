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

        <xsl:result-document href="../analyseCorpus.txt">

            <!-- Traitement des vocalismes / Plan // ac la Petie Grammaire de l'ancien picard-->


            <!-- a libre tonique -->
            <xsl:text>Graphie du mot tel&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'tel']" group-by=".">
                <xsl:value-of select="@lemma"/>
                <xsl:text>(</xsl:text>
                <xsl:value-of select="count(//w[@lemma = 'tel'])"/>
                <xsl:text>) : </xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>(</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>

            <xsl:text>Graphie du mot pere&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'pere']" group-by=".">
                <xsl:value-of select="@lemma"/>
                <xsl:text>(</xsl:text>
                <xsl:value-of select="count(//w[@lemma = 'pere'])"/>
                <xsl:text>) : </xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>(</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>

            <xsl:text>Graphie du mot larme&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'larme']" group-by=".">
                <xsl:value-of select="@lemma"/>
                <xsl:text>(</xsl:text>
                <xsl:value-of select="count(//w[@lemma = 'larme'])"/>
                <xsl:text>) : </xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>(</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>

            <xsl:text>Graphie de la P3 pst de savoir&#10;</xsl:text>
            <xsl:for-each-group
                select="//w[@lemma='savoir' and @type='POS=VERcjg\|MODE=ind\|TEMPS=pst\|PERS.=3\|NOMB.=s']"
                group-by=".">
                <xsl:value-of select="@lemma"/>
                <xsl:text>(</xsl:text>
                <xsl:value-of select="count(//w[@lemma='savoir' and @type='POS=VERcjg\|MODE=ind\|TEMPS=pst\|PERS.=3\|NOMB.=s'])"/>
                <xsl:text>) : </xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>(</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>

            <!-- a initial -->

            <xsl:variable name="regex_ainit" select="'^[aA-zZ]?a'"/>
            <xsl:variable name="regex_ahiatus" select="'^[aA-zZ]?a[aeo]'"/>
            <xsl:text>Nombre de mots en A inital : </xsl:text>
            <xsl:value-of select="count(descendant::w[matches(fn:normalize(.), $regex_ainit)])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>A initiale en hiatus </xsl:text>
            <xsl:value-of select="count(descendant::w[matches(fn:normalize(.), $regex_ahiatus)])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="descendant::w[matches(fn:normalize(.), $regex_ahiatus)]"
                group-by=".">
                <xsl:sort order="ascending"/>
                <xsl:variable select="@lemma" name="lemma"/>
                <xsl:value-of select="."/>
                <xsl:text> (</xsl:text>
                <xsl:value-of select="@lemma"/>
                <xsl:text>) : </xsl:text>
                <xsl:for-each-group select="//w[@lemma = $lemma]" group-by=".">
                    <xsl:value-of select="."/>
                    <xsl:text>, </xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>a/ai</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="descendant::w[matches(., 'ai')]" group-by=".">
                <xsl:sort order="ascending"/>
                <xsl:variable select="@lemma" name="lemma"/>
                <xsl:if test="not(matches(@lemma, 'ai')) and matches(@lemma, 'a')">
                    <xsl:value-of select="."/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="@lemma"/>
                    <xsl:text>) : </xsl:text>
                    <xsl:for-each-group select="//w[@lemma = $lemma]" group-by=".">
                        <xsl:value-of select="."/>
                        <xsl:text>, </xsl:text>
                    </xsl:for-each-group>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>
            </xsl:for-each-group>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
