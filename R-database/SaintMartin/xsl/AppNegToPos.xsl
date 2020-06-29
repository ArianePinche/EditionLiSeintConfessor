<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" version="2.0">
    <xsl:output  method="xml" indent="yes" standalone="no" />
    <xsl:strip-space elements="*"/>
    <!-- Récupération de la liste des témoins -->
    <xsl:variable name="listWit">
        <xsl:value-of select="concat(
            '#',
            string-join(tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listWit/tei:witness/@xml:id, ' #'))
            "/>
    </xsl:variable>
    
    <xsl:template match="/">
        <xsl:result-document href="SM_appPos.xml">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:apply-templates/>
        </TEI>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader" >
        <xsl:element name="teiHeader" namespace="http://www.tei-c.org/ns/1.0">
            
            <xsl:element name="fileDesc" namespace="http://www.tei-c.org/ns/1.0">
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
    <!--
    <xsl:function name="tei:sort">
        <xsl:param name="values" />
        <xsl:perform-sort select="$values">
            <xsl:sort select="./text()" />
        </xsl:perform-sort>
    </xsl:function>
    -->
    <xsl:template match="tei:app">
        <xsl:if test="tei:rdg[not(@type)] | tei:rdg[@type='ajout'] | tei:rdg[@type='red.']">
            <xsl:element name="app" namespace="http://www.tei-c.org/ns/1.0">
                <xsl:variable name="current-app" select="string-join(./(tei:rdg[not(@type)] | tei:rdg[@type='ajout'] | tei:rdg[@type='red.'])/@wit, ' ')"/>
               <!--
                <xsl:if test="tei:sort(tei:rdg/@type)">
                    <xsl:attribute name="type" select="tei:sort(./tei:rdg/(@cause | @type))" />
                </xsl:if>
                --> <!-- trier les types app regrouper par nom / + faux un app ne peut avoir qu'un type -->
                <xsl:element name="lem" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:attribute name="wit">
                        <xsl:for-each select="tokenize($listWit, '\s')">
                            <!-- <xsl:message select="concat($current-app, '____', current())"></xsl:message> -->
                            
                            <!-- comparaison entre la liste des témoins des rdg et la liste complète -->
                            <xsl:if test="not(contains($current-app, current()))">
                                <!-- ajout dans @wit de lem des témoins non-présents dans les rdg -->
                                <xsl:value-of select="concat(current(), ' ')"/>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:attribute>
                    <!-- nettoyage rapide du texte du lemme -->
                    <xsl:value-of select="tei:lem/text()
                        | .//tei:lem/text()
                        | .//tei:lem/tei:hi[not(@rend='rubricated orig')]/text()
                        | .//tei:lem/tei:hi[not(@rend='rubricated orig')]/tei:choice/tei:reg/text()
                        | .//tei:lem/tei:hi[not(@rend='rubricated orig')]/tei:choice/tei:expan/text()
                        | .//tei:lem/tei:hi[not(@rend='rubricated orig')]/tei:choice/tei:expan/tei:ex/text()
                        | .//tei:lem/tei:hi[not(@rend='rubricated orig')]/tei:placeName/text()
                        | .//tei:lem/tei:hi[not(@rend='rubricated orig')]/tei:placeName/tei:choice/tei:reg/text()
                        | .//tei:lem/tei:hi[not(@rend='rubricated orig')]/tei:placeName/tei:choice/tei:expan/text()
                        | .//tei:lem/tei:hi[not(@rend='rubricated orig')]/tei:placeName/tei:choice/tei:expan/tei:ex/text()
                        | .//tei:lem/tei:hi[not(@rend='rubricated orig')]/tei:persName/text()
                        | .//tei:lem/tei:hi[not(@rend='rubricated orig')]/tei:persName/tei:choice/tei:reg/text()
                        | .//tei:lem/tei:hi[not(@rend='rubricated orig')]/tei:persName/tei:choice/tei:expan/text()
                        | .//tei:lem/tei:hi[not(@rend='rubricated orig')]/tei:persName/tei:choice/tei:expan/tei:ex/text()
                        | .//tei:lem/tei:choice/tei:reg/text()
                        | .//tei:lem/tei:choice/tei:expan/text()
                        | .//tei:lem/tei:choice/tei:expan/tei:ex/text()
                        | .//tei:lem/tei:persName/text()
                        | .//tei:lem/tei:persName/tei:choice/tei:reg/text()
                        | .//tei:lem/tei:persName/tei:choice/tei:expan/text()
                        | .//tei:lem/tei:persName/tei:choice/tei:expan/tei:ex/text()
                        | .//tei:lem/tei:persName/tei:hi[not(@rend='rubricated orig')]/text()
                        | .//tei:lem/tei:placeName/text()
                        | .//tei:lem/tei:placeName/tei:choice/tei:reg/text()
                        | .//tei:lem/tei:placeName/tei:choice/tei:expan/text()
                        | .//tei:lem/tei:placeName/tei:choice/tei:expan/tei:ex/text()
                        | .//tei:lem/tei:pc[not(@type='orig')]/text()
                        | .//tei:lem/tei:corr[@type='del']/text()
                        | .//tei:lem/tei:corr[@type='add']/text()
                        | .//tei:lem/tei:seg/text()"/>
                    <xsl:apply-templates select="tei:lem" />
                </xsl:element>
                <xsl:apply-templates select="tei:rdg" />
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="tei:lem">
        <!-- gestion des apparats imbriqués -->
        <xsl:apply-templates select="tei:app"/>
    </xsl:template>
    
    
    
    <xsl:template match="tei:rdg">
        
        <xsl:choose>
            <xsl:when test="not(@type)">
                <xsl:copy-of select="." copy-namespaces="no"/>
            </xsl:when>
            <xsl:when test="@type='ajout'">
                <xsl:copy-of select="." copy-namespaces="no"/>
            </xsl:when>
            <xsl:when test="@type='red.'">
                <xsl:copy-of select="." copy-namespaces="no"/>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
        
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
    
    <xsl:template match="node()[ancestor::tei:text and local-name(.)  != 'lem' and local-name(.)  != 'app' and local-name(.)  != 'rdg' ]">
        <xsl:apply-templates />
    </xsl:template>
    
</xsl:stylesheet>
