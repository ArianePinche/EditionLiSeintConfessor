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
            <!-- §44 -->
            <xsl:text>Insertion d'un e svarabhaktique dans les groupes muta + liquide : br&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(@lemma, 'br') and matches(fn:normalize(text()), 'ber')]"></xsl:with-param>
            </xsl:call-template>
            <xsl:text>Insertion d'un e svarabhaktique dans les groupes muta + liquide : pr&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(@lemma, 'pr') and matches(fn:normalize(text()), 'per')]"></xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(@lemma, 'pr') and matches(fn:normalize(text()), 'per')]"></xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="compteOcc">
                <xsl:with-param name="lemma" select="'esperit'"/>
            </xsl:call-template>
            <xsl:text>Insertion d'un e svarabhaktique dans les groupes muta + liquide : vr&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(@lemma, 'vr') and matches(fn:normalize(text()), 'ver')]"></xsl:with-param>
            </xsl:call-template>
            <xsl:text>Insertion d'un e svarabhaktique dans les groupes muta + liquide : vl&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(@lemma, 'vl') and matches(fn:normalize(text()), 'vel')]"></xsl:with-param>
            </xsl:call-template>
            
            <!-- §46 -->
            <xsl:text>Les dentales : conservation d'un t final&#10;</xsl:text>
            <xsl:text>Conservation d'un t final dans les ppe&#10;</xsl:text>
            <xsl:for-each-group
                select="//w[matches(@pos, 'POS=VERppe') and matches(fn:normalize(text()), '^\w*t[e]?$')]"
                group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of
                    select="count(//w[@lemma = current-grouping-key()] and matches(@pos, 'VERppe'))"/>
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
                    select="//w[matches(@pos, 'NOMcom') and matches(fn:normalize(text()), '^(\w|ç)*t$') and not(matches(fn:normalize(@lemma), '^(\w|ç)*t\d?$'))]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <!-- §47 -->
            <xsl:text>Insertion d'un e prostatique devant sc&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(@lemma, 'esc') and matches(fn:normalize(text()), '^sc')]"></xsl:with-param>
            </xsl:call-template>
            <xsl:text>Insertion d'un e prostatique devant st&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(@lemma, '^est') and matches(fn:normalize(text()), '^st')]"></xsl:with-param>
            </xsl:call-template>
            <xsl:text>Insertion d'un e prostatique devant sp&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(@lemma, '^esp') and matches(fn:normalize(text()), '^sp')]"></xsl:with-param>
            </xsl:call-template>
            
            <!-- $ 49 -->
            <xsl:text>Confusion graphique de -s- et -ss-&#10;</xsl:text>
            <xsl:text>Graphie -ss- pour -s-&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), 'ss') and not(matches(fn:normalize(@lemma), 'ss')) and not(matches(@pos, 'VER'))]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Graphie -s- pour -ss-&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(@lemma, 'ss') and not(matches(fn:normalize(text()), 'ss')) and not(matches(@pos, 'VER'))]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Graphie -sc- pour [s]&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), 'sc') and not(matches(fn:normalize(@lemma), 'sc')) and not(matches(@pos, 'VER|OUT'))]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <!-- §50 -->
            <xsl:text>s intérieur devant consonne entraine en r en pic&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), '^(\w|ç)+r[zrtpqsdfghjklmwxcvbn](\w|ç)+$') and matches(fn:normalize(@lemma), '^(\w|ç)+s[zrtpqsdfghjklmwxcvbn](\w|ç)+') and not(matches(@pos, 'VERcjg'))]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <!-- §51 -->
            <xsl:text>&#10;</xsl:text>
            <xsl:text>w-germ initial > pic. w &#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(@lemma), '^g') and matches(fn:normalize(text()), '^w')]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <!-- §52 -->
            <xsl:text>-abulu, abile > pic. -aule, -avle&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(@lemma), 'able$') and not(matches(fn:normalize(text()), 'able(s|z)?$')) and @pos!='ADVgen']"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <!-- §55 -->
            <xsl:text>Les liquides&#10;</xsl:text>
            <xsl:text>rl passe à ll assimilation&#10;</xsl:text>
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
                    select="//w[matches(@pos, 'NOMcom') and matches(fn:normalize(text()), 'r') and not(matches(fn:normalize(@lemma), 'r'))]"
                />
            </xsl:call-template>
            <xsl:text>Graphie de tristesse</xsl:text>
            <xsl:call-template name="compteOcc">
                <xsl:with-param name="lemma" select="'tristece'"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>labdacisme ?&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(@pos, 'NOMcom') and matches(@lemma, 'r') and not(matches(text(), 'r')) and matches(text(), 'l')]"
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
                    select="//w[matches(fn:normalize(@lemma), '^[azetyuiopqsdfghjklmwxcvbnç]+r[azetyuiopqsdfghjklmwxcvbnç]+r[azetyuiopqsdfghjklmwxcvbnç]+') and matches(fn:normalize(text()), '^[azetyuiopqsdfghjklmwxcvbnç]*r[azetyuiopqsdfghjklmwxcvbnç]') and not(matches(@pos, 'VER'))]"
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
                select="//w[matches(fn:normalize(text()), '^\w*rr\w*') and matches(@msd, 'fut')]"
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
                    select="//w[not(matches(fn:normalize(text()), 'gn')) and matches(fn:normalize(@lemma), 'gn') and not(matches(@pos, 'OUT'))]"
                />
            </xsl:call-template>
            <xsl:text>n, gn&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), 'gn') and not(matches(fn:normalize(@lemma), 'gn')) and not(matches(@pos, 'OUT'))]"
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
                select="//w[not(matches(fn:normalize(text()), 'l(d|b)r')) and matches(fn:normalize(@lemma), 'l(d|b)r') and not(matches(@pos, 'VER'))]"
                group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(//w[@lemma = current-grouping-key()])"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group
                    select="//w[@lemma = current-grouping-key() and not(matches(@pos, 'VER'))]"
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
                    select="//w[matches(fn:normalize(text()), 'lr') and matches(@msd, 'fut|cond')]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>n(d/b)r</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Mot&#09;Nombres d'occurrences total&#09;Nombre d'occurrences&#10;</xsl:text>
            <xsl:for-each-group
                select="//w[not(matches(fn:normalize(text()), 'n(d|b)r')) and matches(fn:normalize(@lemma), 'n(d|b)r') and not(matches(@pos, 'VER'))]"
                group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(//w[@lemma = current-grouping-key()])"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group
                    select="//w[@lemma = current-grouping-key() and not(matches(@pos, 'VER'))]"
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
                    select="//w[matches(fn:normalize(text()), 'nr') and matches(@msd, 'fut|cond')]"
                />
            </xsl:call-template>
            <xsl:text>m(d/b)l</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Mot&#09;Nombres d'occurrences total&#09;Nombre d'occurrences&#10;</xsl:text>
            <xsl:for-each-group
                select="//w[not(matches(fn:normalize(text()), '(m|n)(d|b)l')) and matches(fn:normalize(@lemma), '(m|n)(d|b)l') and not(matches(@pos, 'VER'))]"
                group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(//w[@lemma = current-grouping-key()])"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group
                    select="//w[@lemma = current-grouping-key() and not(matches(@pos, 'VER'))]"
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
                    select="//w[matches(fn:normalize(text()), 'mr') and matches(@msd, 'fut|cond')]"
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
            
            <!-- Ajout - vérification de la disparition de h initial -->
            <xsl:text>disparition du h initial&#10;</xsl:text>
            <xsl:call-template name="occurrencesAlt">
                <xsl:with-param name="condition1"
                    select="//w[not(matches(fn:normalize(text()), '^h'))]"/>
                <xsl:with-param name="condition2" select="'^h'"></xsl:with-param>  
            </xsl:call-template>
            <xsl:text>disparition du h initial (2, vérification)&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), '^h') and not(matches(fn:normalize(@lemma), '^h')) ]"/>
            </xsl:call-template>
            
            <!-- Ajout - vérification de l'apparition de h intercalaire-->
            <xsl:text>apparition h intercalaire&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), '^[^h]*[aeioüu]h[aeioüu]') and not(matches(fn:normalize(@lemma), 'h'))]"
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
        <!-- condition : chemin xpath complet pour atteindre le phénomène voulu, ex : //w[matches(@pos, 'PROper) and matches(@msd, 'PERS.=3\|NOMB.=p\|GENRE=(m|f)\|CAS=(r|i)$') and @lemma = 'il'] -->
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
        <!-- condition : chemin xpath complet pour atteindre le phénomène voulu, ex : //w[matches(@pos, 'PROper) and matches(@msd, 'PERS.=3\|NOMB.=p\|GENRE=(m|f)\|CAS=(r|i)$') and @lemma = 'il'] -->
        <xsl:param name="condition" required="yes"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Mot&#09;Nombres d'occurrences total&#09;Nombre d'occurrences&#10;</xsl:text>
        <xsl:choose>
            <xsl:when test="$condition">
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
            </xsl:when>
            <xsl:otherwise><xsl:text>Aucune occurrences</xsl:text></xsl:otherwise>
        </xsl:choose>
        
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:template name="occurrencesAlt">
        <!-- condition 1 = xpath + graphie attendue -->
        <xsl:param name="condition1" required="yes"/>
        <!--condtion 2 = graphie alternative -->
        <xsl:param name="condition2" required="yes"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Mot&#09;Nombre total&#09;Nombre d'occurrences en condition 1&#09;Nombre d'occurrences condition 2&#10;</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select="$condition1" group-by="fn:normalize(@lemma)">
            <xsl:sort select="count(current-group())" order="descending"/>
            <xsl:variable name="lemma" select="current-grouping-key()"/>
            <xsl:if test="//w[fn:normalize(@lemma) = current-grouping-key() and matches(fn:normalize(text()), $condition2)]">
                <xsl:text>Lemme : </xsl:text>
                <xsl:value-of select="$lemma"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(//w[fn:normalize(@lemma) = $lemma])"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of
                    select="count(//w[fn:normalize(@lemma) = current-grouping-key() and matches(fn:normalize(text()), $condition2)])"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:call-template name="forms">
                    <xsl:with-param name="nodes" select="//w[fn:normalize(@lemma) = $lemma]"/>
                </xsl:call-template>
                <xsl:text>&#10;</xsl:text>
            </xsl:if>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

</xsl:stylesheet>
