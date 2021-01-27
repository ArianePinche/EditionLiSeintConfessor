<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:my="LOCALHOST" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output encoding="UTF-8" method="text"/>
    <xsl:template match="TEI">
       <xsl:result-document href="/Users/arianepinche//Dropbox/these/corpus/latex/Vies/glossaire.tex"> 
            ﻿ \setlength{\parindent}{-1em}
        <xsl:apply-templates select=".//body"/>
            </xsl:result-document> 
    </xsl:template>
    <xsl:function name="my:order">
        <xsl:param name="string"/>
        <xsl:choose>
            <xsl:when test="contains($string, 'jns915.jns1856')">
                <xsl:text>1</xsl:text>
            </xsl:when>
            <xsl:when test="contains($string, 'jns915.jns1743')">
                <xsl:text>3</xsl:text>
            </xsl:when>
            <xsl:when test="contains($string, 'jns915.jns1742')">
                <xsl:text>8</xsl:text>
            </xsl:when>
            <xsl:when test="contains($string, 'jns915.jns1744')">
                <xsl:text>7</xsl:text>
            </xsl:when>
            <xsl:when test="contains($string, 'jns915.jns1761')">
                <xsl:text>5</xsl:text>
            </xsl:when>
            <xsl:when test="contains($string, 'jns915.jns1994')">
                <xsl:text>9</xsl:text>
            </xsl:when>
            <xsl:when test="contains($string, 'jns915.jns2000')">
                <xsl:text>4</xsl:text>
            </xsl:when>
            <xsl:when test="contains($string, 'jns915.jns2114')">
                <xsl:text>6</xsl:text>
            </xsl:when>
            <xsl:when test="contains($string, 'jns915.jns2117')">
                <xsl:text>2</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:function>
    <xsl:function name="my:title">
        <xsl:param name="string"/>
        <xsl:choose>
            <xsl:when test="contains($string, 'jns915.jns1856')">
                <xsl:text>Martin</xsl:text>
            </xsl:when>
            <xsl:when test="contains($string, 'jns915.jns1743')">
                <xsl:text>Brice</xsl:text>
            </xsl:when>
            <xsl:when test="contains($string, 'jns915.jns1742')">
                <xsl:text>Jérôme</xsl:text>
            </xsl:when>
            <xsl:when test="contains($string, 'jns915.jns1744')">
                <xsl:text>Benoit</xsl:text>
            </xsl:when>
            <xsl:when test="contains($string, 'jns915.jns1761')">
                <xsl:text>Marcel</xsl:text>
            </xsl:when>
            <xsl:when test="contains($string, 'jns915.jns1994')">
                <xsl:text>Alexis</xsl:text>
            </xsl:when>
            <xsl:when test="contains($string, 'jns915.jns2000')">
                <xsl:text>Gilles</xsl:text>
            </xsl:when>
            <xsl:when test="contains($string, 'jns915.jns2114')">
                <xsl:text>Nicolas</xsl:text>
            </xsl:when>
            <xsl:when test="contains($string, 'jns915.jns2117')">
                <xsl:text>Dialogues</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:function>
    <xsl:template match="entry">
        
        <xsl:variable name="nature">
            <xsl:choose>
                <xsl:when test=".//gram[@type = 'pos'] = 'VER'">
                    <xsl:value-of
                        select="concat(translate(.//gram[@type = 'pos'], 'VER', 'v.~'), .//gram[@type = 'constr.'])"
                    />
                </xsl:when>
                <xsl:when test=".//gram[@type = 'pos'] = 'NOMcom'">
                    <xsl:value-of
                        select="concat(translate(.//gram[@type = 'pos'], 'NOMcom', 's.~'), ./sense[1]/cit[@type = 'example'][1]//gram[@type = 'GENRE'], '.')"
                    />
                </xsl:when>
                <xsl:when test=".//gram[@type = 'pos'] = 'ADJqua'">
                    <xsl:value-of select="translate(.//gram[@type = 'pos'], 'ADJqua', 'adj.')"/>
                </xsl:when>
                <xsl:when test=".//gram[@type = 'pos'] = 'ADVgen'">
                    <xsl:value-of select="translate(.//gram[@type = 'pos'], 'ADVgen', 'adv.')"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="form[@type = 'lemma']"/>
        <xsl:text>, \textit{</xsl:text>
        <xsl:value-of select="concat($nature, (', '))"/>
        <xsl:text>}</xsl:text>
        <xsl:call-template name="SensAndOccurences"/>
        
        
    </xsl:template>
    <xsl:template name="SensAndOccurences">
        <xsl:for-each select="sense">
            <xsl:text>\textit{</xsl:text>
            <xsl:value-of select=".//orth"/>
            <xsl:text>}</xsl:text>
            <xsl:apply-templates mode="occurrencesIdLemme" select="cit"/>
            <xsl:apply-templates mode="autres" select="cit"/>
            <xsl:choose>
                <xsl:when test="position() = last()">.</xsl:when>
                <xsl:otherwise>, </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    <xsl:template mode="occurrencesIdLemme" match="cit">
        <xsl:for-each-group select=".[@type = 'example']" group-by="quote">
            <xsl:choose><xsl:when test=".[@type = 'example']//gram[@type = 'MODE'] = 'inf'">
                <xsl:if test="not(current-grouping-key() = ancestor::entry/form[@type = 'lemma'])">
                    <xsl:value-of select="quote[@type = 'graphie']"/>
                </xsl:if>
                <xsl:text>, </xsl:text>
                <xsl:call-template name="PagesLines"/>
            </xsl:when>
                <xsl:when test="current-grouping-key() = ancestor::entry/form[@type = 'lemma']">
                    <xsl:text>, </xsl:text>
                    <xsl:call-template name="PagesLines"/>
                    <xsl:choose>
                        <xsl:when test="position() = last()"/>
                        <xsl:otherwise>, </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
            </xsl:choose>
            
        </xsl:for-each-group>
        
    </xsl:template>

    <xsl:template mode="autres" match="cit">
        <xsl:for-each-group select=".[@type = 'example']" group-by="quote">
            <xsl:if test="not(.[@type = 'example']//gram[@type = 'MODE'] = 'inf')">
                <xsl:if test="not(current-grouping-key() = ancestor::entry/form[@type = 'lemma'])">
                    <xsl:text>, </xsl:text>
                    <xsl:choose>
                        <xsl:when test="ancestor::entry//gram[@type = 'pos'] = 'VER'">
                            <xsl:variable name="mode">
                                <xsl:choose>
                                    <xsl:when test=".//gram[@type = 'MODE'] = 'con'">
                                        <xsl:text>cond.</xsl:text>
                                    </xsl:when>
                                    <xsl:when test=".//gram[@type = 'MODE'] = 'imp'">
                                        <xsl:text>impér.</xsl:text>
                                    </xsl:when>
                                    <xsl:when test=".//gram[@type = 'MODE'] = 'ind'">
                                        <xsl:text>ind.</xsl:text>
                                    </xsl:when>
                                    <xsl:when test=".//gram[@type = 'MODE'] = 'sub'">
                                        <xsl:text>subj.</xsl:text>
                                    </xsl:when>
                                    <xsl:when test=".//gram[@type = 'MODE'] = 'ppe'">
                                        <xsl:text>part. passé</xsl:text>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:text>\textit{</xsl:text>
                            <xsl:value-of select="$mode"/>
                            <xsl:text> </xsl:text>
                            <xsl:if test=".//gram[@type = 'TEMPS']">
                                <xsl:variable name="temps">
                                    <xsl:choose>
                                        <xsl:when test=".//gram[@type = 'TEMPS'] = 'fut'">
                                            <xsl:text>fut.</xsl:text>
                                        </xsl:when>
                                        <xsl:when test=".//gram[@type = 'TEMPS'] = 'ipf'">
                                            <xsl:text>ipf.</xsl:text>
                                        </xsl:when>
                                        <xsl:when test=".//gram[@type = 'TEMPS'] = 'psp'">
                                            <xsl:text>parf.</xsl:text>
                                        </xsl:when>
                                        <xsl:when test=".//gram[@type = 'TEMPS'] = 'pst'">
                                            <xsl:text>pst.</xsl:text>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="$temps"/>
                                <xsl:text> </xsl:text>
                            </xsl:if>
                            <xsl:if test=".//gram[@type = 'PERS.']">
                                <xsl:text>pers. </xsl:text>
                                <xsl:value-of select=".//gram[@type = 'PERS.']"/>
                            </xsl:if>
                            <xsl:text>} </xsl:text>
                        </xsl:when>
                        <xsl:otherwise/>
                    </xsl:choose>
                    <xsl:value-of select="quote[@type = 'graphie']"/>
                    <xsl:text>, </xsl:text>
                <xsl:call-template name="PagesLines"/>
                </xsl:if>
            </xsl:if>
            
        </xsl:for-each-group>
       
    </xsl:template>
    <xsl:template name="PagesLines">
        <xsl:for-each-group select="current-group()/cit" group-by=".//biblScope[@unit = 'text']">
            <xsl:sort select="my:order(current-grouping-key())"/>
            <xsl:variable name="title" select="my:title(current-grouping-key())"/>
            <xsl:for-each-group select="current()" group-by=".//biblScope[@unit = 'page']">
                <xsl:sort select="current-grouping-key()"/>

                <xsl:text>\textbf{</xsl:text>
                <xsl:value-of select="$title"/>
                <xsl:text>}, </xsl:text>
                <xsl:for-each-group select="current-group()"
                    group-by="current()//biblScope[@unit = 'page']">
                    <xsl:text>p.~</xsl:text>
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text>, </xsl:text>
                    <xsl:for-each-group select="current-group()"
                        group-by="current()//biblScope[@unit = 'line']">
                        <xsl:text>l.~</xsl:text>
                        <xsl:value-of select="current-grouping-key()"/>
                        <xsl:choose>
                            <xsl:when test="position() = last()"/>
                            <xsl:otherwise>, </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each-group>
                    <xsl:choose>
                        <xsl:when test="position() = last()"/>
                        <xsl:otherwise>, </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each-group>
                <xsl:choose>
                    <xsl:when test="position() = last()"/>
                    <xsl:otherwise>, </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each-group>
            <xsl:choose>
                <xsl:when test="position() = last()"/>
                <xsl:otherwise>, </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each-group>
        <xsl:choose>
            <xsl:when test="position() = last()"/>
            <xsl:otherwise>, </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
