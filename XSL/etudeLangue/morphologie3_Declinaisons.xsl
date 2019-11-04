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
    <!-- Annotation de morphologie -->
    <xsl:variable name="CSSm" select="'NOMB.=s\|GENRE=m\|CAS=n'"/>
    <xsl:variable name="CSSf" select="'NOMB.=s\|GENRE=f\|CAS=n'"/>
    <xsl:variable name="CSSn" select="'NOMB.=s\|GENRE=n\|CAS=n'"/>
    <xsl:variable name="CSRm" select="'NOMB.=s\|GENRE=m\|CAS=r'"/>
    <xsl:variable name="CSRf" select="'NOMB.=s\|GENRE=f\|CAS=r'"/>
    <xsl:variable name="CSRn" select="'NOMB.=s\|GENRE=n\|CAS=r'"/>

    <xsl:variable name="CPSm" select="'NOMB.=p\|GENRE=m\|CAS=n'"/>
    <xsl:variable name="CPSf" select="'NOMB.=p\|GENRE=f\|CAS=n'"/>
    <xsl:variable name="CPSn" select="'NOMB.=p\|GENRE=n\|CAS=n'"/>
    <xsl:variable name="CPRm" select="'NOMB.=p\|GENRE=m\|CAS=r'"/>
    <xsl:variable name="CPRf" select="'NOMB.=p\|GENRE=f\|CAS=r'"/>
    <xsl:variable name="CPRn" select="'NOMB.=p\|GENRE=n\|CAS=r'"/>

    <xsl:template name="declinaisonNomMasc">
        <xsl:param name="lemma"/>
        <xsl:param name="CatGram"/>
        <xsl:text>CSS&#09;</xsl:text>
        <xsl:for-each-group select="//w[matches(@msd, $CSSm) and @lemma = $lemma]"
            group-by="lower-case(.)">
            <xsl:sort order="descending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@pos, $CatGram) and matches(@msd, $CSSm) and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>CRS&#09;</xsl:text>
        <xsl:for-each-group select="//w[matches(@msd, $CSRm) and @lemma = $lemma]"
            group-by="lower-case(.)">
            <xsl:sort order="descending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@pos, $CatGram) and matches(@msd, $CSRm) and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>

        <xsl:text>&#10;</xsl:text>
        <xsl:text>CSP&#09;</xsl:text>
        <xsl:for-each-group select="//w[matches(@msd, $CPSm) and @lemma = $lemma]"
            group-by="lower-case(.)">
            <xsl:sort order="descending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@pos, $CatGram) and matches(@msd, $CPSm) and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>

        <xsl:text>&#10;</xsl:text>
        <xsl:text>CRP&#09;</xsl:text>
        <xsl:for-each-group select="//w[matches(@msd, $CPRm) and @lemma = $lemma]"
            group-by="lower-case(.)">
            <xsl:sort order="descending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@pos, $CatGram) and matches(@msd, $CPRm) and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    <xsl:template name="declinaisonNomFem">
        <xsl:param name="lemma"/>
        <xsl:param name="CatGram"/>
        <xsl:text>CSS&#09;</xsl:text>
        <xsl:for-each-group select="//w[matches(@msd, $CSSf) and @lemma = $lemma]"
            group-by="lower-case(.)">
            <xsl:sort order="descending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text> 
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@pos, $CatGram) and matches(@msd, $CSSf) and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>CRS&#09;</xsl:text>
        <xsl:for-each-group select="//w[matches(@msd, $CSRf) and @lemma = $lemma]"
            group-by="lower-case(.)">
            <xsl:sort order="descending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@pos, $CatGram) and matches(@msd, $CSRf) and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>

        <xsl:text>&#10;</xsl:text>
        <xsl:text>CSP&#09;</xsl:text>
        <xsl:for-each-group select="//w[matches(@msd, $CPSf) and @lemma = $lemma]"
            group-by="lower-case(.)">
            <xsl:sort order="descending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@pos, $CatGram) and matches(@msd, $CPSf) and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>

        <xsl:text>&#10;</xsl:text>
        <xsl:text>CRP&#09;</xsl:text>
        <xsl:for-each-group select="//w[matches(@msd, $CPRm) and @lemma = $lemma]"
            group-by="lower-case(.)">
            <xsl:sort order="descending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@pos, $CatGram) and matches(@msd, $CPRm) and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    <xsl:template name="declinaisonAdj">
        <xsl:param name="lemma"/>
        <xsl:param name="CatGram"/>
        <xsl:text>cas&#09;masc&#09;fém&#09;neutre&#10;</xsl:text>
        <xsl:text>CSS&#09;</xsl:text>
        <xsl:for-each-group
            select="//w[matches(@msd, concat($CSSm, '\|DEGRE=p')) and @lemma = $lemma]"
            group-by="lower-case(.)">
            <xsl:sort order="descending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($CSSm, '\|DEGRE=p')) and matches(@pos, $CatGram) and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group
            select="//w[matches(@msd, concat($CSSf, '\|DEGRE=p')) and @lemma = $lemma]"
            group-by="lower-case(.)">
            <xsl:sort order="descending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($CSSf, '\|DEGRE=p')) and matches(@pos, $CatGram) and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group
            select="//w[matches(@msd, concat($CSSn, '\|DEGRE=p')) and @lemma = $lemma]"
            group-by="lower-case(.)">
            <xsl:sort order="descending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($CSSn, '\|DEGRE=p')) and matches(@pos, $CatGram) and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>CRS&#09;</xsl:text>
        <xsl:for-each-group
            select="//w[matches(@msd, concat($CSRm, '\|DEGRE=p')) and @lemma = $lemma]"
            group-by="lower-case(.)">
            <xsl:sort order="descending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($CSRm, '\|DEGRE=p')) and matches(@pos, $CatGram) and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group
            select="//w[matches(@msd, concat($CSRf, '\|DEGRE=p')) and @lemma = $lemma]"
            group-by="lower-case(.)">
            <xsl:sort order="descending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($CSRf, '\|DEGRE=p')) and matches(@pos, $CatGram) and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group
            select="//w[matches(@msd, concat($CSRn, '\|DEGRE=p')) and @lemma = $lemma]"
            group-by="lower-case(.)">
            <xsl:sort order="descending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($CSRn, '\|DEGRE=p')) and matches(@pos, $CatGram) and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>CSP&#09;</xsl:text>
        <xsl:for-each-group
            select="//w[matches(@msd, concat($CPSm, '\|DEGRE=p')) and @lemma = $lemma]"
            group-by="lower-case(.)">
            <xsl:sort order="descending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($CPSm, '\|DEGRE=p')) and matches(@pos, $CatGram) and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group
            select="//w[matches(@msd, concat($CPSf, '\|DEGRE=p')) and @lemma = $lemma]"
            group-by="lower-case(.)">
            <xsl:sort order="descending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($CPSf, '\|DEGRE=p')) and matches(@pos, $CatGram) and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group
            select="//w[matches(@msd, concat($CPSn, '\|DEGRE=p')) and @lemma = $lemma]"
            group-by="lower-case(.)">
            <xsl:sort order="descending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($CPSn, '\|DEGRE=p')) and matches(@pos, $CatGram) and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>CRP&#09;</xsl:text>
        <xsl:for-each-group
            select="//w[matches(@msd, concat($CPRn, '\|DEGRE=p')) and @lemma = $lemma]"
            group-by="lower-case(.)">
            <xsl:sort order="descending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($CPRf, '\|DEGRE=p')) and matches(@pos, $CatGram) and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:for-each-group
            select="//w[matches(@msd, concat($CPRn, '\|DEGRE=p')) and @lemma = $lemma]"
            group-by="lower-case(.)">
            <xsl:sort order="descending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($CPRn, '\|DEGRE=p')) and matches(@pos, $CatGram) and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;&#10;</xsl:text>
    </xsl:template>
    <xsl:template match="/">
        <xsl:result-document href="../../resultats/analyseMorphologique3_declinaisons.tsv">
            <xsl:text>Les substantifs</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les substantifs masculins</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les substantifs masculins à une base</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les substantifs masculins à une base avec un CSS en -s</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:variable name="CatGram" select="'NOMcom'"/>
            <xsl:variable name="lemma" select="'jor'"/>
            <xsl:call-template name="declinaisonNomMasc">
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les substantifs masculins à une base avec un CSS sans -s</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:variable name="CatGram" select="'NOMcom'"/>
            <xsl:variable name="lemma" select="'frere'"/>
            <xsl:call-template name="declinaisonNomMasc">
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:text>&#09;&#10;</xsl:text>
            <xsl:variable name="CatGram" select="'NOMcom'"/>
            <xsl:variable name="lemma" select="'pere'"/>
            <xsl:call-template name="declinaisonNomMasc">
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les substantifs masculins à deux bases</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:variable name="CatGram" select="'NOMcom'"/>
            <xsl:variable name="lemma" select="'seignor'"/>
            <xsl:call-template name="declinaisonNomMasc">
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:variable name="CatGram" select="'NOMcom'"/>
            <xsl:variable name="lemma" select="'emperëor'"/>
            <xsl:call-template name="declinaisonNomMasc">
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>

            <xsl:text>Les substantifs féminins</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les substantifs féminins à une base</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les substantifs féminins à une base se terminant par -e</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:variable name="CatGram" select="'NOMcom'"/>
            <xsl:variable name="lemma" select="'chose'"/>
            <xsl:call-template name="declinaisonNomFem">
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les substantifs féminins à une base ne se terminant pas par -e</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:variable name="CatGram" select="'NOMcom'"/>
            <xsl:variable name="lemma" select="'maison'"/>
            <xsl:call-template name="declinaisonNomFem">
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:text>&#09;&#10;</xsl:text>
            <xsl:variable name="CatGram" select="'NOMcom'"/>
            <xsl:variable name="lemma" select="'gent'"/>
            <xsl:call-template name="declinaisonNomFem">
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les substantifs féminins à deux bases</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:variable name="CatGram" select="'NOMcom'"/>
            <xsl:variable name="lemma" select="'none1'"/>
            <xsl:call-template name="declinaisonNomFem">
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:variable name="CatGram" select="'NOMcom'"/>
            <xsl:variable name="lemma" select="'seror'"/>
            <xsl:call-template name="declinaisonNomFem">
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les adjectifs</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les adjectifs variables en genre</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:variable name="CatGram" select="'ADJqua'"/>
            <xsl:variable name="lemma" select="'saint'"/>
            <xsl:call-template name="declinaisonAdj">
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:text>Les adjectifs invariables en genre</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les adjectifs les adjectifs féminins sans -e final</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:variable name="CatGram" select="'ADJqua'"/>
            <xsl:variable name="lemma" select="'grant'"/>
            <xsl:call-template name="declinaisonAdj">
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:text>Les adjectifs les adjectifs masculins en -re</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:variable name="CatGram" select="'ADJqua'"/>
            <xsl:variable name="lemma" select="'povre'"/>
            <xsl:call-template name="declinaisonAdj">
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:text>Les adjectifs les adjectifs masculins en -e</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:variable name="CatGram" select="'ADJqua'"/>
            <xsl:variable name="lemma" select="'riche'"/>
            <xsl:call-template name="declinaisonAdj">
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:text>Les adjectifs a plusieurs bases</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:variable name="CatGram" select="'ADJqua'"/>
            <xsl:variable name="lemma" select="'meillor'"/>
            <xsl:call-template name="declinaisonAdj">
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
        </xsl:result-document>

    </xsl:template>






</xsl:stylesheet>
