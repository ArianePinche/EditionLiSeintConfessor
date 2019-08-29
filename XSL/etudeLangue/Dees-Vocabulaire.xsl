<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:result-document href="../../resultats/Dees-Vocabulaire1.tsv">
    <xsl:text>Etude des graphies du corpus en fonction des cartes linguistiques de A. Dees,
        DEES, Anthonij, DEKKER, Marcel, HUBER, Onno, [et al.], Atlas des formes linguistiques des textes littéraires de l’ancien français, Reprint 2014, Berlin, Boston, De Gruyter, 1987, [En ligne : https://www.degruyter.com/viewbooktoc/product/160190].
&#10;</xsl:text> 
            <xsl:text>Graphie de eau&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[@lemma='aigue']"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>    
        
        <xsl:text>Carte 53 : Graphie nient&#10;</xsl:text>
        <xsl:call-template name="occurrence">
            <xsl:with-param name="condition" select="//w[@lemma='nïent']"/>
        </xsl:call-template>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Carte 59-60 : Graphie plusieur&#10;</xsl:text>
        <xsl:call-template name="occurrence">
             <xsl:with-param name="condition" select="//w[@lemma='plusor']"/>
         </xsl:call-template>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Carte 104 : Graphie de dolce&#10;</xsl:text>
        <xsl:call-template name="occurrence">
            <xsl:with-param name="condition" select="//w[@lemma='douz' and matches(@type, 'GENRE=f')]"/>
        </xsl:call-template>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Carte 105 : Graphie dous/douz&#10;</xsl:text>
        <xsl:call-template name="occurrence">
            <xsl:with-param name="condition" select="//w[@lemma='douz' and matches(@type, 'GENRE=m')]"/>
        </xsl:call-template>
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Carte 106 : Graphie dolent&#10;</xsl:text>
        <xsl:call-template name="occurrence">
            <xsl:with-param name="condition" select="//w[@lemma='dolent']"/>
        </xsl:call-template>
       
        <xsl:text>&#10;</xsl:text>
        <xsl:text>Carte 106 : Graphie drois/droiz&#10;</xsl:text>
        <xsl:call-template name="occurrence">
            <xsl:with-param name="condition" select="//w[@lemma='droit' and matches(text(), 'is|z$')]"/>
        </xsl:call-template>
        
        <xsl:text>Carte 108 : Graphie estrange/estraigne&#10;</xsl:text>
        <xsl:call-template name="occurrence">
            <xsl:with-param name="condition" select="//w[@lemma='estrange']"/>
        </xsl:call-template>
        
        <xsl:text>Carte 115 : Graphie meilleur/mieldre&#10;</xsl:text>
        <xsl:call-template name="occurrence">
            <xsl:with-param name="condition" select="//w[@lemma='meillor' or (@lemma='mieus' and matches(@type,'DEGRE=s'))]"/>
        </xsl:call-template>
            
            <xsl:text>Carte 120 : Graphie plain/plein&#10;</xsl:text>
            <!-- Non cohérent -->
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[@lemma='plein']"/>
            </xsl:call-template>
            
            <xsl:text>Carte 129 : Graphie bel/beau&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[matches(lower-case(text()),'^b(i|e)au(s)?$')]"/>
            </xsl:call-template>
            
            <xsl:text>Carte 145 : Graphie de ame&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='ame')]"/>
                <!-- complètement cohérent ac artois -->
            </xsl:call-template>
            
            <xsl:text>Carte 149 : Graphie de amor&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='amor')]"/>
                <!-- complètement cohérent ac Nord -->
            </xsl:call-template>
            
            <xsl:text>Carte 151 : Graphie de ange&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='angele')]"/>
                <!-- complètement cohérent ac picard -->
            </xsl:call-template>
            
            <xsl:text>Carte 153 : Graphie de angoisse&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='angoisse')]"/>
                <!-- = ardenne Nord -->
            </xsl:call-template>
            
            
            <xsl:text>Carte 164 : Graphie de ciel&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='ciel')]"/>
            </xsl:call-template>
            
            
            <xsl:text>Carte 170 : Graphie de Damnedeu&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='Damnedeu')]"/>
            </xsl:call-template>
            
            <xsl:text>Carte 174 : Graphie de duel&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='duel')]"/>
            </xsl:call-template>
            
            <xsl:text>Carte 176 : Graphie de diable&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='dïable')]"/>
                <!-- En contradiction avec un corpus du Nord de la France -->
            </xsl:call-template>
            
            <xsl:text>Carte 178 : Graphie de Dieu&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='dieu')]"/>
                <!-- En contradiction avec un corpus du Nord de la France -->
            </xsl:call-template>
            
            
            <xsl:text>Carte 183 : Graphie eglise&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='eglise')]"/>
                <!-- Ecarte le texte du Hainaut -->
            </xsl:call-template>
            
            <xsl:text>Carte 185 : Graphie enfant,enfes&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='enfant') and matches(@type, 'NOMB.=s\|GENRE=m\|CAS=n')]"/>
                <!-- Rapproche le texte de la wallonie; Hainaut, Ardenne -->
            </xsl:call-template>
            
            <xsl:text>Carte 187 : Graphie evesque&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='evesque')]"/>
                <!-- Ecarte le texte de l'artois, rapproche l'aisne -->
            </xsl:call-template>
            
            <xsl:text>Carte 199 : Graphie maisniee&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='maisniee')]"/>
            </xsl:call-template>
          
            
            <xsl:text>Carte 200 : Graphie mençogne&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='mençogne')]"/>
            </xsl:call-template>
            
    
       
            <xsl:text>Carte 232 : Graphie alternance ance, ence&#10;</xsl:text>
            <xsl:variable name="occ" select="count(//w[matches(text(), '(a|e)nce(s)?$')])"/>
            <xsl:variable name="ance" select="count(//w[matches(text(), 'ance(s)?$')])"/>
            <xsl:variable name="ence" select="count(//w[matches(text(), 'ence(s)?$')])"/>
            <xsl:text>nb occ.</xsl:text><xsl:value-of select="$occ"/> <xsl:text>&#10;</xsl:text>
            <xsl:text>nb ance.</xsl:text><xsl:value-of select="$ance"/><xsl:text>, </xsl:text><xsl:value-of select="($ance div $occ)*100"/><xsl:text>% </xsl:text> <xsl:text>&#10;</xsl:text>
            <xsl:text>nb ence.</xsl:text><xsl:value-of select="$ence"/><xsl:text>, </xsl:text><xsl:value-of select="($ence div $occ)*100"/><xsl:text>% </xsl:text> <xsl:text>&#10;</xsl:text>
            
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Diff occ.</xsl:text><xsl:value-of select="count(distinct-values(//w[matches(text(), '(a|e)nce(s)?$')]/@lemma))"/><xsl:text>&#10;</xsl:text>
           <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="//w[matches(text(), '(a|e)nce(s)?$')]" group-by="@lemma">
                <xsl:sort select="count(current-group())"/>
                <xsl:call-template name="occurrence">
                    <xsl:with-param name="condition" select="current-group()"/>
                </xsl:call-template>
            </xsl:for-each-group>
           
            
            <xsl:text>Carte 462-465 : Graphie plorer&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='plorer')]"/>
                <!-- Chiffre = Hainualt, nord, Aisne -->
            </xsl:call-template>
            
            <xsl:text>Carte 462-465 : Graphie ainçois&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='ainçois')]"/>
                <!-- Chiffre = Hainualt, nord, Aisne -->
            </xsl:call-template>
            
            <xsl:text>Carte 466 : Graphie ainsint/ainsi&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='ainsi')]"/>
                <!-- Chiffre = Aube -->
            </xsl:call-template>
            
            <xsl:text>Carte 479 : Graphie cheoir&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='chëoir') and matches(@type, 'VERinf')]"/>
                <!-- Chiffre = Nord -->
            </xsl:call-template>
            
            
            <xsl:text>Carte 479 : Graphie certes/ciertes&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='certes')]"/>
                <!-- Chiffre = Nord -->
            </xsl:call-template>
            
            <xsl:text>Carte 481 : Graphie come/com&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='come1')]"/>
                <!-- Chiffre = Nord -->
            </xsl:call-template>
            
            <xsl:text>Carte 488 / 487 : Graphie ensemle/ensemble&#10;</xsl:text>
            <xsl:call-template name="occurrence">
                <xsl:with-param name="condition" select="//w[(@lemma='ensemble')]"/>
            </xsl:call-template>
            
            
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template name="occurrence">
        <xsl:param name="condition" required="yes"/>
        <xsl:text>nb occ.</xsl:text><xsl:value-of select="count($condition)"/>
        <xsl:text>&#10;</xsl:text>
        <xsl:for-each-group select="$condition" group-by="lower-case(.)">
        <xsl:sort select="current-grouping-key()"/>
        <xsl:variable name="NbTotal" select="count($condition)"/>
        <xsl:variable name="NbOccurrences" select="count(current-group())"/>
        <xsl:value-of select="current-grouping-key()"/><xsl:text>&#09;</xsl:text>
        <xsl:value-of select="$NbOccurrences div $NbTotal * 100"/>
        <xsl:text>&#10;</xsl:text>
        </xsl:for-each-group>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>