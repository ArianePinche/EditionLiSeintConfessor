<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:xi="http://www.w3.org/2001/XInclude"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="teiCorpus">
        <xsl:for-each select="TEI[matches(base-uri(.), 'ciham-lemTEI')]">
            <xsl:variable name="witfile">
                <xsl:value-of select="replace(base-uri(.), '.xml', '')"/>
                <!-- récupération du nom du fichier courant -->
            </xsl:variable>
            <xsl:variable name="witfileCorresp">
                <xsl:value-of select="replace(base-uri(.), 'TEI', '')"/>
                <!-- récupération du nom du fichier courant -->
            </xsl:variable>
            <xsl:result-document href="{concat($witfile,'.xml')}">
                <xsl:value-of select="$witfile"/>
                <xsl:value-of select="$witfileCorresp"/>
                <xsl:copy>
                    <teiHeader>
                        <xsl:copy-of select="descendant::fileDesc"/>
 
                        <xsl:copy-of select="ancestor::teiCorpus/TEI[base-uri(.)=$witfileCorresp]/teiHeader/revisionDesc"/>
                        
                    </teiHeader>
                    <xsl:apply-templates select="text"/>
                </xsl:copy>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    <!-- copie les éléments de structuration du texte -->
    <xsl:template match="text|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>   
    <xsl:template match="body|@*">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="div">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="ab">
        <xsl:copy>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
   <!-- Rajouter l'attibut @pos quand il manque -->
    <xsl:template match="w">
        <xsl:variable name="witfileCorresp">
            <xsl:value-of select="replace(ancestor::TEI/base-uri(.), 'TEI', '')"/>
            <!-- récupération du nom du fichier courant -->
        </xsl:variable>
        <xsl:variable name="id" select="@xml:id"></xsl:variable>
        <xsl:choose>
            <xsl:when test="not(@pos)">
                <xsl:choose>
                    <xsl:when test="ancestor::teiCorpus/TEI[base-uri(.)=$witfileCorresp]/descendant::w[@xml:id=$id]/matches(@type,'^POS=[A-Za-z]+\.[A-Za-z]+\|.*')">
                        <xsl:element name="w" >
                            <xsl:copy-of select="@xml:id"/>
                            <xsl:copy-of select="@n"/>
                            <xsl:copy-of select="@lemma"/>
                            <xsl:analyze-string select="ancestor::teiCorpus/TEI[base-uri(.)=$witfileCorresp]/descendant::w[@xml:id=$id]/@type" regex="^POS=([A-Za-z]+\.[A-Za-z]+)\|(.*)">
                                <xsl:matching-substring>
                                    <xsl:attribute name="pos" select="regex-group(1)"/>
                                    <xsl:attribute name="msd" select="regex-group(2)"/>
                                </xsl:matching-substring>
                            </xsl:analyze-string>
                            <xsl:value-of select="."/>
                        </xsl:element>
                    </xsl:when>
                   <xsl:otherwise>
                       <xsl:element name="w" >
                           <xsl:copy-of select="@xml:id"/>
                           <xsl:copy-of select="@n"/>
                           <xsl:copy-of select="@lemma"/>
                           
                           <xsl:attribute name="pos">
                               <xsl:value-of select="ancestor::teiCorpus/TEI[base-uri(.)=$witfileCorresp]/descendant::w[@xml:id=$id]/@type"/>
                           </xsl:attribute>
                           <xsl:value-of select="."/>
                       </xsl:element>
                   </xsl:otherwise>
                </xsl:choose>     
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>   
</xsl:stylesheet>