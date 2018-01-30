<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="3.0">
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:template match="/tei:TEI">
        <table><head>Ajout d'un accent tonique sur le e finaux toniques</head>
            <xsl:for-each select="//text()='é'">
                <tr>
                    <td>
                        <xsl:for-each-group select="parent::tei:w" group-by="./parent::tei:w">
                        <xsl:variable name="count" select="count(current-group())"/>
                            <xsl:value-of select="parent::tei:w" />
                        
                    </xsl:for-each-group>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>