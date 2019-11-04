<?xml version="1.0" encoding="UTF-8"?>
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
            <xsl:text>Les déterminants relatifs et interrogatifs&#10;</xsl:text>
            <xsl:call-template name="tableauFormes">
                <xsl:with-param name="CatGram" select="'DETrel|DETint'"/>
            </xsl:call-template>           
            <xsl:text>&#10;</xsl:text>         
            <xsl:text>Les déterminants indéfinis&#10;</xsl:text>
            <xsl:call-template name="tableauFormes">
                <xsl:with-param name="CatGram" select="'DETind'"/>
            </xsl:call-template>     
            <xsl:text>&#10;</xsl:text>
        </xsl:result-document>
        
    </xsl:template>
    
    
    <!-- Règles pour récupérer toutes les formes en fonction d'un cas  -->
    <xsl:template name="cas">
        <xsl:param name="cas" required="yes"/>
        <xsl:param name="lemma" required="yes"/>
        <xsl:param name="CatGram" required="yes"/>
        <xsl:for-each-group select="current-group()[matches(@msd, $cas)]"
            group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <!-- Affichage du nombre de termes ayant la même graphie -->
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <!-- calcul du pourcentage de la graphie parmi les autres formes du même terme au même cas et au même genre -->
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@pos, $CatGram) and matches(@msd, $cas) and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
    </xsl:template>
    <!-- Règles pour récupérer toutes les formes en fonction d'un cas et d'une personne  -->
    <xsl:template name="casPers">
        <xsl:param name="cas" required="yes"/>
        <xsl:param name="pers" required="yes"/>
        <xsl:param name="lemma" required="yes"/>
        <xsl:param name="CatGram" required="yes"/>
        <xsl:for-each-group select="current-group()[matches(@msd, $cas)]"
            group-by="lower-case(.)">
            <xsl:sort order="ascending" select="count(current-group())"/>
            <xsl:value-of select="."/>
            <xsl:text> (nb. </xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of
                select="round(count(current-group()) div count(//w[matches(@msd, concat($pers,'\|', $cas)) and matches(@pos, $CatGram) and @lemma = $lemma]) * 100)"/>
            <xsl:text>%)</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#09;</xsl:text>
    </xsl:template>
    
    <!-- Règles pour récupérer toutes les formes d'une catégorie grammaticales et les classer dans un tableau  -->
    <xsl:template name="tableauFormesPers">
        <xsl:param name="CatGram"/>
        <xsl:text>&#10;</xsl:text>  
        <xsl:for-each-group select="//w[matches(@pos, $CatGram)]" group-by="@lemma">
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
            <xsl:text>CSS&#09;</xsl:text>
            <xsl:call-template name="casPers">
                <xsl:with-param name="cas" select="$CSSm"/>
                <xsl:with-param name="pers" select="$pers"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:call-template name="casPers">
                <xsl:with-param name="cas" select="$CSSf"/>
                <xsl:with-param name="pers" select="$pers"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:call-template name="casPers">
                <xsl:with-param name="cas" select="$CSSn"/>
                <xsl:with-param name="pers" select="$pers"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CRS&#09;</xsl:text>
            <xsl:call-template name="casPers">
                <xsl:with-param name="cas" select="$CSRm"/>
                <xsl:with-param name="pers" select="$pers"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:call-template name="casPers">
                <xsl:with-param name="cas" select="$CSRf"/>
                <xsl:with-param name="pers" select="$pers"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:call-template name="casPers">
                <xsl:with-param name="cas" select="$CSRn"/>
                <xsl:with-param name="pers" select="$pers"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CIS&#09;</xsl:text>
            <xsl:call-template name="casPers">
                <xsl:with-param name="cas" select="$CSIm"/>
                <xsl:with-param name="pers" select="$pers"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:call-template name="casPers">
                <xsl:with-param name="cas" select="$CSIf"/>
                <xsl:with-param name="pers" select="$pers"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template> 
            <xsl:call-template name="casPers">
                <xsl:with-param name="cas" select="$CSIn"/>
                <xsl:with-param name="pers" select="$pers"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CSP&#09;</xsl:text>
            <xsl:call-template name="casPers">
                <xsl:with-param name="cas" select="$CPSm"/>
                <xsl:with-param name="pers" select="$pers"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:call-template name="casPers">
                <xsl:with-param name="cas" select="$CPSf"/>
                <xsl:with-param name="pers" select="$pers"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:call-template name="casPers">
                <xsl:with-param name="cas" select="$CPSn"/>
                <xsl:with-param name="pers" select="$pers"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CRP&#09;</xsl:text>
            <xsl:call-template name="casPers">
                <xsl:with-param name="cas" select="$CPRm"/>
                <xsl:with-param name="pers" select="$pers"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:call-template name="casPers">
                <xsl:with-param name="cas" select="$CPRf"/>
                <xsl:with-param name="pers" select="$pers"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:call-template name="casPers">
                <xsl:with-param name="cas" select="$CPRn"/>
                <xsl:with-param name="pers" select="$pers"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CIP&#09;</xsl:text>
            <xsl:call-template name="casPers">
                <xsl:with-param name="cas" select="$CPIm"/>
                <xsl:with-param name="pers" select="$pers"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:call-template name="casPers">
                <xsl:with-param name="cas" select="$CPIf"/>
                <xsl:with-param name="pers" select="$pers"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:call-template name="casPers">
                <xsl:with-param name="cas" select="$CPIn"/>
                <xsl:with-param name="pers" select="$pers"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    <xsl:template name="tableauFormes">
        <!-- Ajout d'un paramètre qui est la catégorie grammaticale à étudier -->
        <xsl:param name="CatGram"/>
        <xsl:text>&#10;</xsl:text>
        <!-- Premier classement des termes en fonction du lemme -->
        <xsl:for-each-group select="//w[matches(@pos, $CatGram)]" group-by="@lemma">
            <xsl:sort order="ascending" select="@pos"/>
            <!-- Affichage du lemme traité -->
            <xsl:variable name="lemma" select="current-grouping-key()"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:value-of select="$lemma"/>
            <!-- Affichage du nombre d'occurrences totales d'un même terme -->
            <xsl:text> nb.</xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>&#10;</xsl:text>
            <!-- classement des formes du terme en fonction de son cas (vertical) et de son genre (horizontal) -->
            <!-- classement des formes au CSS masculin en fonction de la graphie -->
            <xsl:text>cas&#09;masc&#09;fém&#09;neutre&#10;</xsl:text>
            <xsl:text>CSS&#09;</xsl:text>
            <xsl:call-template name="cas">
              <xsl:with-param name="cas" select="$CSSm"/>
              <xsl:with-param name="CatGram" select="$CatGram"/>
              <xsl:with-param name="lemma" select="$lemma"/>  
            </xsl:call-template>
            <!-- classement des formes au CSS féminin -->
            <xsl:call-template name="cas">
                <xsl:with-param name="cas" select="$CSSf"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>  
            </xsl:call-template>
            <!-- classement des formes au CSS neutre -->
            <xsl:call-template name="cas">
                <xsl:with-param name="cas" select="$CSSn"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>  
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CRS&#09;</xsl:text>
            <!-- classement des formes au CRS masculin -->
            <xsl:call-template name="cas">
                <xsl:with-param name="cas" select="$CSRm"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>  
            </xsl:call-template>
            <!-- classement des formes au CRS féminin -->
            <xsl:call-template name="cas">
                <xsl:with-param name="cas" select="$CSRf"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>  
            </xsl:call-template>
            <!-- classement des formes au CRS neutre -->
            <xsl:call-template name="cas">
                <xsl:with-param name="cas" select="$CSRn"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>  
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CIS&#09;</xsl:text>
            <!-- classement des formes au CIS masculin -->
            <xsl:call-template name="cas">
                <xsl:with-param name="cas" select="$CSIm"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>  
            </xsl:call-template>
            <!-- classement des formes au CIS féminin -->
            <xsl:call-template name="cas">
                <xsl:with-param name="cas" select="$CSIf"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>  
            </xsl:call-template>
            <!-- classement des formes au CIS neutre -->
            <xsl:call-template name="cas">
                <xsl:with-param name="cas" select="$CSIn"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>  
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <!-- même chose pour chacun des cas et des genres pour le pluriel -->
            <xsl:text>CSP&#09;</xsl:text>
            <xsl:call-template name="cas">
                <xsl:with-param name="cas" select="$CPSm"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>  
            </xsl:call-template>
            <xsl:call-template name="cas">
                <xsl:with-param name="cas" select="$CPSf"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>  
            </xsl:call-template>
            <xsl:call-template name="cas">
                <xsl:with-param name="cas" select="$CPSn"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>  
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CRP&#09;</xsl:text>
            <xsl:call-template name="cas">
                <xsl:with-param name="cas" select="$CPRm"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>  
            </xsl:call-template>
            <xsl:call-template name="cas">
                <xsl:with-param name="cas" select="$CPRf"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>  
            </xsl:call-template>
            <xsl:call-template name="cas">
                <xsl:with-param name="cas" select="$CPRn"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>  
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CIP&#09;</xsl:text>
            <xsl:call-template name="cas">
                <xsl:with-param name="cas" select="$CPIm"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>  
            </xsl:call-template>
            <xsl:call-template name="cas">
                <xsl:with-param name="cas" select="$CPIf"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>  
            </xsl:call-template>
            <xsl:call-template name="cas">
                <xsl:with-param name="cas" select="$CPIn"/>
                <xsl:with-param name="CatGram" select="$CatGram"/>
                <xsl:with-param name="lemma" select="$lemma"/>  
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
   
    
</xsl:stylesheet>
