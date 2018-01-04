<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">

    <!-- enlève les espaces de l'element cité / balise nécessaire pour le traitement LaTeX-->
    <xsl:strip-space elements="*"/>
    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:teiHeader"/>
    <xsl:variable name="title">
        <xsl:copy-of select="//tei:titleStmt/tei:title"/>
    </xsl:variable>

    <xsl:template match="text()"><xsl:value-of select="replace(., '&#160;', ' ')"/></xsl:template>

    <xsl:template match="tei:text">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:div">
        <xsl:text>\paragraph{</xsl:text>
        <xsl:value-of select="./@n"/>
        <xsl:text>}</xsl:text>
        <xsl:if test="tei:head">
            <xsl:apply-templates select="tei:head"/>
        </xsl:if>
        <xsl:apply-templates select="./tei:div"/>
        <xsl:text>

</xsl:text>
    </xsl:template>

    <xsl:template match="tei:div/tei:div">
        <xsl:text>
</xsl:text><xsl:text>    \subparagraph{</xsl:text>
        <xsl:value-of select="./@n"/>
        <xsl:text>}</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:div/tei:div/tei:p">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:note">
        <xsl:text>\footnote{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    <!-- mise en page de l'édition normalisee -->
    <xsl:template match="tei:reg">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    <xsl:template match="tei:expan">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    <xsl:template match="tei:corr">
        <xsl:text>[</xsl:text>
        <xsl:value-of select="normalize-space(.)"/>
        <xsl:text>]</xsl:text>
    </xsl:template>
    <xsl:template match="tei:orig"/>
    <xsl:template match="tei:abbr"/>
    <xsl:template match="tei:pc">
        <xsl:choose>
            <xsl:when test="@type = 'orig'"/>
            <xsl:when test="text()='-'"/>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:lg"> \lg{ <xsl:apply-templates/> }
    </xsl:template>
    <xsl:template match="tei:l">
        <xsl:apply-templates/>\endl
    </xsl:template> 
    <xsl:strip-space elements="tei:pc tei:cb tei:pc"/>
    <xsl:template match="tei:cb">
        <xsl:choose>
            <xsl:when test="preceding-sibling::tei:pc/text()='-'">
                <xsl:text>[fol.</xsl:text>
                <xsl:value-of select="preceding::tei:pb[1]/@n"/>
                <xsl:value-of select="@n"/>
                <xsl:text>]</xsl:text>
            </xsl:when>
            <xsl:otherwise><xsl:text> [fol.</xsl:text>
        <xsl:value-of select="preceding::tei:pb[1]/@n"/>
        <xsl:value-of select="@n"/>
        <xsl:text>] </xsl:text></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:quote[@xml:lang = 'lat']">
        <xsl:text>\it </xsl:text>
        <xsl:apply-templates/>
        <xsl:text>\rm </xsl:text>
    </xsl:template>
    <xsl:template match="tei:seg[@xml:lang = 'lat']">
        <xsl:text>\it </xsl:text>
        <xsl:apply-templates/>
        <xsl:text>\rm </xsl:text>
    </xsl:template>
    <xsl:template match="tei:bibl"/>
    <xsl:template match="tei:seg[@type = 'number']">
        <xsl:text>\sc{</xsl:text>
        <xsl:copy-of select="."/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    <xsl:template match="tei:said">
        <xsl:text>\og </xsl:text>
        <xsl:apply-templates/>
        <xsl:text>\fg </xsl:text>
    </xsl:template>

    <xsl:template match="tei:hi[@rend = 'decorated-initial']">
        <xsl:text>\bf </xsl:text>
        <xsl:apply-templates/>
        <xsl:text>\rm </xsl:text>
    </xsl:template>

    <xsl:template match="tei:hi[@rend = 'italic']">
        <xsl:text>\it{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    


    <xsl:template match="tei:hi[@rend = 'green']">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:hi[@rend = 'exp']">
        <xsl:text></xsl:text>
        <xsl:apply-templates/>
        <xsl:text></xsl:text>
    </xsl:template>
    <xsl:template match="tei:hi[@rend ='rubricated orig']"/>
       
    <xsl:template match="text()">
        <xsl:value-of select="replace(., '\s+', ' ')"/>
    </xsl:template>

    <!-- fin mise en page -->

    <xsl:template match="tei:app">
        <xsl:apply-templates/>
        <xsl:text>}</xsl:text>
    </xsl:template>
    <xsl:template match="tei:rdgGrp">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:lem">
        <xsl:text>
            \edtext{\\</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}{</xsl:text>
    </xsl:template>

    <xsl:template match="tei:rdgGrp[@type = 'orthographic']/tei:rdg">
        <xsl:text> \lemma{</xsl:text>
        <xsl:value-of select="normalize-space(.)"/>
        <xsl:text>}\Afootnote{\textit{</xsl:text>
        <xsl:value-of select="replace(@wit, '#', '')"/>
        <xsl:text>}}</xsl:text>
    </xsl:template>

    <xsl:template match="tei:rdg[@type = 'omission']">
        <xsl:text>
            \lemma{omission</xsl:text>
        <xsl:text>}\Afootnote{\textit{</xsl:text>
        <xsl:value-of select="replace(@wit, '#', '')"/>
        <xsl:text>}}</xsl:text>
    </xsl:template>

    <xsl:template match="tei:rdgGrp[@type = 'translation']/tei:rdg">
        <xsl:text>
            \lemma{</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>}\Bfootnote{\textit{</xsl:text>
        <xsl:value-of select="replace(@wit, '#', '')"/>
        <xsl:text>}}</xsl:text>
    </xsl:template>

    <xsl:template match="tei:rdg[@type = 'translation']">
        <xsl:text>
            \lemma{</xsl:text>
        <xsl:value-of select="normalize-space(.)"/>
        <xsl:text>}\Bfootnote{\textit{</xsl:text>
        <xsl:value-of select="replace(@wit, '#', '')"/>
        <xsl:text>}}</xsl:text>
    </xsl:template>

    

</xsl:stylesheet>
