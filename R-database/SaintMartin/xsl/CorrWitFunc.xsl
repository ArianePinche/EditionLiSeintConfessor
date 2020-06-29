<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" version="2.0">
    <xsl:output  method="xml" indent="yes" standalone="no" />
    <xsl:strip-space elements="*"/>
    
    
    <xsl:function name="tei:strip-wit-one">
        <xsl:param name="child-wit" required="yes" as="item()" />
        <xsl:param name="parent-wit" required="yes" as="item()*" />
         <xsl:for-each select="tokenize($child-wit, '\s+')">
             <xsl:if test="contains($parent-wit, current())">
                 <xsl:value-of select="string(current())"/>
             </xsl:if>
         </xsl:for-each>
    </xsl:function>
    <xsl:function name="tei:strip-wit">
        <xsl:param name="child-wit" required="yes" as="item()" />
        <xsl:param name="parent-wit" required="yes" as="item()*" />
        <xsl:variable name="count-parent" select="count($parent-wit)"/>
        <xsl:choose>
            <xsl:when test="$count-parent = 1">
                <!-- Si on a un seul parent avec un @wit, on nettoie le wit de l'enfant en fonction du parent -->
                <xsl:value-of select=" string-join(tei:strip-wit-one($child-wit, $parent-wit), ' ')" />
            </xsl:when>
            <xsl:when test="$count-parent = 0">
                
                <xsl:value-of select="string($child-wit)"/>
            </xsl:when>
            <xsl:otherwise>
                <!-- si on a plus d'un apparat imbriqué, 
                    on nettoie les wit en cascade en partant du dernier élément en fonction de ce que peut contenir son parent
               -->
                <xsl:value-of 
                    select="tei:strip-wit($child-wit, 
                                tei:strip-wit(
                                    string($parent-wit[$count-parent]),
                                    subsequence($parent-wit, 1, $count-parent - 1)
                                )
                            )"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xsl:template match="/">
        <xsl:result-document href="SM_appPosCorr.xml">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates/>
        </TEI>
        </xsl:result-document>
    </xsl:template>   

    <xsl:template match="tei:teiHeader" >
        <xsl:element name="teiHeader">  
            <xsl:element name="fileDesc">
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>       
    </xsl:template>
    <xsl:template match="tei:titleStmt">
        <xsl:copy-of select="."/>
    </xsl:template>
    <xsl:template match="tei:publicationStmt">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="tei:sourceDesc">
       <xsl:copy-of select="."/>
    </xsl:template>
    <xsl:template match="tei:profileDesc"/>
    <xsl:template match="tei:encodingDesc"/>
    
    <xsl:template match="tei:app">
        <xsl:element name="app">
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
     <xsl:template match="tei:lem">
         <xsl:element name="lem">
             <xsl:attribute select="tei:strip-wit(@wit, ancestor::tei:lem/@wit)" name="wit" />
            <xsl:value-of select="text()" />
            <xsl:apply-templates select="tei:app"/>
         </xsl:element>
     </xsl:template>    
        
     <xsl:template match="tei:rdg">
         <xsl:copy-of select="."/>
     </xsl:template>
     <xsl:template match="tei:text">
            <xsl:element name="text" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:element name="body" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:element name="p" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:apply-templates />
                    </xsl:element>
                </xsl:element>
            </xsl:element>
     </xsl:template>
    
    
</xsl:stylesheet>
