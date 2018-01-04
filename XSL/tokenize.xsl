<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <xsl:output method="xml" encoding="UTF-8"/>
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>    
    
    <xsl:template match="p">
        <xsl:copy>
            <xsl:for-each select="tokenize(replace(string-join(descendant-or-self::text(), ''), '([\.:,])+', ' $1 '), '[^\d\w\.:,]+')"><!-- boucle pour sélectionner dans l'élémént p tous les espaces comme bornes des éléments à tokéniser -->
                <xsl:if test=".">
                    <xsl:element name="w"><!-- les éléments tokéniser sont englober dans la balise w -->
                        <xsl:value-of select="."/><!-- la chaine de caractères est insérée dans la balise comme valeur de l'élément -->
                    </xsl:element>
                </xsl:if>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>