<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="3.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <profileDesc>
            <particDesc>
                <listPerson>
                    <xsl:for-each-group select="//tei:person" group-by="@xml:id">
                        <xsl:sort select="./tei:persName" order="ascending"/>
                        <xsl:copy-of select="."/>
                    </xsl:for-each-group>
                </listPerson>
            </particDesc>
        </profileDesc>
        <settingDesc>
            <listPlace>
        <xsl:for-each-group select="//tei:place" group-by="@xml:id">
            <xsl:sort select="./tei:placeName" order="ascending"/>
            <xsl:copy-of select="."/>
        </xsl:for-each-group>
            </listPlace>
        </settingDesc>
    </xsl:template>

</xsl:stylesheet>
