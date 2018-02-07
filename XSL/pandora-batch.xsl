<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" xmlns:saxon="http://saxon.sf.net/" version="2.0"
    xmlns:my="my:my" xmlns:exsl="http://exslt.org/common">

    <xsl:output omit-xml-declaration="yes" indent="yes"/>

    <xsl:template match="TEI">
        <xsl:variable name="step1"
            select="saxon:transform(saxon:compile-stylesheet(doc('pandora.xsl')), doc(current()))"/>
        <xsl:value-of select="$step1"/>
    </xsl:template>

</xsl:stylesheet>
