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



        <xsl:result-document href="../../resultats/Vocalisme2_etonique.tsv">

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
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Graphie du mot lieu&#10;</xsl:text>
            <xsl:text>Lemme : lieu&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'lieu'])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'lieu']" group-by="lower-case(.)">
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <!-- reduction de e ouvert en i -->
            <xsl:text>§10 Réduction de e ouvert libre en i&#10;</xsl:text>

            <xsl:for-each-group
                select="//w[matches(@lemma, '^\w+ie\w*\d*$') and not(contains(@type, 'OUT'))]"
                group-by="@lemma">
                <xsl:sort select="current-grouping-key()" order="ascending"/>
                <xsl:if test="current-group()[not(matches(text(), '^\w+ie\w*$'))]">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>&#09;</xsl:text>
                    <xsl:for-each-group select="current-group()" group-by=".">
                        <xsl:value-of select="."/>
                        <xsl:text> </xsl:text>
                    </xsl:for-each-group>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>

            <!-- reduction de e ouvert > ie -->
            <xsl:text>§11 reduction de e ouvert > ie&#10;</xsl:text>
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

            <xsl:text>&#10;</xsl:text>
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
            <xsl:text>&#10;</xsl:text>
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
            <xsl:text>&#10;</xsl:text>
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
            <xsl:text>&#10;</xsl:text>
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
            <xsl:text>&#10;</xsl:text>
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
            <xsl:text>&#10;</xsl:text>
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
            <xsl:text>&#10;</xsl:text>
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
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Graphie du mot arester&#10;</xsl:text>
            <xsl:text>Lemme : arester&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'arester'])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'arester']" group-by="lower-case(.)">
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Graphie du mot merci&#10;</xsl:text>
            <xsl:text>Lemme : merci&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'merci'])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'merci']" group-by="lower-case(.)">
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
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
            <xsl:text>&#10;</xsl:text>

            <xsl:text>&#10;</xsl:text>
            <xsl:text>Graphie du mot chastel&#10;</xsl:text>
            <xsl:text>Lemme : chastel&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'chastel'])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'chastel']" group-by="lower-case(.)">
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            

            <xsl:text>§12 ellus/os > eaus, iaus/aus&#10;</xsl:text>
            <xsl:text>&#10;Recherche prospective&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(text(), '^\w*au(s|z)?$')]" group-by="@lemma">
                <xsl:if test="not(matches(@lemma, '^\w*a(l|u)[a-z]?\d?$'))">
                    <xsl:text>lemme : </xsl:text>
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>&#10;</xsl:text>
                    <xsl:for-each-group select="//w[@lemma = current-grouping-key()]" group-by=".">
                        <xsl:value-of select="."/>
                        <xsl:text>&#09;</xsl:text>
                        <xsl:value-of select="count(current-group())"/>
                        <xsl:text>&#10;</xsl:text>
                    </xsl:for-each-group>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>


            <xsl:text>&#10;</xsl:text>
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
            <xsl:text>&#10;</xsl:text>

            <xsl:text>Graphie du mot chastel&#10;</xsl:text>
            <xsl:text>Lemme : chastel&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'chastel'])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'chastel']" group-by="lower-case(.)">
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>

            <xsl:text>Graphie du mot chevel&#10;</xsl:text>
            <xsl:text>Lemme : chevel&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'chevel'])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'chevel']" group-by="lower-case(.)">
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>

            <xsl:text>particularité pic. idem pour illus/os > aus/iaus</xsl:text>
            <xsl:text>&#10;</xsl:text>

            <xsl:text>Graphie du mot soleil&#10;</xsl:text>
            <xsl:text>Lemme : soleil&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'soleil'])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'soleil']" group-by="lower-case(.)">
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>

            <xsl:text>Graphie du mot conseil&#10;</xsl:text>
            <xsl:text>Lemme : conseil&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'conseil'])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'conseil']" group-by="lower-case(.)">
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>

            <xsl:text>Etude de la graphie du pronom P3 - pluriel régime&#10;</xsl:text>
            <xsl:text>Lemme : il &lt; illos &#09;</xsl:text>
            <xsl:value-of
                select="count(//w[matches(@type, '^POS=PROper\|PERS.=3\|NOMB.=p\|GENRE=(m|f)\|CAS=(r|i)$') and @lemma = 'il'])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group
                select="//w[matches(@type, '^POS=PROper\|PERS.=3\|NOMB.=p\|GENRE=(m|f)\|CAS=(r|i)$') and @lemma = 'il']"
                group-by="@type">
                <xsl:sort select="@type" order="ascending"/>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by=".">
                    <xsl:value-of select="."/>
                    <xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>&#10;</xsl:text>
                </xsl:for-each-group>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§14 melius &lt; mius</xsl:text>
            <xsl:text>Graphie du mot mieus&#10;</xsl:text>
            <xsl:text>Lemme : mieus&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'mieus'])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'mieus']" group-by="lower-case(.)">
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>

            <xsl:text>Confusion graphique an/en, une plus grande propension à fermer la consonne nasale ?</xsl:text>
            <xsl:text>mots en an</xsl:text>
            <xsl:for-each-group select="//w[matches(text(), '^\w*an\w*$')]" group-by="@lemma">
                <xsl:sort order="ascending" select="current-grouping-key()"/>
                <xsl:if test="not(matches(fn:normalize(@lemma), '^\w*an\w*\d?$'))">
                    <xsl:text>Lemme :</xsl:text>
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="count(//w[@lemma = current-grouping-key()])"/>
                    <xsl:text>&#10;</xsl:text>
                    <xsl:for-each-group select="current-group()" group-by=".">
                        <xsl:sort order="ascending" select="current-grouping-key()"/>
                        <xsl:value-of select="."/>
                        <xsl:text>&#09;</xsl:text>
                        <xsl:value-of select="count(current-group())"/>
                        <xsl:text>&#10;</xsl:text>
                    </xsl:for-each-group>
                    <xsl:for-each-group select="//w[@lemma = current-grouping-key() and matches(text(), '^\w*en\w*\d?$') ]" group-by=".">
                        <xsl:sort order="ascending" select="current-grouping-key()"/>
                        <xsl:value-of select="."/>
                        <xsl:text>&#09;</xsl:text>
                        <xsl:value-of select="count(current-group())"/>
                        <xsl:text>&#10;</xsl:text>
                    </xsl:for-each-group>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>mots en en</xsl:text>
            <xsl:for-each-group select="//w[matches(text(), '^\w*en\w*$')]" group-by="@lemma">
                <xsl:sort order="ascending" select="current-grouping-key()"/>
                <xsl:if test="not(matches(fn:normalize(@lemma), '^\w*en\w*\d?$'))">
                    <xsl:text>Lemme :</xsl:text>
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="count(//w[@lemma = current-grouping-key()])"/>
                    <xsl:text>&#10;</xsl:text>
                    <xsl:for-each-group select="current-group()" group-by=".">
                        <xsl:sort order="ascending" select="current-grouping-key()"/>
                        <xsl:value-of select="."/>
                        <xsl:text>&#09;</xsl:text>
                        <xsl:value-of select="count(current-group())"/>
                        <xsl:text>&#10;</xsl:text>
                    </xsl:for-each-group>
                    <xsl:for-each-group select="//w[@lemma = current-grouping-key() and matches(text(), '^\w*an\w*\d?$') ]" group-by=".">
                        <xsl:sort order="ascending" select="current-grouping-key()"/>
                        <xsl:value-of select="."/>
                        <xsl:text>&#09;</xsl:text>
                        <xsl:value-of select="count(current-group())"/>
                        <xsl:text>&#10;</xsl:text>
                    </xsl:for-each-group>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Evolution de e fermé</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Forme alternantive des infinitifs : seîr, caïr/keïr et veïr</xsl:text><!-- Inexsitant dans le corpus pour l'instant-->
            
            <xsl:text>formes infinitives de voir </xsl:text><xsl:value-of select="count(//w[@lemma='vëoir' and contains(@type, 'POS=VERinf')])"/><xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma='vëoir' and contains(@type, 'POS=VERinf')]" group-by=".">
              <xsl:value-of select="."/><xsl:text> (</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>)&#10;</xsl:text>
            </xsl:for-each-group>
          
            
            <xsl:text>formes infinitives de sëoir </xsl:text><xsl:value-of select="count(//w[@lemma='sëoir' and contains(@type, 'POS=VERinf')])"/><xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma='sëoir' and contains(@type, 'POS=VERinf')]" group-by=".">
                <xsl:value-of select="."/><xsl:text> (</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>)&#10;</xsl:text>
            </xsl:for-each-group>
         
            
            <xsl:text>formes infinitives de chëoir </xsl:text><xsl:value-of select="count(//w[@lemma='chëoir' and contains(@type, 'POS=VERinf')])"/><xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma='chëoir' and contains(@type, 'POS=VERinf')]" group-by=".">
                <xsl:value-of select="."/><xsl:text> (</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>)&#10;</xsl:text>
            </xsl:for-each-group>
          
          
            <xsl:text>&#10;&#10;</xsl:text>
            <xsl:text>-gula > pic. iule</xsl:text>
            <xsl:for-each-group select="//w[matches(fn:normalize(text()), '^\w*iule[s]?$')]" group-by="@lemma">
                <xsl:sort select="current-grouping-key()" order="ascending"/>
                <xsl:variable name="lemma" select="current-grouping-key()"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=$lemma]" group-by=".">
                    <xsl:sort select="current-grouping-key()" order="ascending"/>
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text
                    ><xsl:value-of select="count(current-group())"/></xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
            <xsl:text>&#10;&#10;</xsl:text>
            <xsl:text>-ilius , -ilis > pic. ius, ieus</xsl:text>
            <xsl:for-each-group select="//w[ends-with(text(), 'ius')]" group-by="@lemma">
                <xsl:sort select="current-grouping-key()" order="ascending"/>
                <xsl:variable name="lemma" select="current-grouping-key()"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=$lemma]" group-by=".">
                    <xsl:sort select="current-grouping-key()" order="ascending"/>
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text
                    ><xsl:value-of select="count(current-group())"/>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
            
            
        </xsl:result-document>
    </xsl:template>


</xsl:stylesheet>
