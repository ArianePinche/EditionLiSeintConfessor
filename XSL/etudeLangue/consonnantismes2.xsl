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
       
        <xsl:result-document href="../../resultats/analyseconsonantisme2.tsv">
            <xsl:text>&#10;</xsl:text>
          <xsl:text>Groupe scy :  ss&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(fn:normalize(text()), '^\w*ss\w*') and not(matches(fn:normalize(@lemma), '^\w*ss\w*'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                    <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                    <xsl:for-each-group select="current-group()" group-by="lower-case(.)">
                        <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                    </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§42 G+a lat. Et G + a,e,i germanique – conservation de la gutturale.&#10;</xsl:text>
            <xsl:text>§42 g pic. vs j fr à l'initiale&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(fn:normalize(text()), '^g\w*$') and matches(fn:normalize(@lemma), '^j\w*\d?$')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by="lower-case(.)">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§42 g pic. vs j fr à l'intérieur&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(fn:normalize(text()), '^\w+g\w*$') and matches(fn:normalize(@lemma), '^\w+j\w*\d?$')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by="lower-case(.)">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§42 gu/gh pic. vs g à l'initiale &#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(fn:normalize(text()), '^g[u|h]\w*$') and not(matches(fn:normalize(@lemma), '^g[u|h]\w*\d?$'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by="lower-case(.)">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§42 gu/gh pic. vs g à l'intérieur &#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(fn:normalize(text()), '^\w+g[u|h]\w*$') and not(matches(fn:normalize(@lemma), '^\w+g[u|h]\w*\d?$'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by="lower-case(.)">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§43 : le traitement de cw intervocalique, la graphie du terme eau.&#10;</xsl:text>
            <xsl:for-each-group select="//w[@lemma='aigue']" group-by="@lemma">
               
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by="lower-case(.)">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§41,§45 g > ch en final &#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(fn:normalize(text()), '^[\w|ç]+ch[e|i|ï|é|a][e|é]?[s|r]?$') and matches(fn:normalize(@lemma), '^[\w|ç]+g[e|i|ï|é]')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#10;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by="lower-case(.)">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§46 : Les dentales : conservation d'un t final&#10;</xsl:text>
            <xsl:text>Conservation d'un t final dans les ppe&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type,'POS=VERppe') and matches(fn:normalize(text()), '^\w*t[e]?$')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()] and matches(@type,'POS=VERppe'))"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by="lower-case(.)">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Conservation d'un t final dans les autres mots&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type,'NOMcom') and matches(fn:normalize(text()), '^\w*t$') and not(matches(fn:normalize(@lemma), '^\w*t\d?$'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by="lower-case(.)">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§49 confusion s et ss&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(fn:normalize(text()), '^(\w|ç)+ss') and matches(fn:normalize(@lemma), '^(\w|ç)+[aeiouéïëü]s[aeiouéïëü]') and not(matches(@type, 'VER'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by="lower-case(.)">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(fn:normalize(text()), '^(\w|ç)+[aeiouéïëü]s[aeiouéïëü]') and matches(fn:normalize(@lemma), '^(\w|ç)+ss') and not(matches(@type, 'VER'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by="lower-case(.)">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§50 s intérieur devant consonne entraine en r en pic&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(fn:normalize(text()), '^\w+r[zrtpqsdfghjklmwxcvbn]\w+$') and matches(fn:normalize(@lemma), '^\w+s[zrtpqsdfghjklmwxcvbn]\w+\d?$') and not(matches(@type,'POS=VERcjg'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:text>&#10;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by="lower-case(.)">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les liquides&#10;</xsl:text>
            <xsl:text>§55 rl passe à ll assimilation&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(fn:normalize(@lemma), 'rl') and matches(fn:normalize(text()), 'll')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:text>&#10;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by="lower-case(.)">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>r parasite ?&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type,'NOMcom') and matches(fn:normalize(.),'r') and not(matches(fn:normalize(@lemma), 'r'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by="lower-case(.)">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>labdacisme ?&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type,'NOMcom') and matches(@lemma, 'r') and not(matches(text(), 'r')) and matches(text(), 'l')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by="lower-case(.)">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
        </xsl:result-document>

    </xsl:template>






</xsl:stylesheet>
