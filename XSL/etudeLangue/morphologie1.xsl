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
    <!-- A finir : lemme cest / cel pour le dem
    traiter les indéfinis, rel et int. 
    -->
        <xsl:result-document href="../analyseMorphologique1.tsv">
            <xsl:text>&#10;</xsl:text>

            <xsl:text>§63 L'article défini&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>cas&#09;masc&#09;fém&#10;</xsl:text>
            <xsl:text>CSS</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdef\|NOMB.=s\|GENRE=m\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdef\|NOMB.=s\|GENRE=m\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdef\|NOMB.=s\|GENRE=f\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdef\|NOMB.=s\|GENRE=f\|CAS=n')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdef\|NOMB.=s\|GENRE=m\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdef\|NOMB.=s\|GENRE=m\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdef\|NOMB.=s\|GENRE=f\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdef\|NOMB.=s\|GENRE=f\|CAS=r')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdef\|NOMB.=p\|GENRE=m\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdef\|NOMB.=p\|GENRE=m\|CAS=n')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdef\|NOMB.=p\|GENRE=f\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdef\|NOMB.=p\|GENRE=f\|CAS=n')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdef\|NOMB.=p\|GENRE=m\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdef\|NOMB.=p\|GENRE=m\|CAS=r')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdef\|NOMB.=p\|GENRE=f\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdef\|NOMB.=p\|GENRE=f\|CAS=r')]) * 100)"/>
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
            <xsl:text>§63 L'article demonstratif&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
           
            <xsl:text>&#10;</xsl:text>
            <xsl:text>cest (</xsl:text><xsl:value-of select="round(count(//w[matches(@type, 'POS=DETdem') and @lemma='cest']) div count(//w[matches(@type, 'POS=DETdem')]) * 100)"/>
            <xsl:text>%)&#10;</xsl:text>
            <xsl:text>cas&#09;masc&#09;fém&#10;</xsl:text>
            <xsl:text>CSS</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=m\|CAS=n') and @lemma='cest']"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=m\|CAS=n') and @lemma='cest']) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=f\|CAS=n') and @lemma='cest']"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=f\|CAS=n') and @lemma='cest']) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=m\|CAS=r') and @lemma='cest']"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=m\|CAS=r') and @lemma='cest']) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=f\|CAS=r') and @lemma='cest']"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=f\|CAS=r') and @lemma='cest']) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=m\|CAS=n') and @lemma='cest']"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=m\|CAS=n') and @lemma='cest']) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=f\|CAS=n') and @lemma='cest']"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=f\|CAS=n') and @lemma='cest']) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=m\|CAS=r') and @lemma='cest']"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=m\|CAS=r') and @lemma='cest']) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=f\|CAS=r') and @lemma='cest']"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=f\|CAS=r') and @lemma='cest']) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            
            
            <xsl:text>cel (</xsl:text><xsl:value-of select="round(count(//w[matches(@type, 'POS=DETdem') and @lemma='cel']) div count(//w[matches(@type, 'POS=DETdem')]) * 100)"/>
            <xsl:text> %)&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>cas&#09;masc&#09;fém&#10;</xsl:text>
            <xsl:text>CSS</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=m\|CAS=n') and @lemma='cel']"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=m\|CAS=n') and @lemma='cel']) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=f\|CAS=n') and @lemma='cel']"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=f\|CAS=n') and @lemma='cel']) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=m\|CAS=r') and @lemma='cel']"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=m\|CAS=r') and @lemma='cel']) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=f\|CAS=r') and @lemma='cel']"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=f\|CAS=r') and @lemma='cel']) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=m\|CAS=n') and @lemma='cel']"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=m\|CAS=n') and @lemma='cel']) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=f\|CAS=n') and @lemma='cel']"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=f\|CAS=n') and @lemma='cel']) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=m\|CAS=r') and @lemma='cel']"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=m\|CAS=r') and @lemma='cel']) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=f\|CAS=r') and @lemma='cel']"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=f\|CAS=r') and @lemma='cel']) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            
            <xsl:text>ce2 (</xsl:text><xsl:value-of select="round(count(//w[matches(@type, 'POS=DETdem') and matches(@lemma, '^ce\d?$')]) div count(//w[matches(@type, 'POS=DETdem')]) * 100)"/>
            <xsl:text>%)&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>cas&#09;masc&#09;fém&#10;</xsl:text>
            <xsl:text>CSS</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=m\|CAS=n') and matches(@lemma, '^ce\d?$')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=m\|CAS=n') and matches(@lemma, '^ce\d?$')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=f\|CAS=n') and matches(@lemma, '^ce\d?$')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=f\|CAS=n') and matches(@lemma, '^ce\d?$')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=m\|CAS=r') and matches(@lemma, '^ce\d?$')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=m\|CAS=r') and matches(@lemma, '^ce\d?$')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=f\|CAS=r') and matches(@lemma, '^ce\d?$')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=s\|GENRE=f\|CAS=r') and matches(@lemma, '^ce\d?$')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=m\|CAS=n') and matches(@lemma, '^ce\d?$')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=m\|CAS=n') and matches(@lemma, '^ce\d?$')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=f\|CAS=n') and matches(@lemma, '^ce\d?$')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=f\|CAS=n') and matches(@lemma, '^ce\d?$')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=m\|CAS=r') and matches(@lemma, '^ce\d?$')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=m\|CAS=r') and matches(@lemma, '^ce\d?$')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=f\|CAS=r') and matches(@lemma, '^ce\d?$')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETdem\|NOMB.=p\|GENRE=f\|CAS=r') and matches(@lemma, '^ce\d?$')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§63 L'article possessif&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Possesseur unique&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>1ere personne </xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>cas&#09;masc&#09;fém&#10;</xsl:text>
            <xsl:text>CSS</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=s\|GENRE=m\|CAS=n') and matches(@lemma, 'mon')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=s\|GENRE=m\|CAS=n') and matches(@lemma, 'mon')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=s\|GENRE=f\|CAS=n') and matches(@lemma, 'mon')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=s\|GENRE=f\|CAS=n') and matches(@lemma, 'mon')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=s\|GENRE=m\|CAS=r') and matches(@lemma, 'mon')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=s\|GENRE=m\|CAS=r') and matches(@lemma, 'mon')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=s\|GENRE=f\|CAS=r') and matches(@lemma, 'mon')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=s\|GENRE=f\|CAS=r') and matches(@lemma, 'mon')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=p\|GENRE=m\|CAS=n') and matches(@lemma, 'mon')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=p\|GENRE=m\|CAS=n') and matches(@lemma, 'mon')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=p\|GENRE=f\|CAS=n') and matches(@lemma, 'mon')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=p\|GENRE=f\|CAS=n') and matches(@lemma, 'mon')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=p\|GENRE=m\|CAS=r') and matches(@lemma, 'mon')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=p\|GENRE=m\|CAS=r') and matches(@lemma, 'mon')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=p\|GENRE=f\|CAS=r') and matches(@lemma, 'mon')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=p\|GENRE=f\|CAS=r') and matches(@lemma, 'mon')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>2e personne</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>cas&#09;masc&#09;fém&#10;</xsl:text>
            <xsl:text>CSS</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=s\|GENRE=m\|CAS=n') and matches(@lemma, 'ton')]"
                group-by="lower-case(.)">
                <xsl:sort select="." order="ascending"/>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=s\|GENRE=m\|CAS=n')  and matches(@lemma, 'ton')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=s\|GENRE=f\|CAS=n')  and matches(@lemma, 'ton')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=s\|GENRE=f\|CAS=n')  and matches(@lemma, 'ton')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=s\|GENRE=m\|CAS=r')  and matches(@lemma, 'ton')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=s\|GENRE=m\|CAS=r')  and matches(@lemma, 'ton')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=s\|GENRE=f\|CAS=r')  and matches(@lemma, 'ton')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=s\|GENRE=f\|CAS=r') and matches(@lemma, 'ton')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=p\|GENRE=m\|CAS=n') and matches(@lemma, 'ton')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=p\|GENRE=m\|CAS=n') and matches(@lemma, 'ton')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=p\|GENRE=f\|CAS=n') and matches(@lemma, 'ton')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=p\|GENRE=f\|CAS=n') and matches(@lemma, 'ton')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=p\|GENRE=m\|CAS=r')and matches(@lemma, 'ton')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=p\|GENRE=m\|CAS=r') and matches(@lemma, 'ton')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=p\|GENRE=f\|CAS=r') and matches(@lemma, 'ton')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=p\|GENRE=f\|CAS=r') and matches(@lemma, 'ton')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=s\|GENRE=m\|CAS=n')  and matches(@lemma, 'son')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=s\|GENRE=m\|CAS=n') and matches(@lemma, 'son')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=s\|GENRE=f\|CAS=n') and matches(@lemma, 'son')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=s\|GENRE=f\|CAS=n') and matches(@lemma, 'son')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=s\|GENRE=m\|CAS=r') and matches(@lemma, 'son')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=s\|GENRE=m\|CAS=r') and matches(@lemma, 'son')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=s\|GENRE=f\|CAS=r') and matches(@lemma, 'son')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=s\|GENRE=f\|CAS=r') and matches(@lemma, 'son')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=p\|GENRE=m\|CAS=n') and matches(@lemma, 'son')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=p\|GENRE=m\|CAS=n') and matches(@lemma, 'son')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=p\|GENRE=f\|CAS=n') and matches(@lemma, 'son')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=p\|GENRE=f\|CAS=n') and matches(@lemma, 'son')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=p\|GENRE=m\|CAS=r') and matches(@lemma, 'son')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=p\|GENRE=m\|CAS=r') and matches(@lemma, 'son')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=p\|GENRE=f\|CAS=r') and matches(@lemma, 'son')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=p\|GENRE=f\|CAS=r') and matches(@lemma, 'son')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Possesseur multiple</xsl:text>
            <xsl:text>&#10;</xsl:text>
             <xsl:text>1ere personne </xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>cas&#09;masc&#09;fém&#10;</xsl:text>
            <xsl:text>CSS</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=s\|GENRE=m\|CAS=n') and matches(@lemma, 'nostre')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=s\|GENRE=m\|CAS=n') and matches(@lemma, 'nostre')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=s\|GENRE=f\|CAS=n') and matches(@lemma, 'nostre')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=s\|GENRE=f\|CAS=n') and matches(@lemma, 'nostre')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=s\|GENRE=m\|CAS=r') and matches(@lemma, 'nostre')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=s\|GENRE=m\|CAS=r') and matches(@lemma, 'nostre')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=s\|GENRE=f\|CAS=r') and matches(@lemma, 'nostre')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=s\|GENRE=f\|CAS=r') and matches(@lemma, 'nostre')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=p\|GENRE=m\|CAS=n') and matches(@lemma, 'nostre')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=p\|GENRE=m\|CAS=n') and matches(@lemma, 'nostre')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=p\|GENRE=f\|CAS=n') and matches(@lemma, 'nostre')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=p\|GENRE=f\|CAS=n') and matches(@lemma, 'nostre')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=p\|GENRE=m\|CAS=r') and matches(@lemma, 'nostre')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=p\|GENRE=m\|CAS=r') and matches(@lemma, 'nostre')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=p\|GENRE=f\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=1\|NOMB.=p\|GENRE=f\|CAS=r') and matches(@lemma, 'nostre')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=s\|GENRE=m\|CAS=n') and matches(@lemma, 'vostre')]"
                group-by="lower-case(.)">
                <xsl:sort select="." order="ascending"/>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=s\|GENRE=m\|CAS=n')  and matches(@lemma, 'vostre')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=s\|GENRE=f\|CAS=n')  and matches(@lemma, 'vostre')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=s\|GENRE=f\|CAS=n')  and matches(@lemma, 'vostre')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=s\|GENRE=m\|CAS=r')  and matches(@lemma, 'vostre')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=s\|GENRE=m\|CAS=r')  and matches(@lemma, 'vostre')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=s\|GENRE=f\|CAS=r')  and matches(@lemma, 'vostre')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=s\|GENRE=f\|CAS=r') and matches(@lemma, 'vostre')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=p\|GENRE=m\|CAS=n') and matches(@lemma, 'vostre')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=p\|GENRE=m\|CAS=n') and matches(@lemma, 'vostre')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=p\|GENRE=f\|CAS=n') and matches(@lemma, 'vostre')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=p\|GENRE=f\|CAS=n') and matches(@lemma, 'vostre')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=p\|GENRE=m\|CAS=r')and matches(@lemma, 'vostre')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=p\|GENRE=m\|CAS=r') and matches(@lemma, 'vostre')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=p\|GENRE=f\|CAS=r') and matches(@lemma, 'vostre')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=2\|NOMB.=p\|GENRE=f\|CAS=r') and matches(@lemma, 'vostre')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=s\|GENRE=m\|CAS=n')  and matches(@lemma, 'lor2')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=s\|GENRE=m\|CAS=n') and matches(@lemma, 'lor2')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=s\|GENRE=f\|CAS=n') and matches(@lemma, 'lor2')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=s\|GENRE=f\|CAS=n') and matches(@lemma, 'lor2')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=s\|GENRE=m\|CAS=r') and matches(@lemma, 'lor2')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=s\|GENRE=m\|CAS=r') and matches(@lemma, 'lor2')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=s\|GENRE=f\|CAS=r') and matches(@lemma, 'lor2')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=s\|GENRE=f\|CAS=r') and matches(@lemma, 'lor2')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=p\|GENRE=m\|CAS=n') and matches(@lemma, 'lor2')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=p\|GENRE=m\|CAS=n') and matches(@lemma, 'lor2')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=p\|GENRE=f\|CAS=n') and matches(@lemma, 'lor2')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=p\|GENRE=f\|CAS=n') and matches(@lemma, 'lor2')]) * 100)"/>
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
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=p\|GENRE=m\|CAS=r') and matches(@lemma, 'lor2')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=p\|GENRE=m\|CAS=r') and matches(@lemma, 'lor2')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=p\|GENRE=f\|CAS=r') and matches(@lemma, 'lor2')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of
                    select="round(count(current-group()) div count(//w[matches(@type, 'POS=DETpos\|PERS.=3\|NOMB.=p\|GENRE=f\|CAS=r') and matches(@lemma, 'lor2')]) * 100)"/>
                <xsl:text>% - nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les déterminants cardinaux&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'DETcar')]" group-by="@lemma">
            <xsl:sort order="ascending" select="."/>
            <xsl:text>cas&#09;masc&#09;fém&#10;</xsl:text>
            <xsl:text>CSS</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=m\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=f\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CRS</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=m\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=f\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CSP</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=p\|GENRE=m\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=p\|GENRE=f\|CAS=n')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>CRP</xsl:text>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, 'POS=DETdef\|NOMB.=p\|GENRE=m\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=p\|GENRE=f\|CAS=r')]"
                group-by="lower-case(.)">
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (nb: </xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">
                    <xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les déterminants indéfinis&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'DETind')]" group-by="@lemma">
                <xsl:sort order="ascending" select="."/>
                <xsl:text>cas&#09;masc&#09;fém&#10;</xsl:text>
                <xsl:text>CSS</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=m\|CAS=n')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=f\|CAS=n')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>CRS</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=m\|CAS=r')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=f\|CAS=r')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>CSP</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=p\|GENRE=m\|CAS=n')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=p\|GENRE=f\|CAS=n')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>CRP</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'POS=DETdef\|NOMB.=p\|GENRE=m\|CAS=r')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=p\|GENRE=f\|CAS=r')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
            <xsl:text>Les déterminants cardinaux&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'DETcar')]" group-by="@lemma">
                <xsl:sort order="ascending" select="."/>
                <xsl:text>cas&#09;masc&#09;fém&#10;</xsl:text>
                <xsl:text>CSS</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=m\|CAS=n')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=f\|CAS=n')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>CRS</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=m\|CAS=r')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=f\|CAS=r')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>CSP</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=p\|GENRE=m\|CAS=n')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=p\|GENRE=f\|CAS=n')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>CRP</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'POS=DETdef\|NOMB.=p\|GENRE=m\|CAS=r')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=p\|GENRE=f\|CAS=r')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
            
            <xsl:text>Les déterminants ordinaux&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'DETord')]" group-by="@lemma">
                <xsl:sort order="ascending" select="."/>
                <xsl:text>cas&#09;masc&#09;fém&#10;</xsl:text>
                <xsl:text>CSS</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=m\|CAS=n')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=f\|CAS=n')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>CRS</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=m\|CAS=r')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=f\|CAS=r')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>CSP</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=p\|GENRE=m\|CAS=n')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=p\|GENRE=f\|CAS=n')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>CRP</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'POS=DETdef\|NOMB.=p\|GENRE=m\|CAS=r')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=p\|GENRE=f\|CAS=r')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les déterminants relatifs&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'DETrel')]" group-by="@lemma">
                <xsl:sort order="ascending" select="."/>
                <xsl:text>cas&#09;masc&#09;fém&#10;</xsl:text>
                <xsl:text>CSS</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=m\|CAS=n')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=f\|CAS=n')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>CRS</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=m\|CAS=r')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=f\|CAS=r')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>CSP</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=p\|GENRE=m\|CAS=n')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=p\|GENRE=f\|CAS=n')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>CRP</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'POS=DETdef\|NOMB.=p\|GENRE=m\|CAS=r')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=p\|GENRE=f\|CAS=r')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les déterminants interrogatifs&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type, 'DETint')]" group-by="@lemma">
                <xsl:sort order="ascending" select="."/>
                <xsl:text>cas&#09;masc&#09;fém&#10;</xsl:text>
                <xsl:text>CSS</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=m\|CAS=n')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=f\|CAS=n')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>CRS</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=m\|CAS=r')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=s\|GENRE=f\|CAS=r')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>CSP</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=p\|GENRE=m\|CAS=n')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=p\|GENRE=f\|CAS=n')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>CRP</xsl:text>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'POS=DETdef\|NOMB.=p\|GENRE=m\|CAS=r')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()[matches(@type, 'NOMB.=p\|GENRE=f\|CAS=r')]"
                    group-by="lower-case(.)">
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text> (nb: </xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>)</xsl:text>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>

        </xsl:result-document>

    </xsl:template>






</xsl:stylesheet>
