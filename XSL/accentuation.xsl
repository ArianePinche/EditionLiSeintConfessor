<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:template match="/tei:TEI">
        <table>
            <xsl:for-each select="//text() = 'é'">
                <tr>
                    <xsl:for-each-group select="current-group()" group-by="./parent::tei:w/text()">
                        <xsl:sort select="./parent::tei:w/text()"/>
                        <xsl:for-each select="current-group()">
                            <td>
                                <em>
                                    <xsl:value-of select="./parent::tei:w/text()"/>
                                </em>
                            </td>
                            <td>
                                <xsl:value-of select="count(.)"/>
                            </td>
                        </xsl:for-each>
                    </xsl:for-each-group>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>
