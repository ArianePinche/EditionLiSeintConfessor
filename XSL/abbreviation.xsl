<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" version="3.0">

    <xsl:strip-space elements="*"/>
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:template match="/">
        <table>
            <xsl:for-each-group select="//tei:choice[descendant::tei:abbr]"
                group-by="tei:abbr/text()">
                <xsl:sort select="tei:abbr/text()"/>
                <tr>
                    <td>
                        <xsl:value-of select="tei:abbr/text()"/>
                    </td>

                    <xsl:for-each-group select="current-group()//tei:expan"
                        group-by="string-join(.//text(), '')">
                        <xsl:sort select="string-join(.//text(), '')"/>
                        <td>
                            <em>
                                <xsl:value-of select="string-join(current-group()[1]//text(), '')"/>
                            </em>
                            <xsl:for-each select="current-group()/ancestor::tei:choice">
                                <xsl:variable name="head" select="./preceding-sibling::text()[1]"/>
                                <xsl:variable name="tail" select="./following-sibling::text()[1]"/>
                                <ex>
                                    <xsl:choose>
                                        <xsl:when
                                            test="substring($head, string-length($head)) != ' ' and substring($tail, 1) != ' '">
                                            <xsl:variable name="word"
                                                select="tokenize($head, ' ')[last()] || string-join(./tei:expan//text(), '') || tokenize($tail, ' ')[1]"/>
                                            <xsl:for-each-group select="current-group()"
                                                group-by="$word">
                                                <xsl:sort select="$word"/>
                                                <xsl:value-of
                                                  select="tokenize($head, ' ')[last()] || string-join(.//text(), '') || tokenize($tail, ' ')[1]"
                                                />
                                            </xsl:for-each-group>
                                        </xsl:when>
                                        <xsl:when
                                            test="substring($head, string-length($head)) != ' '">
                                            <xsl:variable name="word"
                                                select="tokenize($head, ' ')[last()] || string-join(.//tei:expan//text(), '')"/>
                                            <xsl:for-each-group select="current-group()"
                                                group-by="$word">
                                                <xsl:sort select="$word"/>
                                                <xsl:value-of
                                                  select="tokenize($head, ' ')[last()] || string-join(.//text(), '')"
                                                />
                                            </xsl:for-each-group>
                                        </xsl:when>
                                        <xsl:when test="substring($tail, 1) != ' '">
                                            <xsl:variable name="word"
                                                select="string-join(.//tei:expan//text(), '') || tokenize($tail, ' ')[1]"/>
                                            <xsl:for-each-group select="current-group()"
                                                group-by="$word">
                                                <xsl:sort select="$word"/>
                                                <xsl:value-of
                                                  select="string-join(.//text(), '') || tokenize($tail, ' ')[1]"
                                                />
                                            </xsl:for-each-group>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:for-each-group select="current-group()"
                                                group-by="string-join(.//tei:expan//text(), '')">
                                                <xsl:sort
                                                  select="string-join(.//tei:expan//text(), '')"/>
                                                <xsl:value-of select="string-join(.//text(), '')"/>
                                            </xsl:for-each-group>
                                        </xsl:otherwise>

                                    </xsl:choose>
                                </ex>
                            </xsl:for-each>
                        </td>
                    </xsl:for-each-group>
                </tr>

            </xsl:for-each-group>
        </table>

    </xsl:template>
</xsl:stylesheet>
