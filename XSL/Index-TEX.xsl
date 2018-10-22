<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="3.0" xmlns:my="LOCALHOST">
    <!-- error de reconnaissance caractères UTF 8 dans latex -->
    <xsl:function name="my:no-accent">
        <xsl:param name="string"/>
        <xsl:value-of select="translate($string, 'áàâäéèêëíìîïóòôöúùûü', 'aaaaeeeeiiiioooouuuu')"/>
    </xsl:function>
    <xsl:function name="my:regularizeName">
        <xsl:param name="node"/>
        <xsl:variable name="var"
            select="$node/(text() | tei:hi/text() | .//tei:reg/text() | .//tei:expan/text() | .//tei:ex/text() | .//tei:pc[@type = 'reg' and not(text() = '-')])"/>
        <xsl:value-of select="
            normalize-space(
                replace(
                    replace(
                        string-join($var),
                        '&#160;',
                        ' ')
                    , '^\s*[sS][ae]in[tze]{0,2}s?',
                    ''
                )
            )"/>
    </xsl:function>
    <xsl:function name="my:regularizePlace">
        <xsl:param name="node"/>
        <xsl:variable name="var"
            select="$node/(text() | tei:hi/text() | .//tei:reg/text() | .//tei:expan/text() | .//tei:ex/text() | .//tei:pc[@type = 'reg' and not(text() = '-')])"/>
        <xsl:value-of select="
            normalize-space(
            replace(
            string-join($var),
            '&#160;',
            ' '
            )
            )"/>
    </xsl:function>
    <!-- enlève les espaces de l'element cité / balise nécessaire pour le traitement LaTeX-->
    <xsl:strip-space elements="*"/>
    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:template
        match="tei:teiCorpus/tei:teiHeader[1]">^
        <xsl:variable name="witfile">
            <xsl:value-of select="tokenize(replace(base-uri(.), '.xml', ''), '/')[last()]"/>
            <!-- récupération du nom du fichier courant -->
        </xsl:variable>
        <xsl:result-document
            href="/Users/arianepinche//Dropbox/these/corpus/latex/Index.tex">
            ﻿\documentclass[12pt,a4paper]{book}
            \usepackage[utf8x]{inputenc}
            \usepackage[T1]{fontenc}
            \usepackage{lmodern}
            \usepackage{graphicx}
            \usepackage[french]{babel}
            \usepackage{times}
            \usepackage{lettrine}
            \usepackage{setspace}
            \usepackage{lineno}
            \usepackage{ulem}
            \usepackage{color}
            \usepackage{sectsty}
            \usepackage{fancyhdr}
            \usepackage{reledmac}
            \paragraphfont{\mdseries\itshape}
            
            \begin{document}
            \pagestyle{fancy}
            \fancyhead[LE,RO]{ \thepage}
            \fancyhead[RE, LO]{\textsc{Index}}
            \renewcommand{\headrule}{} \fancyfoot[C]{}
            ﻿ \setlength{\parindent}{-1em}
            
            ﻿\chapter*{Index}           
            ﻿ ﻿\paragraph*{}
            Cet index a pour objectif de permettre l'identification des noms propres et des toponymes qui apparaissent dans le recueil des \textit{Seint Confessor} avec toutes leurs occurrences. Ainsi pour un nom donné on trouvera successivement :
            \begin{list}{-}{}
            \item En petites capitales, la forme qui sert de base au ﻿regroupement﻿\footnote{Dans la mesure du possible, forme la plus fréquente parmi les occurrences du corpus}. Dans les cas où la vedette fait mention d'un personnage historique, ses dates, dans la mesure du possible, sont indiquées à la suite entre parenthèses.   
            \subitem Exemple : \textsc{Martin} (316-397);
            \item  La graphie de l'occurrence, dans les cas où cette dernière est différente de la vedette, suivie de la référence à la Vie du saint et du ou des chapitres où apparaissent les occurrences. La Vie est signalée par le prénom du saint entre crochets. Dans le cas particulier des ﻿\textit{Dialogues sur les Vertus de saint Martin}, nous avons simplement mis \og Dialogues \fg{}  entre crochets.
            \subitem Exemple : Martins :  [Martin] 1,  2,  3,
            \item En italique, les notes permettant l'identification du personnage et du lieu. 
            \end{list}
            \begin{center}
            \section*{Index des noms propres}
            \end{center}
            <xsl:call-template name="NomPropre"/>
            \newpage
            \begin{center}
            \section*{Index des toponymes}
            \end{center}
            <xsl:call-template name="NomLieu"/>
            \end{document}    
            
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="tei:ex">
        <xsl:text>\up{</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    <xsl:template match="tei:seg[@type = 'number']">
        <xsl:text>\textsc{</xsl:text>
        <xsl:copy-of select="."/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    
    <xsl:template name="NomPropre">
        <xsl:for-each select="descendant::tei:person">
            <xsl:sort order="ascending" select="my:no-accent(tei:persName)"/>
            <xsl:variable name="id" select="@xml:id" />
            <xsl:variable name="persName" select="tei:persName/text()" />
            
            \textsc{<xsl:value-of select="tei:persName"/>}<xsl:if test="tei:death">
                <xsl:text> (</xsl:text><xsl:choose><xsl:when test="tei:birth"><xsl:apply-templates select="tei:birth"/>
                    <xsl:text>-</xsl:text></xsl:when><xsl:otherwise><xsl:if test="tei:death/@when">†</xsl:if></xsl:otherwise></xsl:choose>
                <xsl:apply-templates select="tei:death"/>
                <xsl:text>)</xsl:text>
            </xsl:if><xsl:text> : </xsl:text>
            <!-- On sélectionne l'ensemble des occurrences par souci de lisibilité et performance -->
            <xsl:variable name="occurrences" select="//tei:body//tei:persName[
                @ref = '#' || $id and 
                not(ancestor::tei:head)]"/>
            <!-- On affiche d'abord, si elle existe, les occurrences dont la graphie est = à celle de la 
                vedette -->
            <xsl:call-template name="GraphiePersNames">
                <xsl:with-param name="persNames" select="$occurrences[my:regularizeName(.) = $persName]" />
                <!-- On ne sélectionne que les occurrences de la vedette -->
                <xsl:with-param name="graphie" select="false()" />
                <!-- On n'affiche pas la graphie elle-même -->
            </xsl:call-template>
       
            <xsl:for-each-group
                select="$occurrences[my:regularizeName(.) != $persName]"
                group-by="my:regularizeName(.)">
                <!-- Ici, on récupère chaque graphie trouvées de la personne concernée quelque soit la vie -->
                <xsl:sort order="ascending" select="current-grouping-key()"/>
                <!-- On trie par l'orthographe de celle-ci. -->
                <xsl:if test="current-grouping-key() != $persName">
                    <xsl:call-template name="GraphiePersNames">
                       <xsl:with-param name="persNames" select="current-group()" />
                       <xsl:with-param name="graphie" select="true()" />
                    </xsl:call-template>
                </xsl:if>
            </xsl:for-each-group>
            \textit{<xsl:apply-templates select="tei:note"/>}\\
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="GraphiePersNames">
        <xsl:param name="graphie"/><!-- Booleen : si vrai, on affiche la graphie -->
        <xsl:param name="persNames"/>
        <xsl:if test="$graphie = true()">
            <!-- On n'affiche pas les occurrences si celle-ci est celle de la vedette -->
            <xsl:text> </xsl:text>
            <xsl:apply-templates mode="regName" select="$persNames[1]"/>
            <xsl:text> : </xsl:text>
        </xsl:if>
        <xsl:for-each-group select="$persNames" group-by="ancestor::tei:body/@n">
            <xsl:call-template name="group" />
        </xsl:for-each-group>
    </xsl:template>
    
    
    <xsl:template name="NomLieu">
        <xsl:for-each select="descendant::tei:place">
            <xsl:sort order="ascending" select="my:no-accent(tei:placeName)"/>
            <xsl:variable name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:variable>
            <xsl:variable name="placeName">
                <xsl:value-of select="tei:placeName"/>
            </xsl:variable>
            
            \textsc{<xsl:value-of select="tei:placeName"/>}<xsl:text> : </xsl:text>
            <xsl:variable name="occurrences" select="//tei:body//tei:placeName[
                @ref = '#' || $id and 
                not(ancestor::tei:head)]"/>
            <!-- On affiche d'abord, si elle existe, les occurrences dont la graphie est = à celle de la 
                vedette -->
            
            <xsl:call-template name="GraphieplaceNames">
                <xsl:with-param name="placesNames" select="$occurrences[my:regularizePlace(.) = $placeName]" />
                <!-- On ne sélectionne que les occurrences de la vedette -->
                <xsl:with-param name="graphie" select="false()" />
                <!-- On n'affiche pas la graphie elle-même -->
            </xsl:call-template>
            
            
            <xsl:for-each-group
                select="$occurrences[my:regularizePlace(.) != $placeName]"
                group-by="my:regularizePlace(.)">
                <!-- Ici, on récupère chaque graphie trouvées de la personne concernée quelque soit la vie -->
                <xsl:sort order="ascending" select="current-grouping-key()"/>
                <!-- On trie par l'orthographe de celle-ci. -->
                <xsl:if test="current-grouping-key() != $placeName">
                    <xsl:call-template name="GraphieplaceNames">
                        <xsl:with-param name="placesNames" select="current-group()" />
                        <xsl:with-param name="graphie" select="true()" />
                    </xsl:call-template>
                </xsl:if>
            </xsl:for-each-group>
            \textit{<xsl:apply-templates select="tei:note"/>}\\
        </xsl:for-each>
    </xsl:template>
    
        <xsl:template name="GraphieplaceNames">
            <xsl:param name="graphie"/><!-- Booleen : si vrai, on affiche la graphie -->
            <xsl:param name="placesNames"/>
            <xsl:if test="$graphie = true()">
                <!-- On n'affiche pas les occurrences si celle-ci est celle de la vedette -->
                <xsl:text> </xsl:text>
                <xsl:apply-templates mode="regPlace" select="$placesNames[1]"/>
                <xsl:text> : </xsl:text>
            </xsl:if>
            <xsl:for-each-group select="$placesNames" group-by="ancestor::tei:body/@n">
                <xsl:call-template name="group" />
            </xsl:for-each-group>
        </xsl:template>
    
        <xsl:template name="group">
           <xsl:for-each-group select="current-group()/ancestor::tei:div[@type = 'chapter']"
                group-by="@n">
                <xsl:text> </xsl:text>
                <xsl:value-of select="@n"/>
                <xsl:choose>    
                    <xsl:when test="position() = last()"><xsl:text>; </xsl:text></xsl:when>
                    <xsl:otherwise>, </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each-group>
        </xsl:template>
           
    <xsl:template match="tei:persName" mode="regName">
        <xsl:value-of
            select="my:regularizeName(.)"/>
    </xsl:template>
    <xsl:template match="tei:placeName" mode="regPlace">
        <xsl:value-of
            select="my:regularizePlace(.)"/>
    </xsl:template>
    <xsl:template name="NomVie">
        <xsl:choose>
            <xsl:when test="ancestor::tei:body/@n = 'urn:cts:froLit:jns915.jns1856.ciham-fro1'">
                <xsl:text>[Martin]</xsl:text>
            </xsl:when>
            <xsl:when test="ancestor::tei:body/@n = 'urn:cts:froLit:jns915.jns1743.ciham-fro1'">
                <xsl:text>[Brice]</xsl:text>
            </xsl:when>
            <xsl:when test="ancestor::tei:body/@n = 'urn:cts:froLit:jns915.jns1742.ciham-fro1'">
                <xsl:text>[Jérôme]</xsl:text>
            </xsl:when>
            <xsl:when test="ancestor::tei:body/@n = 'urn:cts:froLit:jns915.jns1744.ciham-fro1'">
                <xsl:text>[Benoit]</xsl:text>
            </xsl:when>
            <xsl:when test="ancestor::tei:body/@n = 'urn:cts:froLit:jns915.jns1761.ciham-fro1'">
                <xsl:text>[Marcel]</xsl:text>
            </xsl:when>
            <xsl:when test="ancestor::tei:body/@n = 'urn:cts:froLit:jns915.jns1994.ciham-fro1'">
                <xsl:text>[Alexis]</xsl:text>
            </xsl:when>
            <xsl:when test="ancestor::tei:body/@n = 'urn:cts:froLit:jns915.jns2000.ciham-fro1'">
                <xsl:text>[Gilles]</xsl:text>
            </xsl:when>
            <xsl:when test="ancestor::tei:body/@n = 'urn:cts:froLit:jns915.jns2114.ciham-fro1'">
                <xsl:text>[Nicolas]</xsl:text>
            </xsl:when>
            <xsl:when test="ancestor::tei:body/@n = 'urn:cts:froLit:jns915.jns2117.ciham-fro1'">
                <xsl:text>[Dialogues]</xsl:text>
            </xsl:when>
        </xsl:choose> 
    </xsl:template>
    
    
    
</xsl:stylesheet>
