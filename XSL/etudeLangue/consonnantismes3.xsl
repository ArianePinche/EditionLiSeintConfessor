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
            
            <xsl:text>§56 Dissibilation du -r- &#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(fn:normalize(@lemma), '^[azetyuiopqsdfghjklmwxcvbnç]+r[azetyuiopqsdfghjklmwxcvbnç]+r[azetyuiopqsdfghjklmwxcvbnç]+$') and matches(fn:normalize(text()), '^[azetyuiopqsdfghjklmwxcvbnç]*r[azetyuiopqsdfghjklmwxcvbnç]*$') and not(matches(@type, 'VER'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            
         
            <xsl:text>§57 métathèse du groupe er/re &#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(fn:normalize(@lemma), '^\w*[zrtpqsdfghjklmwxcvbn]+er[zrtpqsdfghjklmwxcvbn]+\w*\d?') and matches(fn:normalize(text()), '^\w*[ztpqsdfghjklmwxcvbn]+re[zrtpqsdfghjklmwxcvbn]+\w*')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Cas particulier des verbes au futur&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(fn:normalize(text()), '^\w*rr\w*') and matches(@type, 'fut')]" group-by="@lemma">
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
            <xsl:for-each-group select="//w[matches(fn:normalize(text()), '^\w*a[zrtpqsdfgjkmwxcvbn]+\w*') and matches(fn:normalize(@lemma),'^\w*a(u|l)[zrtpqsdfgjkmwxcvbn]+\w*\d?$')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            
            <xsl:text>§59  l + yod à la final pic. l&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(fn:normalize(text()), '^\w*(e|a)(l|u)+(s|z)?$') and matches(fn:normalize(@lemma),'^\w*(e|a)i(l|u)+(s|z)?\d?$')]" group-by="@lemma">
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
            <xsl:for-each-group select="//w[not(matches(fn:normalize(text()), 'gn')) and matches(fn:normalize(@lemma),'gn')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>n, gn</xsl:text>
            <xsl:for-each-group select="//w[matches(fn:normalize(text()), 'gn') and not(matches(fn:normalize(@lemma),'gn'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>gn, ng(n)&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(fn:normalize(text()), 'ngn') and not(matches(fn:normalize(@lemma),'ngn'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>chute de la voyelle intercalaire dans les groupes lr, ml, nr </xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>l(d/b)r</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[not(matches(fn:normalize(text()), 'l(d|b)r')) and matches(fn:normalize(@lemma),'l(d|b)r') and not(matches(@type, 'VER'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key() and not(matches(@type, 'VER'))]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:for-each-group select="//w[matches(fn:normalize(text()), 'lr') and matches(@type, 'fut|cond')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key() and matches(@type, 'fut|cond')]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>n(d/b)r</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[not(matches(fn:normalize(text()), 'n(d|b)r')) and matches(fn:normalize(@lemma),'n(d|b)r') and not(matches(@type, 'VER'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key() and not(matches(@type, 'VER'))]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:for-each-group select="//w[matches(fn:normalize(text()), 'nr') and matches(@type, 'fut|cond')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key() and matches(@type, 'fut|cond')]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>m(d/b)l</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[not(matches(fn:normalize(text()), 'm(d|b)l')) and matches(fn:normalize(@lemma),'m(d|b)l') and not(matches(@type, 'VER'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key() and not(matches(@type, 'VER'))]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:for-each-group select="//w[matches(fn:normalize(text()), 'ml') and matches(@type, 'fut|cond')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key() and matches(@type, 'fut|cond')]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            
            <xsl:text>&#10;</xsl:text>
            <xsl:text>gn, ng(n) (§62)&#10;</xsl:text>
            <xsl:call-template name="occurrences">
                <xsl:with-param name="condition" select=" //w[matches(fn:normalize(text()), 'gn') and matches(fn:normalize(@lemma),'ng[azertyuiopqsdfghjklmwxcvbç]')]"/>
            </xsl:call-template>
            
           
            <xsl:text>ign-gn&#10;</xsl:text>
            <xsl:call-template name="occurrences">
                <xsl:with-param name="condition" select=" //w[matches(fn:normalize(text()), 'ign') and not(matches(fn:normalize(@lemma),'ign'))]"/>
            </xsl:call-template>
           
     
   
        </xsl:result-document>
        
    </xsl:template>
    
    <xsl:template name="occurrences">
        <xsl:param name="condition"/>
        <xsl:for-each-group select="$condition" group-by="@lemma">
            <xsl:sort order="ascending" select="@lemma"/>
            <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
            <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    
    
    
    
    
</xsl:stylesheet>
