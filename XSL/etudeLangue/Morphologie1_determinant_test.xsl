﻿<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://fn.com"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="text" encoding="UTF-8"/>
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
    
    <xsl:template name="tableauFormesPers">
        <xsl:param name="CatGram"/>
        <xsl:text>&#10;</xsl:text>  
        <xsl:for-each-group select="//w[matches(@type, $CatGram)]" group-by="@lemma">
            <xsl:variable name="lemma" select="current-grouping-key()"/>
            <xsl:variable name="pers">
                <xsl:value-of select="tokenize(@type, '\|')[2]"/>
            </xsl:variable>
            <xsl:text>&#10;</xsl:text>
            <xsl:value-of select="$lemma"/>
            <xsl:text> nb.</xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>cas&#09;masc&#09;fém&#09;neutre&#10;</xsl:text>
            <xsl:text>CSS&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CSSm)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram,'\|',$pers,'\|', $CSSm)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CSSf)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|',$pers,'\|', $CSSf)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CSSn)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|',$pers,'\|', $CSSn)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CRS&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CSRm)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|',$pers,'\|', $CSRm)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CSRf)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|',$pers,'\|', $CSRf)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CSRn)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|',$pers,'\|', $CSRn)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CIS&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CSIm)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|',$pers,'\|', $CSIm)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CSIf)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|',$pers,'\|', $CSIf)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CSIn)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|',$pers,'\|', $CSIn)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CSP&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CPSm)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|',$pers,'\|', $CPSm)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CPSf)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|',$pers,'\|', $CPSf)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CPSn)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|',$pers,'\|', $CPSn)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CRP&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CPRm)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|',$pers,'\|', $CPRm)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CPRf)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|',$pers,'\|', $CPRf)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CPRn)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|',$pers,'\|', $CPRn)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CIP&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CPIm)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|',$pers,'\|', $CPIm)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CPIf)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|',$pers,'\|', $CPIf)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CPIn)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|',$pers,'\|', $CPIn)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    <!-- Règle pour récupérer toutes les formes d'une catégorie grammaticales et les classer dans un tableau  -->
    <xsl:template name="tableauFormes">
        <!-- Ajout d'un paramètre qui est la catégorie grammaticale à étudier -->
        <xsl:param name="CatGram"/>
        <xsl:text>&#10;</xsl:text>
        <!-- Premier classement des termes en fonction du lemme -->
        <xsl:for-each-group select="//w[matches(@type, $CatGram)]" group-by="@lemma">
            <xsl:sort order="ascending" select="@type"/>
            <!-- Affichage du lemme traité -->
            <xsl:variable name="lemma" select="current-grouping-key()"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:value-of select="$lemma"/>
            <!-- Affichage du nombre d'occurrences totales d'un même terme -->
            <xsl:text> nb.</xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>&#10;</xsl:text>
            <!-- classement des formes du terme en fonction de son cas (vertical) et de son genre (horizontal) -->
            <xsl:text>cas&#09;masc&#09;fém&#09;neutre&#10;</xsl:text>
            <xsl:text>CSS&#09;</xsl:text>
            <!-- classement des formes au CSS masculin en fonction de la graphie -->
            <xsl:for-each-group select="current-group()[matches(@type, $CSSm)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <!-- Affichage du nombre de termes ayant la même graphie -->
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <!-- calcul du pourcentage de la graphie parmi les autres formes du même terme au même cas et au même genre -->
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|', $CSSm)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <!-- classement des formes au CSS féminin -->
            <xsl:for-each-group select="current-group()[matches(@type, $CSSf)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|', $CSSf)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>  
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <!-- classement des formes au CSS neutre -->
            <xsl:for-each-group select="current-group()[matches(@type, $CSSn)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|', $CSSn)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CRS&#09;</xsl:text>
            <!-- classement des formes au CRS masculin -->
            <xsl:for-each-group select="current-group()[matches(@type, $CSRm)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|', $CSRm)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <!-- classement des formes au CRS féminin -->
            <xsl:for-each-group select="current-group()[matches(@type, $CSRf)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|', $CSRf)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <!-- classement des formes au CRS neutre -->
            <xsl:for-each-group select="current-group()[matches(@type, $CSRn)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|', $CSRn)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if> 
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CIS&#09;</xsl:text>
            <!-- classement des formes au CIS masculin -->
            <xsl:for-each-group select="current-group()[matches(@type, $CSIm)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|', $CSIm)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <!-- classement des formes au CIS féminin -->
            <xsl:for-each-group select="current-group()[matches(@type, $CSIf)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|', $CSIf)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <!-- classement des formes au CIS neutre -->
            <xsl:for-each-group select="current-group()[matches(@type, $CSIn)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|', $CSIn)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <!-- même chose pour chacun des cas et des genres pour le pluriel -->
            <xsl:text>CSP&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CPSm)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|', $CPSm)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CPSf)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|', $CPSf)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CPSn)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|', $CPSn)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CRP&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CPRm)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|', $CPRm)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CPRf)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|', $CPRf)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CPRn)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|', $CPRn)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CIP&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CPIm)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|', $CPIm)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CPIf)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|', $CPIf)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, $CPIn)]"
                group-by="lower-case(.)">
                <xsl:sort order="ascending" select="count(current-group())"/>
                <xsl:value-of select="."/>
                <xsl:text> (nb. </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, concat($CatGram, '\|', $CPIn)) and @lemma = $lemma]) * 100)"/>
                <xsl:text>%)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    <xsl:template match="/">

        <xsl:result-document href="../../resultats/analyseMorphologique1_Déterminants.tsv">
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les déterminants définis&#10;</xsl:text>
            <xsl:call-template name="tableauFormes">
                <xsl:with-param name="CatGram" select="'DETdef'"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>        
            <xsl:text>Les déterminants indéfinis&#10;</xsl:text>
            <xsl:call-template name="tableauFormes">
                <xsl:with-param name="CatGram" select="'DETndf'"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
           <xsl:text>Les déterminants demonstratifs&#10;</xsl:text>
            <xsl:call-template name="tableauFormes">
                <xsl:with-param name="CatGram" select="'DETdem'"/>
            </xsl:call-template>
            <xsl:text>Les détermiants possessifs&#10;</xsl:text>
            <xsl:call-template name="tableauFormesPers">
                <xsl:with-param name="CatGram" select="'DETpos'"/>
            </xsl:call-template>  
            <xsl:text>Les adjectifs possessifs&#10;</xsl:text>
            <xsl:call-template name="tableauFormesPers">
                <xsl:with-param name="CatGram" select="'ADJpos'"/>
            </xsl:call-template>  
            <xsl:text>Les déterminants relatifs&#10;</xsl:text>
            <xsl:call-template name="tableauFormes">
                <xsl:with-param name="CatGram" select="'DETrel'"/>
            </xsl:call-template>         
            <xsl:text>Les déterminants interrogatifs&#10;</xsl:text>
            <xsl:call-template name="tableauFormes">
                <xsl:with-param name="CatGram" select="'DETint'"/>
            </xsl:call-template>       
            <xsl:text>&#10;</xsl:text>         
            <xsl:text>Les déterminants indéfinis&#10;</xsl:text>
            <xsl:call-template name="tableauFormes">
                <xsl:with-param name="CatGram" select="'DETind'"/>
            </xsl:call-template>     
            <xsl:text>&#10;</xsl:text>
        </xsl:result-document>

    </xsl:template>

</xsl:stylesheet>
