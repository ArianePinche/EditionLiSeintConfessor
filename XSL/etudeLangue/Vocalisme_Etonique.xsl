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



        <xsl:result-document href="../analyseCorpus_etonique.tsv">

            <!-- Traitement des vocalismes / Plan // ac la Petie Grammaire de l'ancien picard-->

            <!-- 1. Voyelles toniques -->
            <!-- e libre tonique  -->
            <xsl:text>Graphie du mot Dieu&#10;</xsl:text>
            <xsl:text>Lemme : dieu&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'dieu'])"/>
            <xsl:text>&#10;</xsl:text>
            <!-- Graphie de deu/dieu -->
            <xsl:for-each-group select="//w[@lemma = 'dieu']" group-by="lower-case(.)">
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
            <xsl:text>Graphie du mot lieu&#10;</xsl:text>
            <xsl:text>Lemme : lieu&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'lieu'])"/>
            <xsl:text>&#10;</xsl:text>
            <!-- Graphie de deu/dieu -->
            <xsl:for-each-group select="//w[@lemma = 'lieu']" group-by="lower-case(.)">
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>

            <!-- reduction de e ouvert en i -->
            <xsl:text>Réduction de e ouvert libre en i&#10;</xsl:text>
           
            <xsl:for-each-group
                select="//w[matches(@lemma, '^\w+ie\w*\d*$') and not(contains(@type, 'OUT'))]"
                group-by="@lemma">
                <xsl:sort select="current-grouping-key()" order="ascending"/>
                <xsl:if test="current-group()[not(matches(text(),'^\w+ie\w*$'))]">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by=".">
                    <xsl:value-of select="."/><xsl:text> </xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            
            <!-- reduction de e ouvert > ie -->
            <xsl:text>reduction de e ouvert > ie&#10;</xsl:text>
            <!-- prospection 
            <xsl:for-each-group
                select="//w[not(matches(@lemma, '^\w+ie\w*\d*$')) and not(contains(@type, 'OUT'))]"
                group-by="@lemma">
                <xsl:sort select="current-grouping-key()" order="ascending"/>
                <xsl:if test="current-group()[(matches(text(),'^\w+ie\w*$'))]">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>&#09;</xsl:text>
                    <xsl:for-each-group select="current-group()" group-by=".">
                        <xsl:value-of select="."/><xsl:text> </xsl:text>
                    </xsl:for-each-group>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            -->
            <!-- Etude de cas -->
            
            <xsl:text>Graphie du mot près&#10;</xsl:text>
            <xsl:text>Lemme : près&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'près'])"/>
            <xsl:text>&#10;</xsl:text>   
            <xsl:for-each-group select="//w[@lemma = 'près']" group-by="lower-case(.)">
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
            
            <xsl:text>Graphie du mot après&#10;</xsl:text>
            <xsl:text>Lemme : après&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'après'])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'après']" group-by="lower-case(.)">
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
            <xsl:text>Graphie du mot isnelement&#10;</xsl:text>
            <xsl:text>Lemme : isnelement&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'isnelement'])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'isnelement']" group-by="lower-case(.)">
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
            <xsl:text>Graphie du mot iver&#10;</xsl:text>
            <xsl:text>Lemme : iver2&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'iver2'])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'iver2']" group-by="lower-case(.)">
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
            <xsl:text>Graphie du mot haitement&#10;</xsl:text>
            <xsl:text>Lemme : haitement&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'haitement'])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'haitement']" group-by="lower-case(.)">
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
            <xsl:text>Graphie du mot nacele&#10;</xsl:text>
            <xsl:text>Lemme : nacele&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'nacele'])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'nacele']" group-by="lower-case(.)">
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
            <xsl:text>Graphie du mot novele&#10;</xsl:text>
            <xsl:text>Lemme : novele&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'novele'])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'novele']" group-by="lower-case(.)">
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
            <xsl:text>Graphie du mot apeler&#10;</xsl:text>
            <xsl:text>Lemme : apeler&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'apeler'])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'apeler']" group-by="lower-case(.)">
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
            <xsl:text>Graphie du mot bel&#10;</xsl:text>
            <xsl:text>Lemme : bel1&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'bel1'])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'bel1']" group-by="lower-case(.)">
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
            <xsl:text>Graphie du mot bete&#10;</xsl:text>
            <xsl:text>Lemme : beste&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'beste'])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'beste']" group-by="lower-case(.)">
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
            
            
            
            
        </xsl:result-document>
    </xsl:template>


</xsl:stylesheet>
