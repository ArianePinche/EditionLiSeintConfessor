<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:template match="/">
        <table>
            <head>Signes supprimés</head>
            <xsl:for-each-group select="//tei:pc[@type = 'orig']" group-by="@ana">
                <xsl:sort select="@ana"/>
                <tr>
                    <td>
                        <xsl:value-of select="@ana"/>
                    </td>
                    <xsl:for-each-group select="current-group()" group-by="./text()">
                        <xsl:sort select="./text()"/>
                        <xsl:variable name="count" select="count(current-group())"/>
                        <td>
                            <xsl:value-of select="./text()"/>
                        </td>
                        <td>
                            <xsl:value-of select="$count"/>
                        </td>
                    </xsl:for-each-group>

                </tr>
            </xsl:for-each-group>
        </table>
        <table>
            <head>Signes modfifiés</head>
            <xsl:for-each-group select="//tei:choice[@ana]" group-by="@ana">
                <xsl:sort select="@ana"/>
                <tr>
                    <td>
                        <xsl:value-of select="@ana"/>
                    </td>
                    <xsl:for-each-group select="current-group()" group-by="tei:orig/text()">
                        <xsl:sort select="tei:orig/text()"/>
                        <xsl:variable name="count" select="count(current-group())"/>
                        <td>
                            <xsl:value-of select="tei:orig/text()"/>
                        </td>
                        <td>
                            <xsl:value-of select="tei:reg/text()"/>
                        </td>
                        <td>
                            <xsl:value-of select="$count"/>
                        </td>
                    </xsl:for-each-group>
                </tr>
            </xsl:for-each-group>
        </table>
        <table>
            <head>Signes ajoutés</head>
            <xsl:for-each-group select="//tei:pc[@ana and @type = 'reg']" group-by="@ana">
                <xsl:sort select="@ana"/>
                <tr>
                    <td>
                        <xsl:value-of select="@ana"/>
                    </td>
                    <xsl:for-each-group select="current-group()" group-by="./text()">
                        <xsl:sort select="./text()"/>
                        <xsl:variable name="count" select="count(current-group())"/>
                        <td>
                            <xsl:value-of select="./text()"/>
                        </td>
                        <td>
                            <xsl:value-of select="$count"/>
                        </td>
                    </xsl:for-each-group>

                </tr>
            </xsl:for-each-group>
        </table>
         
        <table>
            <head>Nombres de signes maintenus</head>
            <xsl:for-each select="//tei:p/text()">
              <xsl:if test="//tei:p/text()=''">
              <td>
                  <xsl:value-of select="."/>
              </td>
              </xsl:if>
      <xsl:value-of select="count(current-group())"/>
     </xsl:for-each>
            <xsl:for-each select="tei:p/text()">
                <xsl:if test=". = ':'"/>
                <tr>
                    <td> : </td>
                    <xsl:variable name="count" select="count(current-group())"/>
                    <td>
                        <xsl:value-of select="$count"/>
                    </td>
                </tr>
            </xsl:for-each>

        </table>
    </xsl:template>

</xsl:stylesheet>
