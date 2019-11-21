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
    <xsl:variable name="CSSm" select="'NOMB.=s\|GENRE=m\|CAS=n'"/>
    <xsl:variable name="CSSf" select="'NOMB.=s\|GENRE=f\|CAS=n'"/>
    <xsl:variable name="CSSn" select="'NOMB.=s\|GENRE=n\|CAS=n'"/>
    <xsl:variable name="CSRm" select="'NOMB.=s\|GENRE=m\|CAS=r'"/>
    <xsl:variable name="CSRf" select="'NOMB.=s\|GENRE=f\|CAS=r'"/>
    <xsl:variable name="CSRn" select="'NOMB.=s\|GENRE=n\|CAS=r'"/>
    <xsl:variable name="CSIm" select="'NOMB.=s\|GENRE=m\|CAS=i'"/>
    <xsl:variable name="CSIf" select="'NOMB.=s\|GENRE=f\|CAS=i'"/>
    <xsl:variable name="CSIn" select="'NOMB.=s\|GENRE=n\|CAS=i'"/>
    <xsl:variable name="CPSm" select="'NOMB.=p\|GENRE=m\|CAS=n'"/>
    <xsl:variable name="CPSf" select="'NOMB.=p\|GENRE=f\|CAS=n'"/>
    <xsl:variable name="CPSn" select="'NOMB.=p\|GENRE=n\|CAS=n'"/>
    <xsl:variable name="CPRm" select="'NOMB.=p\|GENRE=m\|CAS=r'"/>
    <xsl:variable name="CPRf" select="'NOMB.=p\|GENRE=f\|CAS=r'"/>
    <xsl:variable name="CPRn" select="'NOMB.=p\|GENRE=n\|CAS=r'"/>
    <xsl:variable name="CPIm" select="'NOMB.=p\|GENRE=m\|CAS=i'"/>
    <xsl:variable name="CPIf" select="'NOMB.=p\|GENRE=f\|CAS=i'"/>
    <xsl:variable name="CPIn" select="'NOMB.=p\|GENRE=n\|CAS=i'"/>

    <xsl:template name="declinaisonProPers">
        <xsl:param name="CatGram"/>
        <xsl:param name="pers"/>
        <xsl:param name="lemma"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>CSS&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CSSm)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($pers, '\|', $CSSm)) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CSSf)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($pers, '\|', $CSSf)) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CSSn)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($pers, '\|', $CSSn)) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>CRS&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CSRm)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($pers, '\|', $CSRm)) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CSRf)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($pers, '\|', $CSRf)) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CSRn)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($pers, '\|', $CSRn)) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>CIS&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CSIm)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($pers, '\|', $CSIm)) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CSIf)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($pers, '\|', $CSIf)) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CSIn)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($pers, '\|', $CSIn)) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>CPS&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CPSm)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($pers, '\|', $CPSm)) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CPSf)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($pers, '\|', $CPSf)) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CPSn)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($pers, '\|', $CPSn)) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>CPR&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CPRm)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($pers, '\|', $CPRm)) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CPRf)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($pers, '\|', $CPRf)) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CPRn)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($pers, '\|', $CPRn)) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>CPI&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CPIm)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($pers, '\|', $CPIm)) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CPIf)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($pers, '\|', $CPIf)) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CPIn)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($pers, '\|', $CPIn)) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
    </xsl:template>
    <xsl:template name="declinaisonPro">
        <xsl:param name="CatGram"/>
        <xsl:param name="lemma"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>CSS&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CSSm)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, $CSSm) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CSSf)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, $CSSf) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CSSn)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, $CSSn) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>CRS&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CSRm)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, $CSRm) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CSRf)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, $CSRf) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CSRn)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, $CSRn) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>CIS&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CSIm)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, $CSIm) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CSIf)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, $CSIf) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CSIn)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, $CSIn) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>CPS&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CPSm)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, $CPSm) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CPSf)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, $CPSf) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CPSn)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, $CPSn) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>CPR&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CPRm)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, $CPRm) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CPRf)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, $CPRf) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CPRn)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, $CPRn) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>CPI&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CPIm)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, $CPIm) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CPIf)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, $CPIf) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
        <xsl:for-each-group select="current-group()[matches(@msd, $CPIn)]" group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, $CPIn) and @pos = $CatGram and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
    </xsl:template>

    <xsl:template match="/">

        <xsl:result-document href="../../resultats/analyseMorphologique2_pronoms.tsv">
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les pronoms personnels&#10;</xsl:text>
            <xsl:variable name="CatGram" select="'PROper'"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@pos = $CatGram]" group-by="@lemma">
                <xsl:sort order="ascending" select="@msd"/>
                <xsl:variable name="lemma" select="current-grouping-key()"/>
                <xsl:variable name="pers">
                    <xsl:value-of select="tokenize(@msd, '\|')[1]"/>
                </xsl:variable>
                <xsl:text>&#10;</xsl:text>
                <xsl:value-of select="$pers"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:value-of select="$lemma"/>
                <xsl:text> nb.</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>cas&#09;masc&#09;fém&#09;neutre&#10;</xsl:text>
                <xsl:call-template name="declinaisonProPers">
                    <xsl:with-param name="CatGram" select="$CatGram"/>
                    <xsl:with-param name="lemma" select="$lemma"/>
                    <xsl:with-param name="pers"/>
                </xsl:call-template>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les pronoms demonstratifs&#10;</xsl:text>
            <xsl:variable name="CatGram" select="'PROdem'"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@pos = $CatGram]" group-by="@lemma">
                <xsl:sort order="ascending" select="@msd"/>
                <xsl:variable name="lemma" select="current-grouping-key()"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:value-of select="$lemma"/>
                <xsl:text> nb.</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>cas&#09;masc&#09;fém&#09;neutre&#10;</xsl:text>
                <xsl:call-template name="declinaisonPro">
                    <xsl:with-param name="CatGram" select="$CatGram"/>
                    <xsl:with-param name="lemma" select="$lemma"/>
                </xsl:call-template>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les pronoms possessifs&#10;</xsl:text>
            <xsl:variable name="CatGram" select="'PROpos'"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@pos = $CatGram]" group-by="@lemma">
                <xsl:sort order="ascending" select="@msd"/>
                <xsl:variable name="lemma" select="current-grouping-key()"/>
                <xsl:variable name="pers">
                    <xsl:value-of select="tokenize(@msd, '\|')[1]"/>
                </xsl:variable>
                <xsl:text>&#10;</xsl:text>
                <xsl:value-of select="$lemma"/>
                <xsl:text> nb.</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>cas&#09;masc&#09;fém&#09;neutre&#10;</xsl:text>
                <xsl:call-template name="declinaisonProPers">
                    <xsl:with-param name="lemma" select="$lemma"/>
                    <xsl:with-param name="CatGram" select="$CatGram"/>
                    <xsl:with-param name="pers" select="$pers"/>
                </xsl:call-template>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les pronoms relatifs&#10;</xsl:text>
            <xsl:variable name="CatGram" select="'PROrel'"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@pos = $CatGram]" group-by="@lemma">
                <xsl:sort order="ascending" select="@msd"/>
                <xsl:variable name="lemma" select="current-grouping-key()"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:value-of select="$lemma"/>
                <xsl:text> nb.</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>cas&#09;masc&#09;fém&#09;neutre&#10;</xsl:text>
                <xsl:call-template name="declinaisonPro">
                    <xsl:with-param name="CatGram" select="$CatGram"/>
                    <xsl:with-param name="lemma" select="$lemma"/>
                </xsl:call-template>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <!-- Les formes avec enclise -->
            <xsl:for-each-group select="//w[matches(@pos, 'PROrel.')]" group-by="@lemma">
                <xsl:text>&#10;</xsl:text> <xsl:value-of select="current-grouping-key()"/><xsl:text>&#10;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by=".">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> nb.</xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>&#10;</xsl:text>
                </xsl:for-each-group>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les pronoms interrogatifs&#10;</xsl:text>
            <xsl:variable name="CatGram" select="'PROint'"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@pos = $CatGram]" group-by="@lemma">
                <xsl:sort order="ascending" select="@msd"/>
                <xsl:variable name="lemma" select="current-grouping-key()"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:value-of select="$lemma"/>
                <xsl:text> nb.</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>cas&#09;masc&#09;fém&#09;neutre&#10;</xsl:text>
                <xsl:call-template name="declinaisonPro">
                    <xsl:with-param name="CatGram" select="$CatGram"/>
                    <xsl:with-param name="lemma" select="$lemma"/>
                </xsl:call-template>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les pronoms indéfinis&#10;</xsl:text>
            <xsl:variable name="CatGram" select="'PROind'"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@pos = $CatGram]" group-by="@lemma">
                <xsl:sort order="ascending" select="@msd"/>
                <xsl:variable name="lemma" select="current-grouping-key()"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:value-of select="$lemma"/>
                <xsl:text> nb.</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>cas&#09;masc&#09;fém&#09;neutre&#10;</xsl:text>
                <xsl:call-template name="declinaisonPro">
                    <xsl:with-param name="CatGram" select="$CatGram"/>
                    <xsl:with-param name="lemma" select="$lemma"/>
                </xsl:call-template>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
        </xsl:result-document>

    </xsl:template>






</xsl:stylesheet>
