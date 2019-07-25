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
       
        <xsl:result-document href="../analyseconsonantisme2.tsv">
            <xsl:text>&#10;</xsl:text>
          <xsl:text>Groupe scy :  ss&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(text(), '^\w*ss\w*') and not(matches(@lemma, '^\w*ss\w*'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                    <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                    <xsl:for-each-group select="current-group()" group-by=".">
                        <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                    </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§42 G+a lat. Et G + a,e,i germanique – conservation de la gutturale.&#10;</xsl:text>
            <xsl:text>§42 g pic. vs j fr à l'initiale&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(text(), '^g\w*$') and matches(@lemma, '^j\w*\d?$')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§42 g pic. vs j fr à l'intérieur&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(text(), '^\w+g\w*$') and matches(@lemma, '^\w+j\w*\d?$')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§42 gu/gh pic. vs g à l'initiale &#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(text(), '^g[u|h]\w*$') and not(matches(@lemma, '^g[u|h]\w*\d?$'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§42 gu/gh pic. vs g à l'intérieur &#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(text(), '^\w+g[u|h]\w*$') and not(matches(@lemma, '^\w+g[u|h]\w*\d?$'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by=".">
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
                <xsl:for-each-group select="current-group()" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§46 : Les dentales : conservation d'un t final&#10;</xsl:text>
            <xsl:text>Conservation d'un t final dans les ppe&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type,'POS=VERppe') and matches(text(), '^\w*t$')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()] and matches(@type,'POS=VERppe'))"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Conservation d'un t final dans les autres mots&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type,'NOMcom') and matches(text(), '^\w*t$') and not(matches(@lemma, '^\w*t\d?$'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§49 confusion s et ss&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(text(), '^\w+ss\w+$') and not(matches(@lemma, '^\w+ss\w+\d?$')) and not(matches(@type, 'VER'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>§50 s intérieur devant consonne entraine en r en pic?&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(text(), '^\w+r[zrtpqsdfghjklmwxcvbn]\w+$') and matches(@lemma, '^\w+s[zrtpqsdfghjklmwxcvbn]\w+\d?$') and not(matches(@type,'POS=VER'))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Les liquides&#10;</xsl:text>
            <xsl:text>§55 rl passe à ll assimilation&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@lemma, '^\w+rl\w+d?$') and matches(text(), '^\w+ll\w+$')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>r parasite ?&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type,'NOMcom') and contains(text(), 'r') and not(matches(fn:normalize(text()), fn:normalize(replace(@lemma, '\d',''))))]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="current-group()" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>labdacisme ?&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(@type,'NOMcom') and contains(@lemma, 'r') and not(contains(text(), 'r')) and contains(text(), 'l')]" group-by="@lemma">
                <xsl:sort order="ascending" select="@lemma"/>
                <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(//w[@lemma=current-grouping-key()])"/><xsl:text>&#09;</xsl:text>
                <xsl:for-each-group select="//w[@lemma=current-grouping-key()]" group-by=".">
                    <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#09;</xsl:text>
                </xsl:for-each-group>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
        </xsl:result-document>

    </xsl:template>






</xsl:stylesheet>
