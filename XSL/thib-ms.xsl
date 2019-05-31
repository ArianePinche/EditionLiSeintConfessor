<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" version="3.0" xmlns:my="LOCALHOST">
    <xsl:strip-space elements="*"/>
    <xsl:function name="my:no-accent">
        <xsl:param name="string"/>
        <xsl:value-of select="translate($string, 'áàâäéèêëíìîïóòôöúùûü', 'aaaaeeeeiiiioooouuuu')"/>
    </xsl:function>
    <xsl:function name="my:regularizeName">
        <xsl:param name="node"/>
        <xsl:variable name="var"
            select="$node/(text() | tei:hi/text() | .//tei:reg/text() | .//tei:expan/text() | .//tei:ex/text() | .//tei:pc[@type = 'reg' and not(text() = '-')])"/>
        <xsl:value-of
            select="
                normalize-space(
                replace(
                replace(
                string-join($var),
                '&#160;',
                ' ')
                , '^\s*[sS][ae]in[tze]{0,2}s?',
                ''
                )
                )"
        />
    </xsl:function>
    <xsl:function name="my:regularizePlace">
        <xsl:param name="node"/>
        <xsl:variable name="var"
            select="$node/(text() | tei:hi/text() | .//tei:reg/text() | .//tei:expan/text() | .//tei:ex/text() | .//tei:pc[@type = 'reg' and not(text() = '-')])"/>
        <xsl:value-of
            select="
                normalize-space(
                replace(
                string-join($var),
                '&#160;',
                ' '
                )
                )"
        />
    </xsl:function>

    <xsl:template match="tei:TEI">
        <xsl:variable name="witfile">
            <xsl:value-of select="tokenize(replace(base-uri(.), '.xml', ''), '/')[last()]"/>
            <!-- récupération du nom du fichier courant -->
        </xsl:variable>
        <xsl:result-document
            href="/Users/arianepinche/Dropbox/these/corpus/txt/{concat($witfile,'.txt')}"
            method="text">

            <xsl:variable name="adresse">
                <xsl:value-of select="tokenize(tei:body/@n, ':')[last()]"/>
                <!-- récupération dans l'uri uniquement du nom du document -->
            </xsl:variable>


            <xsl:apply-templates select=".//tei:body"/>
        </xsl:result-document>
    </xsl:template>







    <xsl:template match="tei:body/tei:div">
        <xsl:apply-templates select="./tei:div"/>
    </xsl:template>

    <xsl:template match="tei:l">
        <xsl:apply-templates/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <xsl:template match="tei:lg">

        <xsl:apply-templates/>

    </xsl:template>

    <xsl:template match="tei:p">
        <xsl:apply-templates/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

    <!-- saut de page et de colonne + espace -->

    <xsl:template match="tei:lb"/>


    <xsl:template match="tei:cb"/>


    <xsl:template match="tei:pb"/>

    <!-- fin saut de page et de colonne -->



    <!-- éléments à affichier pour la visualisation facsimilaire -->
    <xsl:template match="tei:orig">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:sic">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:abbr">
        <xsl:choose>
            <xsl:when test="./text() = '&#8266;'">
                <xsl:apply-templates/>
                <xsl:text>&#160;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:pc[@type = 'orig']">
        <xsl:apply-templates/><xsl:text>&#160;</xsl:text>
    </xsl:template>

    <xsl:template match="tei:hi[@rend]">
        <xsl:apply-templates/>
    </xsl:template>


    <!-- finir en créant un variable i + 1 -->
    <!-- rajouter l'xml id à l'apparat pour le pop-up -->
    <!-- fin éléments à afficher pour la visualisation facsimilaire -->


    <xsl:template match="tei:app">
        <xsl:apply-templates select="./tei:lem"/>
    </xsl:template>

    <xsl:template match="tei:del[@type = 'exponctué']">

        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:del[@type = 'raturé']">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- éléments à afficher pour la visualisation normalisée -->
    <xsl:template match="tei:reg">
        <xsl:choose>
            <xsl:when test="./text() = '&#160;'">
                <xsl:text>&#160;</xsl:text>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:corr">
        <xsl:choose>
            <xsl:when test="@type = 'add'">

                <xsl:text>[</xsl:text>
                <xsl:apply-templates/>
                <xsl:text>]</xsl:text>
            </xsl:when>
            <xsl:when test="@type = 'del'">
                <xsl:text>(</xsl:text>
                <xsl:apply-templates/>
                <xsl:text>)</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:expan"/>


    <xsl:template match="tei:pc[@type = 'reg']">
        <xsl:choose>
            <xsl:when test="./text() = '&#160;'">
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:said">
        <xsl:text>" </xsl:text>
        <xsl:apply-templates/>
        <xsl:text> "</xsl:text>
    </xsl:template>
    <xsl:template match="tei:quote[@xml:lang = 'grec'] | tei:quote[@xml:lang = 'lat']">
        <xsl:text>" </xsl:text>
        <xsl:apply-templates/>
        <xsl:text> "</xsl:text>
    </xsl:template>
    <xsl:template match="tei:seg[@xml:lang = 'grec'] | tei:seg[@xml:lang = 'lat']">
        <xsl:text>" </xsl:text>
        <xsl:apply-templates/>
        <xsl:text> "</xsl:text>
    </xsl:template>

    <xsl:template match="tei:seg[@type = 'number']">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:note"/>

</xsl:stylesheet>
