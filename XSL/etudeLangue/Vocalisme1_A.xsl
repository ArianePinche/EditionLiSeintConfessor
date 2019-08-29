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
        <xsl:result-document href="../../resultats/Vocalisme1.tsv">

            <!-- Traitement des vocalismes / Le plan suit les chapitres de la Petite grammaire de l'ancien picard de C. T. Gossen-->

    <!-- §1 -->
            <xsl:text>a libre tonique  > ei §1</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[contains(fn:normalize(text()), 'ei') and not(matches(fn:normalize(@lemma), 'ei')) and not(matches(@type, 'OUT|VER'))]"
                />
            </xsl:call-template>
            <xsl:text>Graphie de la P3 pst de savoir&#10;</xsl:text>
            <xsl:for-each-group
                select="//w[@lemma = 'savoir' and @type = 'POS=VERcjg\|MODE=ind\|TEMPS=pst\|PERS.=3\|NOMB.=s']"
                group-by="lower-case(.)">
                <xsl:value-of select="@lemma"/>
                <xsl:text>(</xsl:text>
                <xsl:value-of
                    select="count(//w[@lemma = 'savoir' and @type = 'POS=VERcjg\|MODE=ind\|TEMPS=pst\|PERS.=3\|NOMB.=s'])"/>
                <xsl:text>) : </xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>(</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            
            
            <xsl:text>avu  > au, eu, oi - essai sur poi §2&#10;</xsl:text>
            <xsl:text>Graphie du mot poi&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'poi']" group-by="lower-case(.)">
                <xsl:value-of select="@lemma"/>
                <xsl:text>(</xsl:text>
                <xsl:value-of select="count(//w[@lemma = 'poi'])"/>
                <xsl:text>) : </xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>(</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"  select="//w[matches(fn:normalize(text()), 'eu|au') and matches(fn:normalize(@lemma), 'oi') and not(matches(@type, 'VER|OUT'))]"/>
            </xsl:call-template>

   <!-- $3 -->
            <xsl:text>Alternance ar/er suivi de consonne&#10;</xsl:text>
            
            <xsl:variable name="regex_ar_consonnes" select="'ar[hzrtpqsdfghjklmwxcvbn]'"/>
            <xsl:variable name="regex_er_consonnes" select="'er[hzrtpqsdfghjklmwxcvbn]'"/>
           
            <xsl:call-template name="occurrencesAlt">
                <xsl:with-param name="condition1" select="//w[matches(fn:normalize(text()), $regex_ar_consonnes) and not(matches(@type, 'OUT|VER'))]"/>
                <xsl:with-param name="condition2" select="$regex_er_consonnes"/>
            </xsl:call-template>

   <!-- $5 -->
            <xsl:text>talis, qualis §5&#10;</xsl:text>
            
            <xsl:text>Graphie du mot tel&#10;</xsl:text>
            <xsl:text>Mot&#09;Nombres d'occurrences total&#09;</xsl:text>
            <xsl:text>tel&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'tel'])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'tel']" group-by="lower-case(.)">
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>

            <xsl:text>Graphie du mot qel&#10;</xsl:text>
            <xsl:text>Mot&#09;Nombres d'occurrences total&#09;</xsl:text>
            <xsl:text>quel1&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = 'quel1'])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = 'quel1']" group-by="lower-case(.)">
                <xsl:value-of select="."/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>

            <xsl:text>ATICU > age/aige/ege $7</xsl:text>
            <xsl:call-template name="occurrencesAlt">
                <xsl:with-param name="condition1" select="//w[matches(fn:normalize(@lemma), 'age$')]"/>
                <xsl:with-param name="condition2" select="'^aige[s|z]?$'"></xsl:with-param>
            </xsl:call-template>
            
            <!--
            <xsl:for-each-group select="" group-by="@lemma">

                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:if test="current-group()[matches(fn:normalize(text()), '^aige[s]?$')]">
                    <xsl:text>&#09;</xsl:text>
                    <xsl:for-each-group select="current-group()" group-by="lower-case(.)">
                        <xsl:value-of select="."/>
                        <xsl:text>, </xsl:text>
                    </xsl:for-each-group>
                </xsl:if>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
          -->
            <xsl:text>yod + ATA $8</xsl:text>
            <!-- Réduction de l'étude au ppe fem nom / Rajouter le pluriel -->
            <xsl:text>PPF  avec auxiliaire être </xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:value-of select="count(descendant::w[@type = 'POS=VERppe|NOMB.=s|GENRE=f|CAS=n'])"/>
            <xsl:text>ie</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="descendant::w[@type = 'POS=VERppe|NOMB.=s|GENRE=f|CAS=n']"
                group-by="matches(., 'ie$')">
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:variable name="vb1" select="'er[1-9]?$'"/>

                <xsl:text>Verbes du 1er groupe (</xsl:text>
                <xsl:value-of select="count(current-group()[matches(@lemma, $vb1)])"/>
                <xsl:text>)&#09;</xsl:text>
                <xsl:value-of select="current-group()[matches(@lemma, $vb1)]"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>autres groupes (</xsl:text>
                <xsl:value-of select="count(current-group()[not(matches(@lemma, $vb1))])"/>
                <xsl:text>)&#09;</xsl:text>
                <xsl:value-of select="current-group()[not(matches(@lemma, $vb1))]"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:for-each-group select="descendant::w[@type = 'POS=VERppe|NOMB.=s|GENRE=f|CAS=n']"
                group-by="lower-case(.)">
                <xsl:sort order="ascending"/>
                <xsl:if test="ends-with(., 'ie')">
                    <xsl:value-of select="."/>
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>

            <xsl:text>iee</xsl:text>
            <xsl:for-each-group select="descendant::w[@type = 'POS=VERppe|NOMB.=s|GENRE=f|CAS=n']"
                group-by="ends-with(., 'iee')">
                <xsl:text>&#10;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>, </xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:for-each-group select="descendant::w[@type = 'POS=VERppe|NOMB.=s|GENRE=f|CAS=n']"
                group-by="lower-case(.)">
                <xsl:if test="ends-with(., 'iee')">
                    <xsl:value-of select="."/>
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Autre</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="descendant::w[@type = 'POS=VERppe|NOMB.=s|GENRE=f|CAS=n']"
                group-by="lower-case(.)">
                <xsl:sort order="ascending"/>
                <xsl:if test="not(ends-with(., 'iee')) and not(ends-with(., 'ie'))">
                    <xsl:value-of select="."/>
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            
            <!-- a initial -->

            <xsl:variable name="regex_ainit" select="'^\w?a'"/>
            <xsl:variable name="regex_ahiatus" select="'^\w?a[aeo]'"/>
            <xsl:text>Nombre de mots en A inital : </xsl:text>
            <xsl:value-of select="count(descendant::w[matches(fn:normalize(.), $regex_ainit)])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>A initiale en hiatus </xsl:text>
            <xsl:value-of select="count(descendant::w[matches(fn:normalize(.), $regex_ahiatus)])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="descendant::w[matches(fn:normalize(.), $regex_ahiatus)]"
                group-by="@lemma">
                <xsl:sort order="ascending"/>
                <xsl:variable select="@lemma" name="lemma"/>
                <xsl:value-of select="."/>
                <xsl:text> (</xsl:text>
                <xsl:value-of select="@lemma"/>
                <xsl:text>) : </xsl:text>
                <xsl:for-each-group select="current-group()" group-by="lower-case(.)">
                    <xsl:value-of select="."/>
                    <xsl:text>, </xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>a/ai</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="descendant::w[matches(., 'ai')]" group-by="@lemma">
                <xsl:sort order="ascending"/>
                <xsl:variable select="@lemma" name="lemma"/>
                <xsl:if test="not(matches(@lemma, 'ai')) and matches(@lemma, 'a')">
                    <xsl:value-of select="."/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="@lemma"/>
                    <xsl:text>) : </xsl:text>
                    <xsl:for-each-group select="current-group()" group-by="lower-case(.)">
                        <xsl:value-of select="."/>
                        <xsl:text>, </xsl:text>
                    </xsl:for-each-group>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>
            </xsl:for-each-group>
        </xsl:result-document>
    </xsl:template>

    <!-- Règle pour repérer un phénomène phonétique par comparaison avec la graphie de son lemme -->
    <xsl:template name="occurrencesPhen">
        <xsl:param name="condition" required="yes"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Mot&#09;Nombres d'occurrences total&#09;Nombre d'occurrences&#10;</xsl:text>
        <xsl:for-each-group select="$condition" group-by="@lemma">
            <xsl:sort select="current-grouping-key()" order="ascending"/>
            <xsl:variable name="lemma" select="current-grouping-key()"/>
            <xsl:value-of select="$lemma"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="count(//w[@lemma = $lemma])"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma = $lemma]" group-by="lower-case(fn:normalize(text()))">
                <xsl:sort select="current-grouping-key()" order="ascending"/>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <!-- Règle pour repérer les alternances graphiques -->
    <xsl:template name="occurrencesAlt">
        
        <!-- condition 1 = xpath + graphie attendue -->
        <xsl:param name="condition1" required="yes"/>
        <!--condtion 1 = graphie alternative -->
        <xsl:param name="condition2" required="yes"/>
        <xsl:text>Mot&#09;Nombre total&#09;Nombre d'occurrences en condition 1&#09;Nombre d'occurrences condition 2&#10;</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select="$condition1" group-by="@lemma">
            <xsl:sort select="current-grouping-key()" order="ascending"/>
            <xsl:variable name="lemma" select="current-grouping-key()"/>
            <xsl:if
                test="//w[@lemma = current-grouping-key() and matches(text(),$condition2)]">
                <xsl:value-of select="$lemma"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(//w[@lemma = $lemma])"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(//w[@lemma = current-grouping-key() and matches(text(),$condition2)])"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:for-each-group select="//w[@lemma = $lemma]" group-by="lower-case(fn:normalize(text()))">
                    <xsl:sort select="current-grouping-key()" order="ascending"/>
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>&#10;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

</xsl:stylesheet>
