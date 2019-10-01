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
        <xsl:result-document href="../../resultats/Vocalisme1-8.tsv" >
   <!-- Traitement des vocalismes / Le plan suit les chapitres de la Petite grammaire de l'ancien picard de C. T. Gossen-->

    <!-- §1 -->
            <xsl:text>a libre tonique  > ei §1</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="//w[matches(fn:normalize(text()), '\w*ei[zrtypqsdfghjklmwxcvbn]') and not(matches(fn:normalize(@lemma), '(e|a)i')) and not(matches(@pos, 'OUT|VER'))]"
                />
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            
            
            <xsl:text>avu  > au, eu, oi - essai sur poi §2&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"  select="//w[matches(fn:normalize(text()), 'eu|au') and matches(fn:normalize(@lemma), 'oi') and not(matches(@pos, 'VER|OUT'))]"/>
            </xsl:call-template>
            <xsl:text>Graphie du mot poi&#10;</xsl:text>
            <xsl:call-template name="compteOcc">
                <xsl:with-param name="lemma" select="'poi'"/>
            </xsl:call-template>

   <!-- $3 -->
            <xsl:text>Alternance ar/er suivi de consonne&#10;</xsl:text>
            
            <xsl:variable name="regex_ar_consonnes" select="'ar[hzrtpqsdfghjklmwxcvbn]'"/>
            <xsl:variable name="regex_er_consonnes" select="'er[hzrtpqsdfghjklmwxcvbn]'"/>
           
            <xsl:call-template name="occurrencesAlt">
                <xsl:with-param name="condition1" select="//w[matches(fn:normalize(text()), $regex_ar_consonnes) and not(matches(@pos, 'OUT|VER'))]"/>
                <xsl:with-param name="condition2" select="$regex_er_consonnes"/>
            </xsl:call-template>

   <!-- $5 -->
            <xsl:text>talis, qualis §5&#10;</xsl:text>
            
            <xsl:text>Graphie du mot tel&#10;</xsl:text>
            <xsl:call-template name="compteOcc">
                <xsl:with-param name="lemma" select="tel1"></xsl:with-param>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>

            <xsl:text>Graphie du mot qel&#10;</xsl:text>
            <xsl:call-template name="compteOcc">
                <xsl:with-param name="lemma" select="quel1"></xsl:with-param>
            </xsl:call-template>
            
 <!-- $6 -->
            <xsl:text>a + yod latin > ai, a, e</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(fn:normalize(@lemma), 'ai') and not(matches(fn:normalize(text()), '(ai|ei)'))]"/>
            </xsl:call-template>

<!-- $7 -->
            <xsl:text>ATICU > age/aige/ege $7</xsl:text>
            <xsl:call-template name="occurrencesAlt">
                <xsl:with-param name="condition1" select="//w[matches(fn:normalize(@lemma), 'age$')]"/>
                <xsl:with-param name="condition2" select="'^aige[s|z]?$'"></xsl:with-param>
            </xsl:call-template>
<!-- $8 -->           
            <xsl:text>yod + ATA $8</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <!-- Réduction de l'étude au ppe fem nom pour éviter les problèmes d'accord -->
            <xsl:text>PPF des verbes du 1er groupe en ier avec auxiliaire être :  Nb total d'occurrence&#09;</xsl:text>
            <xsl:variable name="vb1" select="'ier[1-9]?$'"/>
            <xsl:value-of
                select="count(descendant::w[matches(@type, 'POS=VERppe\|NOMB.=(s|p)\|GENRE=f\|CAS=n') and matches(@lemma, $vb1)])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Participe en -ie(s) : Nb total d'occurrence&#09;</xsl:text>
            <xsl:value-of
                select="count(descendant::w[matches(@pos, 'VERppe') and matches(@msd, 'NOMB.=(s|p)\|GENRE=f\|CAS=n') and matches(@lemma, $vb1) and matches(fn:normalize(text()), '(i|ï)e(s|z)?$')])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Terme</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:text>Nombre d'occurrences</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:text>Occurrences du texte</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group
                select="descendant::w[matches(@pos, 'VERppe') and matches(@msd, 'NOMB.=(s|p)\|GENRE=f\|CAS=n') and matches(@lemma, $vb1) and matches(fn:normalize(text()), '(i|ï)e(s|z)?$')]"
                group-by="@lemma">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by="lower-case(.)">
                    <xsl:value-of select="."/>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Participe en -iee(s) : Nb total d'occurrence&#09;</xsl:text>
            <xsl:value-of
                select="count(descendant::w[matches(@pos, 'VERppe') and matches(@msd, 'NOMB.=(s|p)\|GENRE=f\|CAS=n') and matches(@lemma, $vb1) and matches(fn:normalize(text()), '(i|ï)ee(s|z)?$')])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Terme</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:text>Nombre d'occurrences</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:text>Occurrences du texte</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group
                select="descendant::w[matches(@pos, 'VERppe') and matches(@msd, 'NOMB.=(s|p)\|GENRE=f\|CAS=n') and matches(@lemma, $vb1) and matches(fn:normalize(text()), '(i|ï)ee(s|z)?$')]"
                group-by="@lemma">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by="lower-case(.)">
                    <xsl:value-of select="."/>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Autres formes : Nb total d'occurrence&#09;</xsl:text>
            <xsl:value-of
                select="count(descendant::w[matches(@pos, 'VERppe') and matches(@msd, 'NOMB.=(s|p)\|GENRE=f\|CAS=n') and matches(@lemma, $vb1) and not(matches(fn:normalize(text()), '(i|ï)e(e)?(s|z)?$'))])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Terme</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:text>Nombre d'occurrences</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:text>Occurrences du texte</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group
                select="descendant::w[matches(@pos, 'VERppe') and matches(@msd, 'NOMB.=(s|p)\|GENRE=f\|CAS=n') and matches(@lemma, $vb1) and not(matches(fn:normalize(text()), '(i|ï)e(e)?(s|z)?$'))]"
                group-by="@lemma">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by="lower-case(.)">
                    <xsl:value-of select="."/>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
        </xsl:result-document>
        <xsl:result-document href="../../resultats/Vocalisme9-21.tsv" >
            <!-- E ouvert -->
            <!-- $9 -->
            <xsl:text>Graphie du mot Dieu $9&#10;</xsl:text>
            <xsl:call-template name="compteOcc">
                <xsl:with-param name="lemma" select="'dieu'"/>
            </xsl:call-template>
            <xsl:text>Graphie du mot lieu $25&#10;</xsl:text>
            <xsl:call-template name="compteOcc">
                <xsl:with-param name="lemma" select="'lieu'"/>
            </xsl:call-template>
            <!-- $10 -->
            <xsl:text> Réduction de e ouvert libre en i ou en e §10&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition"
                    select="
                    //w[matches(fn:normalize(@lemma), '[zrtpqsdfgjklmwxcvbnç]ie[zrtpqsdfgjklmwxcvbnç]') and not(matches(@msd, 'OUT|VER')) and
                    not(matches(fn:normalize(text()), '[zrtpqsdfgjklmwxcvbnç]ie[zrtpqsdfgjklmwxcvbnç]'))]"
                />
            </xsl:call-template>
            <xsl:text>Adjectif lié au fem.&#09;NB occ. : </xsl:text><xsl:value-of select="count(//w[@lemma ='lié1' and matches(@msd,'GENRE=f')])"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:call-template name="compteOccCond">
                <xsl:with-param name="lemma" select="'lié1'"/>
                <xsl:with-param name="condition" select="//w[@lemma ='lié1' and matches(@msd,'GENRE=f')]"/>
            </xsl:call-template>
            <!-- $11 -->
            <xsl:text> reduction de e ouvert > ie §11&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[not(matches(fn:normalize(@lemma), '[zrtypqsdfghjklmwxcvbnç](i)?(i|ï)e[zrtypqsdfghjklmwxcvbnç]')) and not(matches(@pos, 'OUT|VER')) and matches(fn:normalize(text()),'[zrtypqsdfghjklmwxcvbnç]ie[zrtypqsdfghjklmwxcvbnç]')]"/>
            </xsl:call-template>
            <!-- Etude de cas -->
            <xsl:text>Graphie du mot près&#10;</xsl:text>
            <xsl:call-template name="compteOccCond">
                <xsl:with-param name="lemma" select="'près'"/>
                <xsl:with-param name="condition" select="//w[@lemma ='près' and matches(fn:normalize(text()),'ie')]"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Graphie du mot après&#10;</xsl:text>
            <xsl:call-template name="compteOccCond">
                <xsl:with-param name="lemma" select="'après'"/>
                <xsl:with-param name="condition" select="//w[@lemma ='près' and matches(fn:normalize(text()),'ie')]"/>
            </xsl:call-template>
            <xsl:text>Graphie du mot apeler&#10;</xsl:text>
            <xsl:call-template name="compteOccCond">
                <xsl:with-param name="lemma" select="'apeler'"/>
                <xsl:with-param name="condition" select="//w[@lemma ='près' and matches(fn:normalize(text()),'ie')]"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Graphie du mot arester&#10;</xsl:text>
            <xsl:call-template name="compteOccCond">
                <xsl:with-param name="lemma" select="'arester'"/>
                <xsl:with-param name="condition" select="//w[@lemma ='près' and matches(fn:normalize(text()),'ie')]"/>
            </xsl:call-template>
            <!-- $12 -->      
            <xsl:text>§12.1 ellus/os > eaus > iaus&#10;</xsl:text> 
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(fn:normalize(text()), 'iau(s|z)?$')]"/>
            </xsl:call-template>
            <xsl:text>§12.1 illus > aus&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(fn:normalize(text()), 'au(s|z)$') and matches(@lemma, 'eil\d?$')]"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§12.3 Etude de la graphie du pronom P3 - pluriel régime&#10;</xsl:text>
            <xsl:call-template name="compteOccCond">
                <xsl:with-param name="condition" select="//w[matches(@pos, 'PROper') and matches(@msd, 'PERS.=3\|NOMB.=p\|GENRE=(m|f)\|CAS=(r|i)') and @lemma = 'il']"/>
                <xsl:with-param name="lemma" select="'il'"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <!-- $14   -->       
            <xsl:text>§14 melius &lt; mius</xsl:text>
            <xsl:call-template name="compteOcc">
                <xsl:with-param name="lemma" select="'mieus'"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <!-- $14 -->     
            <xsl:text>Confusion graphique an/en $15</xsl:text><xsl:text>&#10;</xsl:text>
            <xsl:text>mots en en</xsl:text><xsl:text>&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(fn:normalize(text()), 'a(n|m)[zrtpqsdfghjkmwxcvbnç]') and not(matches(@pos, 'OUT|VER')) and matches(fn:normalize(@lemma), 'e(n|m)[zrtpqsdfghjkmwxcvbnç]')]"/>
            </xsl:call-template>
            <xsl:text>mots en an</xsl:text><xsl:text>&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(fn:normalize(text()), 'e(n|m)[zrtpqsdfghjkmwxcvbnç]') and not(matches(@pos, 'OUT|VER')) and matches(fn:normalize(@lemma), 'a(n|m)[zrtpqsdfghjkmwxcvbnç]')]"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <!-- Evolution de e fermé -->
            <xsl:text>&#10;</xsl:text>
            <!-- $17 -->
            <xsl:text>Forme alternantive des infinitifs : seîr, caïr/keïr et veïr $17</xsl:text><xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@lemma, 'vëoir|sëoir|chëoir') and matches(@pos, 'VERinf')]"
                group-by="@lemma">
                <xsl:for-each-group select="current-group()" group-by=".">
                    <xsl:value-of select="."/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)&#10;</xsl:text>
                </xsl:for-each-group> 
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <!-- $18 -->
            <xsl:text>-gula > pic. iule $18</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(fn:normalize(text()), 'iule(s|z)?$')]"/>
            </xsl:call-template>
            <!-- $19 -->
            <xsl:text>Confusion graphique ain pour ein $19</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(fn:normalize(text()), 'ain') and matches(fn:normalize(@lemma), 'ein')]"/>
            </xsl:call-template> 
            <!-- Voyelle I -->      
            <!-- $20, $21 -->
            <xsl:text>pic. ius, ieus  $20,$21,$25</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[ends-with(text(), 'ius')]"/>
            </xsl:call-template>
        </xsl:result-document>
        <xsl:result-document href="../../resultats/Vocalisme23-37.tsv">
            <!-- Voyelle O -->
            <!-- $23 -->
            <xsl:text>o+l + consonne > pic.au $23</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(fn:normalize(text()),'au[zrtpqsdfghjklmwxcvbnç]') and matches(fn:normalize(@lemma), 'o(l|u)') and not(matches(fn:normalize(@lemma), 'au'))]"></xsl:with-param>
            </xsl:call-template>
            <!-- $24 -->
            <xsl:text>oi, ui $24&#10;</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(fn:normalize(text()),'ui') and matches(fn:normalize(@lemma), 'oi') and not(matches(@pos, 'VER|OUT'))]"></xsl:with-param>
            </xsl:call-template>
            <!-- $27 -->
            <xsl:text>O fermé sous l’influence de yod > oi, o pic. $27</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(fn:normalize(@lemma), 'oi')  and not(matches(fn:normalize(text()), 'oi')) and not(matches(@pos, 'VER|OUT'))]"></xsl:with-param>
            </xsl:call-template>
            <!-- $28 -->
            <xsl:text>Alternance graphique o/ou + nasale $28</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(fn:normalize(@lemma), 'o[n|m]') and matches(fn:normalize(.), 'ou[n|m]')]"></xsl:with-param>
            </xsl:call-template>
            <!-- §30 -->
            <xsl:text>Maintien de e en hiatus §30</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(text(), 'eü') and not(matches(@pos, 'VER|OUT'))]"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            
            <!-- 1. Voyelles protoniques -->
            <!-- §32, 33 -->
            <xsl:text> oi > PIC. i §32,§33</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(fn:normalize(@lemma), '[zrtpqsdfghjklmwxcvbnç](o|a)i[zrtpqsdfghjklmwxcvbnç]') and matches(fn:normalize(text()), '[zrtpqsdfghjklmwxcvbnç]i[zrtpqsdfghjklmwxcvbnç]') and not(matches(@pos, 'VER|OUT'))]"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <!-- §34 -->
            <xsl:text>e protonique + l/n > i, ei §34</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(fn:normalize(@lemma), '(ei)(n)?(gn|ll)') and matches(fn:normalize(text()), '[^e]i(n)?(gn|ll)')]"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <!-- $36 -->
            <xsl:text>o initial + n > a + n $36</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(fn:normalize(@lemma), 'o(n|m)') and matches(fn:normalize(text()), 'a(n|m)') and not(matches(@pos, 'VER|OUT'))]"></xsl:with-param>
            </xsl:call-template>
            <!-- $37 -->
            <xsl:text>Dissimilation de O $37</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(fn:normalize(@lemma), 'corrocier|doloros|escomeniier|glotonerie|onorer|onor')]"/>
            </xsl:call-template>
            <xsl:text>Dissimilation de i $37</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(fn:normalize(@lemma), 'ph(i|e)lippe|porriture|privilege|religïon|signifi|sicile|visiter|iprocrisie|glorefiier|senefiier|crucefier')]"/>
            </xsl:call-template>
            
            <!-- phénomène francien et flammand  -->
            <xsl:text>Ouverture e en a suivi de r à l'initiale</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(fn:normalize(@lemma), '^[zrtpqsdfghjklmwxcvbn]?[hur]?er') and matches(fn:normalize(text()), '^[zrtpqsdfghjklmwxcvbn]?[hur]?ar') ]"/>
            </xsl:call-template>
            
            <xsl:text>fermeture en e de a en a suivi de r à l'initiale</xsl:text>
            <xsl:call-template name="occurrencesPhen">
                <xsl:with-param name="condition" select="//w[matches(fn:normalize(text()), '^[zrtpqsdfghjklmwxcvbn]?[hur]?er') and matches(fn:normalize(@lemma), '^[zrtpqsdfghjklmwxcvbn]?[hur]?ar') ]"/>
            </xsl:call-template>
            
            
        </xsl:result-document>
    </xsl:template>
    <!-- Faire apparaitre toutes les formes graphiques d'un phénomène -->
    <xsl:template name="forms">
        <xsl:param name="nodes"/>
        <xsl:for-each-group select="$nodes" group-by="fn:normalize(.)">
            <xsl:sort select="count(current-group())" order="descending"/>
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
        <xsl:for-each-group select="$condition" group-by="fn:normalize(@lemma)">
            <xsl:sort select="count(current-group())" order="descending"/>
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
    
    <!-- Règle pour repérer les alternances graphiques -->
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
