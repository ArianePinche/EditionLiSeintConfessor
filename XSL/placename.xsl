<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:fn2="http://localhost"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <xsl:function name="fn2:generateXPath" as="xs:string*" >
        <xsl:param name="pNode" as="node()"/>
        
        <xsl:for-each select="$pNode/ancestor::*">    
            <xsl:value-of select="concat('tei:', local-name())" />    
        </xsl:for-each>    
        <xsl:value-of select="concat('tei:', local-name($pNode))" />     
    </xsl:function>    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:template match="/">   
    <TEI xmlns="http://www.tei-c.org/ns/1.0">
        <teiHeader>
            <fileDesc>
                <titleStmt>
                    <title>Title</title>
                </titleStmt>
                <publicationStmt>
                    <p>Publication Information</p>
                </publicationStmt>
                <sourceDesc>
                    <p>Information about the source</p>
                </sourceDesc>
            </fileDesc>
        </teiHeader>
        <text>
            <body>
                <xsl:call-template name="url"/>
            </body>
        </text>
    </TEI>
    </xsl:template>
    <xsl:template match="tei:body" name="url">
        <xsl:for-each select="descendant::tei:div[@type='chapter']">
            <xsl:variable name="nChapter" select="@n"/>
            <xsl:for-each select="descendant::tei:div[@type='section']">
                <xsl:variable name="nSection" select="@n"/>
                <xsl:for-each select="descendant::tei:placeName">
                <xsl:element name="div">
                    <xsl:element name="div">
                        <xsl:attribute name="type">hasBody</xsl:attribute>
                        <xsl:variable select="substring(./@ref, 2)" name="ref"></xsl:variable>
                       
                        <xsl:value-of select="//tei:place/tei:placeName[@xml:id=$ref]/@ref"></xsl:value-of>
                       
                    </xsl:element>
                    <xsl:element name="div">
                        <xsl:attribute name="type">hasTarget</xsl:attribute>
                        <xsl:element name="div">
                            <xsl:attribute name="type">hasSource</xsl:attribute>
                            <xsl:variable select="//tei:body/@n" name="urn"/>
                            <xsl:value-of select="concat($urn,':',$nChapter,'.',$nSection)"/>
                        </xsl:element>
                        <xsl:element name="div">
                            <xsl:attribute name="type">hasSelector</xsl:attribute>
                            <xsl:element name="div">
                                <xsl:attribute name="type">exact</xsl:attribute>
                                <xsl:value-of select="./text() | ./tei:choice/tei:reg/text() | ./tei:choice/tei:expan/text()"/>
                            </xsl:element>
                            <xsl:element name="div">
                                <xsl:attribute name="type">xpath</xsl:attribute>
                                <xsl:value-of select="string-join(fn2:generateXPath(.), '/')"></xsl:value-of>
                            </xsl:element>
                        </xsl:element>
                        
                    </xsl:element>
                </xsl:element>
            </xsl:for-each>
            </xsl:for-each>
            </xsl:for-each>    
    </xsl:template>    
</xsl:stylesheet>