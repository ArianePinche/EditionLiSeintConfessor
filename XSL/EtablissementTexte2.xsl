<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <xsl:output method="xml" encoding="UTF-8"/>
    
    <xsl:template match="p/text() | l/text() | said/text() | head/text()">
        <xsl:choose>
            <xsl:when test="ancestor-or-self::teiHeader"><xsl:copy /></xsl:when>
            <xsl:otherwise>
                <!-- boucle pour sélectionner dans l'élémént p tous les espaces comme bornes des éléments à tokéniser -->
                <xsl:for-each select="tokenize(replace(., '([\.:,])+', ' $1 '), '[^\d\w\.:,!\?]+')">
                    <xsl:if test=".">
                        <xsl:choose>
                            <xsl:when test="matches(., '[\w\d]+')">
                                <xsl:element name="w"><!-- les éléments tokéniser sont englober dans la balise w -->
                                    <xsl:value-of select="."/><!-- la chaine de caractères est insérée dans la balise comme valeur de l'élément -->
                                </xsl:element><xsl:text> </xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:element name="pc"><xsl:value-of select="." /></xsl:element>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="TEI">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

    
</xsl:stylesheet>