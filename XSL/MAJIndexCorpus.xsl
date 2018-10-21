<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:my="LOCALHOST" exclude-result-prefixes="xs tei" version="2.0">
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:function name="my:no-accent">
        <xsl:param name="string"/>
        <xsl:value-of select="translate($string, 'áàâäéèêëíìîïóòôöúùûü', 'aaaaeeeeiiiioooouuuu')"/>
    </xsl:function>
    
    
    
    <xsl:template match="tei:TEI">
        <xsl:variable name="nomFichier">
            <xsl:value-of
                select="concat(replace(tokenize(base-uri(.), '/')[last()], '.xml', ''), 'test', '.xml')"
            />
        </xsl:variable>
        <xsl:result-document href="../XML/Vies/test/{$nomFichier}">
            <TEI xmlns="http://www.tei-c.org/ns/1.0">
                <xsl:apply-templates />
            </TEI>
        </xsl:result-document>
    </xsl:template>
   
    <xsl:template match="tei:listPerson">
        <xsl:apply-templates select="attribute()"/>
        <xsl:for-each select="tei:person">
            <xsl:sort order="ascending" select="my:no-accent(tei:persName)"/>
            <xsl:variable name="idPerson">
                <xsl:value-of select="@xml:id"/>
            </xsl:variable>
            <xsl:choose>
                <xsl:when
                    test="./@xml:id = ancestor::tei:TEI/tei:text/descendant::tei:persName/replace(@ref, '#', '')">
                    <xsl:copy-of
                        select="ancestor::tei:teiCorpus/tei:teiHeader//descendant::tei:person[@xml:id = $idPerson]"
                    />
                </xsl:when>
                <xsl:otherwise/>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
  
    <xsl:template match="tei:listPlace">
        <xsl:apply-templates select="attribute()"/>
        <xsl:for-each select="tei:place">
            <xsl:sort order="ascending" select="my:no-accent(tei:placeName)"/>
            <xsl:variable name="idPlace">
                <xsl:value-of select="@xml:id"/>
            </xsl:variable>
            <xsl:choose>
                <xsl:when
                    test="./@xml:id = ancestor::tei:TEI/tei:text/descendant::tei:placeName/replace(@ref, '#', '')">
                    <xsl:copy-of
                        select="ancestor::tei:teiCorpus/tei:teiHeader//descendant::tei:place[@xml:id = $idPlace]"
                    />
                </xsl:when>
                <xsl:otherwise/>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
   
    
    <xsl:template match="attribute()|node()|comment()">
        <xsl:copy>
            <xsl:apply-templates select="attribute()|node()|comment()"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>
