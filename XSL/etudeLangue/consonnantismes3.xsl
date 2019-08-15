<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://fn.com" xmlns="http://www.tei-c.org/ns/1.0" 
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <xsl:function name="fn:normalize">
        <xsl:param name="input"></xsl:param>
        <xsl:value-of select="translate(normalize-unicode(lower-case($input),'NFKD'), 'áàâäéèêëíìîïóòôöúùûü','aaaaeeeeiiiioooouuuu')"/>
    </xsl:function>
    <xsl:output method="text"/>
    <xsl:template match="/">
        
        <xsl:result-document href="../../resultats//analyseconsonantisme3.tsv">
            <xsl:text>&#10;</xsl:text>
         
            <xsl:text>§57 métathèse du groupe er/re &#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@lemma, '^\w*[zrtpqsdfghjklmwxcvbn]+er[zrtpqsdfghjklmwxcvbn]+\w*\d?') and matches(text(), '^\w*[ztpqsdfghjklmwxcvbn]+re[zrtpqsdfghjklmwxcvbn]+\w*')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Cas particulier des verbes au futur&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(text(), '^\w*rr\w*') and matches(@type, 'fut')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>

            <xsl:text>&#10;</xsl:text>
            <xsl:text>§58 Chute du l dans le groupe a + l + consonne&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(text(), '^\w*a[zrtpqsdfgjkmwxcvbn]+\w*') and matches(@lemma,'^\w*a(u|l)[zrtpqsdfgjkmwxcvbn]+\w*\d?$')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            
            <xsl:text>§59  l + yod à la final pic. l&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(text(), '^\w*(e|a)(l|u)+(s|z)?$') and matches(@lemma,'^\w*(e|a)i(l|u)+(s|z)?\d?$')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            
            <xsl:text>§60  confusion n et n mouillé&#10;</xsl:text>
            <xsl:text>gn, n&#10;</xsl:text>
            <xsl:for-each-group select="//w[not(matches(text(), '^\w*gn\w*$')) and matches(@lemma,'^\w*gn\w*\d?$')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>n, gn</xsl:text>
            <xsl:for-each-group select="//w[matches(text(), '^\w*gn\w*$') and not(matches(@lemma,'^\w*gn\w*\d?$'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>gn, ng(n)</xsl:text>
            <xsl:for-each-group select="//w[matches(text(), '^\w*ng\w*$') and matches(@lemma,'^\w*gn\w*\d?$')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>chute de la consonne d'épenthèse</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>l(d/b)r</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[not(matches(text(), '^^\w*l(d|b)r\w*$')) and matches(@lemma,'^\w*l(d|b)r\w*\d?$')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>n(d/b)r</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[not(matches(text(), '^^\w*n(b|d)r\w*$')) and matches(@lemma,'^\w*n(d|b)r\w*\d?$')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>m(d/b)l</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[not(matches(text(), '^^\w*m(b|d)l\w*$')) and matches(@lemma,'^\w*m(d|b)l\w*\d?$')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <!-- Compléter les cas avec les verbes conjugués après-->
            <xsl:text>&#10;</xsl:text>
            
            
        </xsl:result-document>
        
    </xsl:template>
    
    
    
    
    
    
</xsl:stylesheet>
