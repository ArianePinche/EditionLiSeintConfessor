<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:fn="http://fn.com" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:function name="fn:normalize">
        <xsl:param name="input"/>
        <xsl:value-of
            select="translate(normalize-unicode(lower-case($input), 'NFKD'), 'áàâäéèêëíìîïóòôöúùûü', 'aaaaeeeeiiiioooouuuu')"
        />
    </xsl:function>
    <xsl:output method="text"/>


    <!-- Traitement des consonnantismes / Le plan suit les chapitres de la Petite grammaire de l'ancien picard de C. T. Gossen-->
    <xsl:template match="/">
        <xsl:message select="normalize-unicode('éûü')"/>
        <xsl:result-document href="../../resultats//Consonnantisme38-41.tsv">
            <!-- §38, 41 -->
            <!--  Alternance graphique entre <c> et <ch> (§38, §41)  -->
            <xsl:variable name="regex_c" select="'c[^hzrtyuopqsdfghjklmwxcvbn]'"/>
            <xsl:variable name="regex_ch" select="'ch[^zrtyuopqsdfghjklmwxcvbn]'"/>
            <xsl:variable name="lemma_match1" select="'c[^hzrtyuopqsdfghjklmwxcvbn]'"/>
            <xsl:variable name="lemma_match2" select="'ch[^zrtyuopqsdfghjklmwxcvbn]'"/>

            <xsl:text>C - Ch </xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Ch </xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="count(//w[matches(fn:normalize(@lemma), $regex_ch)])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>C </xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="count(//w[matches(fn:normalize(@lemma), $regex_c)])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Graphie ch pour c</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="descendant::w[matches(fn:normalize(@lemma), $lemma_match1)]"
                group-by="@lemma">
                <xsl:sort order="descending" select="count(//w[@lemma = current-grouping-key()])"/>
                <xsl:variable name="sorting-key" select="fn:normalize(current-grouping-key())"/>
                <xsl:variable name="ch"
                    select="//w[@lemma = current-grouping-key() and matches(fn:normalize(./text()), $regex_ch)]"/>
                <xsl:variable name="c"
                    select="//w[@lemma = current-grouping-key() and matches(fn:normalize(./text()), $regex_c)]"/>
                <xsl:if test="current-group()[count($ch) != 0]">
                    <xsl:text>lemme : </xsl:text>
                    <xsl:value-of select="$sorting-key"/>
                    <xsl:text>&#09;ch: </xsl:text>
                    <xsl:value-of select="count($ch)"/>
                    <xsl:text>&#09;c: </xsl:text>
                    <xsl:value-of select="count($c)"/>
                    <xsl:text>&#10;</xsl:text>
                    <xsl:call-template name="forms">
                        <xsl:with-param name="nodes" select="$ch, $c"/>
                    </xsl:call-template>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Graphie c pour ch</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="descendant::w[matches(fn:normalize(@lemma), $lemma_match2)]"
                group-by="@lemma">
                <xsl:sort order="descending" select="count(//w[@lemma = current-grouping-key()])"/>
                <xsl:variable name="sorting-key" select="fn:normalize(current-grouping-key())"/>
                <xsl:variable name="ch"
                    select="//w[@lemma = current-grouping-key() and matches(fn:normalize(./text()), $regex_ch)]"/>
                <xsl:variable name="c"
                    select="//w[@lemma = current-grouping-key() and matches(fn:normalize(./text()), $regex_c)]"/>
                <xsl:if test="current-group()[count($c) != 0]">
                    <xsl:text>lemme : </xsl:text>
                    <xsl:value-of select="$sorting-key"/>
                    <xsl:text>&#09;ch: </xsl:text>
                    <xsl:value-of select="count($ch)"/>
                    <xsl:text>&#09;c: </xsl:text>
                    <xsl:value-of select="count($c)"/>
                    <xsl:text>&#10;</xsl:text>
                    <xsl:call-template name="forms">
                        <xsl:with-param name="nodes" select="$ch, $c"/>
                    </xsl:call-template>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>
            </xsl:for-each-group>

        </xsl:result-document>
        <xsl:result-document href="../../resultats/Consonnantisme43-55.tsv">
            <xsl:text>&#10;</xsl:text>
            <!-- $43 -->
            <!-- aqua > pic. eve,eaue -->
            <xsl:text>Graphie de eau :</xsl:text>
            <xsl:call-template name="compteOcc">
                <xsl:with-param name="lemma" select="'aigue'"/>
            </xsl:call-template>
            <!-- §42 -->
            <xsl:text>G+a lat. Et G + a,e,i germanique – conservation de la gutturale.&#10;</xsl:text>
            <xsl:text>§42 g pic. vs j fr à l'initiale&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), '^g') and matches(fn:normalize(@lemma), '^j')]"
                />
            </xsl:call-template>
            <xsl:text>§42 g pic. vs j fr à l'intérieur&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), '^(\w|ç)+g(\w|ç)*') and matches(fn:normalize(@lemma), '^(\w|ç)+j(\w|ç)*')]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§42 gu/gh pic. vs g à l'initiale &#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), '^g[u|h]') and not(matches(fn:normalize(@lemma), '^g[u|h]'))]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§42 gu/gh pic. vs g à l'intérieur &#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), '^\w+g[u|h]\w*') and not(matches(fn:normalize(@lemma), '^\w+g[u|h]\w*'))]"
                />
            </xsl:call-template>
            <!-- §41,45 -->
            <xsl:text> g > ch en final &#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), '^[\w|ç]+ch[e|i|ï|é|a][e|é]?[s|r]?$') and matches(fn:normalize(@lemma), '^[\w|ç]+g[e|i|ï|é]')]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <!-- §46 -->
            <xsl:text>Les dentales : conservation d'un t final&#10;</xsl:text>
            <xsl:text>Conservation d'un t final dans les ppe&#10;</xsl:text>
            <xsl:for-each-group
                select="//w[matches(@type, 'POS=VERppe') and matches(fn:normalize(text()), '^\w*t[e]?$')]"
                group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of
                    select="count(//w[@lemma = current-grouping-key()] and matches(@type, 'POS=VERppe'))"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by="lower-case(.)">
                    <xsl:value-of select="."/>
                    <xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Conservation d'un t final dans les autres mots&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(@type, 'NOMcom') and matches(fn:normalize(text()), '^(\w|ç)*t$') and not(matches(fn:normalize(@lemma), '^(\w|ç)*t\d?$'))]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <!-- $ 49 -->
            <xsl:text>Confusion graphique de -s- et -ss-&#10;</xsl:text>
            <xsl:text>Graphie -ss- pour -s-&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), 'ss') and not(matches(fn:normalize(@lemma), 'ss')) and not(matches(@type, 'VER'))]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Graphie -s- pour -ss-&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(@lemma, 'ss') and not(matches(fn:normalize(text()), 'ss')) and not(matches(@type, 'VER'))]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§50 s intérieur devant consonne entraine en r en pic&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), '^(\w|ç)+r[zrtpqsdfghjklmwxcvbn](\w|ç)+$') and matches(fn:normalize(@lemma), '^(\w|ç)+s[zrtpqsdfghjklmwxcvbn](\w|ç)+') and not(matches(@type, 'POS=VERcjg'))]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les liquides&#10;</xsl:text>
            <xsl:text>§55 rl passe à ll assimilation&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(@lemma), 'rl') and matches(fn:normalize(text()), 'll')]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>r parasite ?&#10;</xsl:text>
            <!-- Attention ne permet pas de trouver le phénomène dans un terme qui contient déjà un r -->
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(@type, 'NOMcom') and matches(fn:normalize(text()), 'r') and not(matches(fn:normalize(@lemma), 'r'))]"
                />
            </xsl:call-template>
            <xsl:text>Grapihe de tristesse</xsl:text>
            <xsl:call-template name="compteOcc">
                <xsl:with-param name="lemma" select="'tristece'"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>labdacisme ?&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(@type, 'NOMcom') and matches(@lemma, 'r') and not(matches(text(), 'r')) and matches(text(), 'l')]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
        </xsl:result-document>
        <xsl:result-document href="../../resultats/Consonnantisme56-62.tsv">
            <xsl:text>&#10;</xsl:text>
            <!-- §56 -->
            <xsl:text>Dissibilation du -r- &#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(@lemma), '^[azetyuiopqsdfghjklmwxcvbnç]+r[azetyuiopqsdfghjklmwxcvbnç]+r[azetyuiopqsdfghjklmwxcvbnç]+') and matches(fn:normalize(text()), '^[azetyuiopqsdfghjklmwxcvbnç]*r[azetyuiopqsdfghjklmwxcvbnç]') and not(matches(@type, 'VER'))]"
                />
            </xsl:call-template>
            <!-- §57 -->
            <xsl:text>métathèse du groupe er/re &#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(@lemma), '^\w*[zrtpqsdfghjklmwxcvbn]+er[zrtpqsdfghjklmwxcvbn]+\w*\d?') and matches(fn:normalize(text()), '^\w*[ztpqsdfghjklmwxcvbn]+re[zrtpqsdfghjklmwxcvbn]+\w*')]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Cas particulier des verbes au futur&#10;</xsl:text>
            <xsl:for-each-group
                select="//w[matches(fn:normalize(text()), '^\w*rr\w*') and matches(@type, 'fut')]"
                group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(//w[@lemma = current-grouping-key()])"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by=".">
                    <xsl:value-of select="."/>
                    <xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <!-- §58 -->
            <xsl:text>Chute du l dans le groupe a + l + consonne&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), 'a[zrtpqsdfgjkmwxcvbn]') and matches(fn:normalize(@lemma), 'a(u|l)[zrtpqsdfgjkmwxcvbn]')]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <!-- §59 -->
            <xsl:text>l + yod à la final pic. l&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), '(e|a)(l|u)+(s|z)?$') and matches(fn:normalize(@lemma), '(e|a)i(l|u)+(s|z)?\d?$')]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§60  confusion n et n mouillé&#10;</xsl:text>
            <xsl:text>gn, n&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[not(matches(fn:normalize(text()), 'gn')) and matches(fn:normalize(@lemma), 'gn') and not(matches(@type, 'OUT'))]"
                />
            </xsl:call-template>
            <xsl:text>n, gn&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), 'gn') and not(matches(fn:normalize(@lemma), 'gn')) and not(matches(@type, 'OUT'))]"
                />
            </xsl:call-template>
            <xsl:text>gn, ng(n)&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), 'ngn') and not(matches(fn:normalize(@lemma), 'ngn'))]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>chute de la voyelle intercalaire dans les groupes lr, ml, nr </xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>l(d/b)r</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Mot&#09;Nombres d'occurrences total&#09;Nombre d'occurrences&#10;</xsl:text>
            <xsl:for-each-group
                select="//w[not(matches(fn:normalize(text()), 'l(d|b)r')) and matches(fn:normalize(@lemma), 'l(d|b)r') and not(matches(@type, 'VER'))]"
                group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(//w[@lemma = current-grouping-key()])"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group
                    select="//w[@lemma = current-grouping-key() and not(matches(@type, 'VER'))]"
                    group-by=".">
                    <xsl:value-of select="."/>
                    <xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), 'lr') and matches(@type, 'fut|cond')]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>n(d/b)r</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Mot&#09;Nombres d'occurrences total&#09;Nombre d'occurrences&#10;</xsl:text>
            <xsl:for-each-group
                select="//w[not(matches(fn:normalize(text()), 'n(d|b)r')) and matches(fn:normalize(@lemma), 'n(d|b)r') and not(matches(@type, 'VER'))]"
                group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(//w[@lemma = current-grouping-key()])"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group
                    select="//w[@lemma = current-grouping-key() and not(matches(@type, 'VER'))]"
                    group-by=".">
                    <xsl:value-of select="."/>
                    <xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), 'nr') and matches(@type, 'fut|cond')]"
                />
            </xsl:call-template>
            <xsl:text>m(d/b)l</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Mot&#09;Nombres d'occurrences total&#09;Nombre d'occurrences&#10;</xsl:text>
            <xsl:for-each-group
                select="//w[not(matches(fn:normalize(text()), '(m|n)(d|b)l')) and matches(fn:normalize(@lemma), '(m|n)(d|b)l') and not(matches(@type, 'VER'))]"
                group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(//w[@lemma = current-grouping-key()])"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group
                    select="//w[@lemma = current-grouping-key() and not(matches(@type, 'VER'))]"
                    group-by=".">
                    <xsl:value-of select="."/>
                    <xsl:text>&#09;</xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), 'mr') and matches(@type, 'fut|cond')]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <!-- $62 -->
            <xsl:text>gn, ng(n)&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), 'gn') and matches(fn:normalize(@lemma), 'ng[azertyuiopqsdfghjklmwxcvbç]')]"
                />
            </xsl:call-template>
            <xsl:text>ign-gn&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), 'ign') and not(matches(fn:normalize(@lemma), 'ign'))]"
                />
            </xsl:call-template>
        </xsl:result-document>

    </xsl:template>

    <!-- Faire apparaitre toutes les formes graphiques d'un phénomène -->
    <xsl:template name="forms">
        <xsl:param name="nodes"/>
        <xsl:for-each-group select="$nodes" group-by="fn:normalize(.)">
            <xsl:sort select="count(current-group())" order="ascending"/>
            <xsl:value-of select="current-grouping-key()"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()" group-by="@type">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#09;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>
    </xsl:template>
    

    <!-- Règle pour compter des occurences d'un terme sans condition supplémentaire -->
    <xsl:template name="compteOcc">
        <!-- Ajouter en paramètre la chaine de caractère que constitue le lemme : 'lemme' -->
        <xsl:param name="lemma" required="yes"/>
        <xsl:text>&#10;lemme : </xsl:text>
        <xsl:value-of select="$lemma"/>
        <xsl:text>&#09;Nombres d'occurrences : </xsl:text>
        <xsl:value-of select="count(//w[@lemma = $lemma])"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:call-template name="forms">
            <xsl:with-param name="nodes" select="//w[@lemma = $lemma]"/>
        </xsl:call-template>
       
        <xsl:text>&#10;</xsl:text>
    </xsl:template>


    <!-- Règle pour compter des occurences d'un terme avec condition(s) supplémentaire(s) -->
    <xsl:template name="compteOccCond">
        <!-- Ajouter en paramètre la chaine de caractère que constitue le lemme : 'lemme' -->
        <xsl:param name="lemma" required="yes"/>
        <!-- condition : chemin xpath complet pour atteindre le phénomène voulu, ex : //w[matches(@type, 'POS=PROper\|PERS.=3\|NOMB.=p\|GENRE=(m|f)\|CAS=(r|i)$') and @lemma = 'il'] -->
        <xsl:param name="condition" required="yes"/>
        <xsl:text>&#10;lemme : </xsl:text>
        <xsl:value-of select="$lemma"/>
        <xsl:text>&#09;Nombres d'occurrences : </xsl:text>
        <xsl:value-of select="count(//w[@lemma = $lemma])"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:call-template name="forms">
            <xsl:with-param name="nodes" select="$condition"/>
        </xsl:call-template>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <!-- Règle pour repérer un phénomène phonétique par comparaison entre la graphie du terme et la graphie de son lemme -->
    <xsl:template name="occurrencesPhen">
        <!-- condition : chemin xpath complet pour atteindre le phénomène voulu, ex : //w[matches(@type, 'POS=PROper\|PERS.=3\|NOMB.=p\|GENRE=(m|f)\|CAS=(r|i)$') and @lemma = 'il'] -->
        <xsl:param name="condition" required="yes"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Mot&#09;Nombres d'occurrences total&#09;Nombre d'occurrences&#10;</xsl:text>
        <xsl:for-each-group select="$condition" group-by="fn:normalize(@lemma)">
            <xsl:sort select="count(current-group())" order="ascending"/>
            <xsl:variable name="lemma" select="current-grouping-key()"/>
            <xsl:text>Lemme : </xsl:text>
            <xsl:value-of select="$lemma"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="count(//w[fn:normalize(@lemma) = $lemma])"/>
            <xsl:text>&#09;</xsl:text>
            <xsl:value-of select="count(current-group())"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:call-template name="forms">
                <xsl:with-param name="nodes" select="//w[fn:normalize(@lemma) = $lemma]"/>
            </xsl:call-template>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

</xsl:stylesheet>
