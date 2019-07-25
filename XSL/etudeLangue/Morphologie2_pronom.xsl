<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://fn.com"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:function name="fn:normalize">
        <xsl:param name="input"/>
        <xsl:value-of
            select="translate(normalize-unicode(lower-case($input), 'NFKD'), 'áàâäéèêëíìîïóòôöúùûü', 'aaaaeeeeiiiioooouuuu')"
        />
    </xsl:function>
    <xsl:output method="text"/>
    <xsl:template match="/">

        <xsl:result-document href="../analyseMorphologique2_pronoms.tsv">
            <xsl:text>&#10;</xsl:text>
            
            <xsl:variable name="CSSm"/>
            <xsl:variable name="CSSf"/>
            <xsl:variable name="CSRm"/>
            <xsl:variable name="CSRf"/>
            <xsl:variable name="CSIm"/>
            <xsl:variable name="CSIf"/>
            <xsl:variable name="pers1"/>
            <xsl:variable name="pers2"/>
            <xsl:variable name="pers3"/>
            <xsl:variable name="CatGram"/>
            <xsl:variable name="lem"/>
            
            <xsl:text>Les pronoms personnels&#10;</xsl:text>
            <xsl:variable name="CatGram"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>P1</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>cas&#09;masc&#09;fém&#10;</xsl:text>
            <xsl:text>CSS</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=PROper\|PERS.=1\|NOMB.=s\|GENRE=m\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=PROper\|NOMB.=s\|GENRE=m\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=PROper\|NOMB.=s\|GENRE=f\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=PROper\|NOMB.=s\|GENRE=f\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CRS</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=PROper\|NOMB.=s\|GENRE=m\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=PROper\|NOMB.=s\|GENRE=m\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=PROper\|NOMB.=s\|GENRE=f\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=PROper\|NOMB.=s\|GENRE=f\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CIS</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=PROper\|NOMB.=s\|GENRE=m\|CAS=i')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=PROper\|NOMB.=s\|GENRE=m\|CAS=i')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=PROper\|NOMB.=s\|GENRE=f\|CAS=i')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=PROper\|NOMB.=s\|GENRE=f\|CAS=i')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CSP</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=PROper\|NOMB.=p\|GENRE=m\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=PROper\|NOMB.=p\|GENRE=m\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=PROper\|NOMB.=p\|GENRE=f\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=PROper\|NOMB.=p\|GENRE=f\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CRP</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=PROper\|NOMB.=p\|GENRE=m\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=PROper\|NOMB.=p\|GENRE=m\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=PROper\|NOMB.=p\|GENRE=f\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=PROper\|NOMB.=p\|GENRE=f\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>CIP</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=PROper\|NOMB.=p\|GENRE=m\|CAS=i')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=PROper\|NOMB.=p\|GENRE=m\|CAS=i')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=PROper\|NOMB.=p\|GENRE=f\|CAS=i')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=PROper\|NOMB.=p\|GENRE=f\|CAS=i')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
     
            <xsl:text>§63 L'article indéfini&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>cas&#09;masc&#09;fém&#10;</xsl:text>
            <xsl:text>CSS</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETndf\|NOMB.=s\|GENRE=m\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETndf\|NOMB.=s\|GENRE=m\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETndf\|NOMB.=s\|GENRE=f\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETndf\|NOMB.=s\|GENRE=f\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CRS</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETndf\|NOMB.=s\|GENRE=m\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETndf\|NOMB.=s\|GENRE=m\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETndf\|NOMB.=s\|GENRE=f\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETndf\|NOMB.=s\|GENRE=f\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CSP</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETndf\|NOMB.=p\|GENRE=m\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETndf\|NOMB.=p\|GENRE=m\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETndf\|NOMB.=p\|GENRE=f\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETndf\|NOMB.=p\|GENRE=f\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CRP</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETndf\|NOMB.=p\|GENRE=m\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETndf\|NOMB.=p\|GENRE=m\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETndf\|NOMB.=p\|GENRE=f\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETndf\|NOMB.=p\|GENRE=f\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§63 L'article possessif&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>1ere personne</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>cas&#09;masc&#09;fém&#10;</xsl:text>
            <xsl:text>CSS</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.1|NOMB.=s\|GENRE=m\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.1|NOMB.=s\|GENRE=m\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.1|NOMB.=s\|GENRE=f\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.1|NOMB.=s\|GENRE=f\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CRS</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.1|NOMB.=s\|GENRE=m\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.1|NOMB.=s\|GENRE=m\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.1|NOMB.=s\|GENRE=f\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.1|NOMB.=s\|GENRE=f\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CSP</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.1|NOMB.=p\|GENRE=m\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.1|NOMB.=p\|GENRE=m\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.1|NOMB.=p\|GENRE=f\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.1|NOMB.=p\|GENRE=f\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CRP</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.1|NOMB.=p\|GENRE=m\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.1|NOMB.=p\|GENRE=m\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.1|NOMB.=p\|GENRE=f\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.1|NOMB.=p\|GENRE=f\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§63 L'article possessif&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>2ere personne</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>cas&#09;masc&#09;fém&#10;</xsl:text>
            <xsl:text>CSS</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.2|NOMB.=s\|GENRE=m\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.2|NOMB.=s\|GENRE=m\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.2|NOMB.=s\|GENRE=f\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.2|NOMB.=s\|GENRE=f\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CRS</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.2|NOMB.=s\|GENRE=m\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.2|NOMB.=s\|GENRE=m\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.2|NOMB.=s\|GENRE=f\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.2|NOMB.=s\|GENRE=f\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CSP</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.2|NOMB.=p\|GENRE=m\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.2|NOMB.=p\|GENRE=m\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.2|NOMB.=p\|GENRE=f\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.2|NOMB.=p\|GENRE=f\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CRP</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.2|NOMB.=p\|GENRE=m\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.2|NOMB.=p\|GENRE=m\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.2|NOMB.=p\|GENRE=f\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.2|NOMB.=p\|GENRE=f\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>3e personne</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>cas&#09;masc&#09;fém&#10;</xsl:text>
            <xsl:text>CSS</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.3|NOMB.=s\|GENRE=m\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.3|NOMB.=s\|GENRE=m\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.3|NOMB.=s\|GENRE=f\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.3|NOMB.=s\|GENRE=f\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CRS</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.3|NOMB.=s\|GENRE=m\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.3|NOMB.=s\|GENRE=m\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.3|NOMB.=s\|GENRE=f\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.3|NOMB.=s\|GENRE=f\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CSP</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.3|NOMB.=p\|GENRE=m\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.3|NOMB.=p\|GENRE=m\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.3|NOMB.=p\|GENRE=f\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.3|NOMB.=p\|GENRE=f\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CRP</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.3|NOMB.=p\|GENRE=m\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.3|NOMB.=p\|GENRE=m\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.3|NOMB.=p\|GENRE=f\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.3|NOMB.=p\|GENRE=f\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>

        </xsl:result-document>

    </xsl:template>






</xsl:stylesheet>
