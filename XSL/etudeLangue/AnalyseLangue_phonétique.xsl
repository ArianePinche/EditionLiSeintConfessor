<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:result-document href="../analyseCorpus.txt">
            
          
          <!-- Alternance graphique c/che -->

            <!-- règle sur le pronom ce -->
            <xsl:if test="descendant::w/@lemma = 'ce1'">
                <xsl:text>&#10;</xsl:text>
                <xsl:text>ce</xsl:text>(<xsl:value-of select="count(descendant::w[@lemma = 'ce1'])"
                />): <xsl:for-each-group select="descendant::w[@lemma = 'ce1']"
                    group-by="lower-case(.)">
                    <xsl:text>&#10;</xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="."/>
                    <xsl:text>&#10;</xsl:text>
                </xsl:for-each-group>
            </xsl:if>
            <xsl:text>&#10;</xsl:text>

            <!-- Graphie du pronom de P1 -->
            <xsl:if test="descendant::w/@type = 'POS=PROper|PERS.=1|NOMB.=s|GENRE=m|CAS=n'">
                <xsl:text>&#10;</xsl:text>
                <xsl:text>Je</xsl:text>(<xsl:value-of
                    select="count(descendant::w[@type = 'POS=PROper|PERS.=1|NOMB.=s|GENRE=m|CAS=n'])"
                />): <xsl:for-each-group
                    select="descendant::w[@type = 'POS=PROper|PERS.=1|NOMB.=s|GENRE=m|CAS=n']"
                    group-by="lower-case(.)">
                    <xsl:value-of select="@lemma"/><xsl:text>&#10;</xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="."/>
                    <xsl:text>&#10;</xsl:text>
                </xsl:for-each-group>
            </xsl:if>
            <xsl:text>&#10;</xsl:text>

            <xsl:text> Graphie de la négation nient (pourcentage // a wallonie (53))</xsl:text>
            <xsl:if test="descendant::w/@lemma = 'nïent'">
                <xsl:text>&#10;</xsl:text>
                <xsl:text>Nient</xsl:text>(<xsl:value-of
                    select="count(descendant::w[@lemma = 'nïent'])"/>): <xsl:for-each-group
                    select="descendant::w[@lemma = 'nïent']" group-by="lower-case(.)">
                    <xsl:value-of select="@lemma"/><xsl:text>&#10;</xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="."/>
                    <xsl:text>&#10;</xsl:text>
                </xsl:for-each-group>
            </xsl:if>
            <xsl:text>&#10;</xsl:text>

            <xsl:if test="descendant::w/@lemma = 'plusor'">
                <xsl:text>&#10;</xsl:text>
                <xsl:text>Plusor</xsl:text>(<xsl:value-of
                    select="count(descendant::w[@lemma = 'plusor'])"/>): <xsl:for-each-group
                    select="descendant::w[@lemma = 'plusor']" group-by="lower-case(.)">
                    <xsl:value-of select="@lemma"/><xsl:text>&#10;</xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="."/>
                    <xsl:text>&#10;</xsl:text>
                </xsl:for-each-group>
            </xsl:if>
            <xsl:text>&#10;</xsl:text>

            <xsl:if test="descendant::w/@lemma = 'tot'">
                <xsl:text>&#10;</xsl:text>
                <xsl:text>tot</xsl:text>(<xsl:value-of select="count(descendant::w[@lemma = 'tot'])"/>):<!-- on tombe sur les valeurs pas de Calais -->
                <xsl:for-each-group select="descendant::w[@lemma = 'tot']" group-by="lower-case(.)">
                    <xsl:sort order="ascending"/>
                    <xsl:value-of select="@lemma"/>(<xsl:value-of select="count(current-group())"/>)<xsl:text>&#10;</xsl:text>
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:text>,</xsl:text>
                    <xsl:value-of select="."/>
                    <xsl:text>&#10;</xsl:text>
                </xsl:for-each-group>
            </xsl:if>
            <xsl:text>&#10;</xsl:text>

            <xsl:text> c à l'initial</xsl:text>
            <xsl:text> c+e (</xsl:text>
            <xsl:value-of select="count(descendant::w[starts-with(@lemma, 'ce')])"/>    
           <xsl:text>) &#10;</xsl:text>
            
           
            <xsl:text> initiale en ce/che </xsl:text>
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'ce')]" group-by="starts-with(lower-case(.), 'ch')">
                <xsl:sort order="ascending"/>
               <xsl:value-of select="count(current-group())"/><xsl:value-of select="."/><xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'ce')]" group-by="@lemma">
                <xsl:sort order="ascending"/>
                <xsl:if test="starts-with(., 'ch')">
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:value-of select="."/><xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            
            <xsl:text> initiale en c </xsl:text>
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'ce')]" group-by="not(starts-with(lower-case(.), 'ch'))">
                <xsl:sort order="ascending"/>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text> c &#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'ce')]" group-by="@lemma">
                <xsl:sort order="ascending"/>
                <xsl:if test="not(starts-with(., 'ch'))">
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:value-of select="."/><xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            
        

            <xsl:text>&#10;</xsl:text>
            <xsl:text>che/ce à l'initial / attention ne prend pas cascun (une occurence)</xsl:text>
       
            <xsl:value-of select="count(descendant::w[starts-with(@lemma, 'che')])"/>    
            <xsl:text>) &#10;</xsl:text>

            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'che')]" group-by="starts-with(lower-case(.), 'ce')">
                <xsl:sort order="ascending"/>
                <xsl:value-of select="count(current-group())"/><xsl:value-of select="."/><xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'che')]" group-by="@lemma">
                <xsl:sort order="ascending"/>
                <xsl:if test="starts-with(., 'ce')">
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:value-of select="."/><xsl:text>, </xsl:text>
                </xsl:if>
                    </xsl:for-each-group>
            
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'che')]" group-by="not(starts-with(lower-case(.), 'ce'))">    <xsl:sort order="ascending"/>
                <xsl:value-of select="count(current-group())"/><xsl:value-of select="."/><xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'che')]" group-by="@lemma">
                <xsl:sort order="ascending"/>
                <xsl:if test="starts-with(., 'che')">
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:value-of select="."/><xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            
            <xsl:text>&#10;</xsl:text>
            <xsl:text>cha/ca à l'initial / attention ne prend pas cascun (une occurence)</xsl:text>
            
            <xsl:value-of select="count(descendant::w[starts-with(@lemma, 'cha')])"/>    
            <xsl:text>) &#10;</xsl:text>
            
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'cha')]" group-by="not(starts-with(lower-case(.), 'ch'))">
                <xsl:sort order="ascending"/>
                <xsl:value-of select="count(current-group())"/><xsl:value-of select="."/><xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'cha')]" group-by="@lemma">
                <xsl:sort order="ascending"/>
                <xsl:if test="not(starts-with(lower-case(.), 'ch'))">
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:value-of select="."/><xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'cha')]" group-by="not(starts-with(lower-case(.), 'ca'))">    <xsl:sort order="ascending"/>
                <xsl:value-of select="count(current-group())"/><xsl:value-of select="."/><xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'cha')]" group-by="@lemma">
                <xsl:sort order="ascending"/>
                <xsl:if test="starts-with(., 'cha')">
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:value-of select="."/><xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            
            <xsl:text>&#10;</xsl:text>
            <xsl:text>ca/cha à l'initial / attention ne prend pas cascun (une occurence)</xsl:text>
            
            <xsl:value-of select="count(descendant::w[starts-with(@lemma, 'ca')])"/>    
            <xsl:text>) &#10;</xsl:text>
            
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'ca')]" group-by="starts-with(lower-case(.), 'cha')">
                <xsl:sort order="ascending"/>
                <xsl:value-of select="count(current-group())"/><xsl:value-of select="."/><xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'ca')]" group-by="@lemma">
                <xsl:sort order="ascending"/>
                <xsl:if test="starts-with(., 'cha')">
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:value-of select="."/><xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'ca')]" group-by="not(starts-with(lower-case(.), 'ca'))">    <xsl:sort order="ascending"/>
                <xsl:value-of select="count(current-group())"/><xsl:value-of select="."/><xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'ca')]" group-by="@lemma">
                <xsl:sort order="ascending"/>
                <xsl:if test="starts-with(., 'ca')">
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:value-of select="."/><xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            
           
           
            <xsl:text>&#10;</xsl:text>
            <xsl:text>ci à l'initial / attention ne prend pas cascun (une occurence)</xsl:text>
            
            <xsl:value-of select="count(descendant::w[starts-with(@lemma, 'ci')])"/>    
            <xsl:text>) &#10;</xsl:text>
            
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'ci')]" group-by="starts-with(lower-case(.), 'chi')">
                <xsl:sort order="ascending"/>
                <xsl:value-of select="count(current-group())"/><xsl:value-of select="."/><xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'ci')]" group-by="@lemma">
                <xsl:sort order="ascending"/>
                <xsl:if test="starts-with(., 'chi')">
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:value-of select="."/><xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'ci')]" group-by="not(starts-with(lower-case(.), 'ci'))">    <xsl:sort order="ascending"/>
                <xsl:value-of select="count(current-group())"/><xsl:value-of select="."/><xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'ci')]" group-by="@lemma">
                <xsl:sort order="ascending"/>
                <xsl:if test="starts-with(., 'ci')">
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:value-of select="."/><xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            
            <xsl:text>&#10;</xsl:text>
            <xsl:text>chi/ci à l'initial / attention ne prend pas cascun (une occurence)</xsl:text>
            
            <xsl:value-of select="count(descendant::w[starts-with(@lemma, 'chi')])"/>    
            <xsl:text>) &#10;</xsl:text>
            
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'chi')]" group-by="starts-with(lower-case(.), 'ci')">
                <xsl:sort order="ascending"/>
                <xsl:value-of select="count(current-group())"/><xsl:value-of select="."/><xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'chi')]" group-by="@lemma">
                <xsl:sort order="ascending"/>
                <xsl:if test="starts-with(., 'ci')">
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:value-of select="."/><xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'chi')]" group-by="not(starts-with(lower-case(.), 'ci'))">    <xsl:sort order="ascending"/>
                <xsl:value-of select="count(current-group())"/><xsl:value-of select="."/><xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:for-each-group select="descendant::w[starts-with(@lemma, 'chi')]" group-by="@lemma">
                <xsl:sort order="ascending"/>
                <xsl:if test="starts-with(., 'chi')">
                    <xsl:value-of select="count(current-group())"/>
                    <xsl:value-of select="."/><xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
                

            <xsl:text>&#10;</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Nombre de le pour la au cas régime féminin sing</xsl:text>
            <xsl:for-each-group
                select="descendant::w[@type = 'POS=PROper|PERS.=3|NOMB.=s|GENRE=f|CAS=r']"
                group-by=".">
                <xsl:sort order="ascending"/>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>,</xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>


           
            <xsl:text>PPF  avec auxiliaire être </xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:value-of select="count(descendant::w[@type ='POS=VERppe|NOMB.=s|GENRE=f|CAS=n'])"/>
            <xsl:text>ie</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="descendant::w[@type ='POS=VERppe|NOMB.=s|GENRE=f|CAS=n']" group-by="ends-with(., 'ie')">
                <xsl:value-of select="count(current-group())"/><xsl:text>:</xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:for-each-group select="descendant::w[@type ='POS=VERppe|NOMB.=s|GENRE=f|CAS=n']" group-by=".">
                <xsl:sort order="ascending"/>
                <xsl:if test="ends-with(.,'ie')">
                    <xsl:value-of select="."/><xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            
            <xsl:text>iee</xsl:text>
            <xsl:for-each-group select="descendant::w[@type ='POS=VERppe|NOMB.=s|GENRE=f|CAS=n']" group-by="ends-with(., 'iee')">
           <xsl:text>&#10;</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>&#10;</xsl:text>
                <xsl:value-of select="."/><xsl:text>, </xsl:text>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
            <xsl:for-each-group select="descendant::w[@type ='POS=VERppe|NOMB.=s|GENRE=f|CAS=n']" group-by=".">
                <xsl:if test="ends-with(.,'iee')">
                    <xsl:value-of select="."/><xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Autre</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="descendant::w[@type ='POS=VERppe|NOMB.=s|GENRE=f|CAS=n']" group-by=".">
                <xsl:sort order="ascending"/>
                <xsl:if test="not(ends-with(.,'iee')) and not(ends-with(.,'ie'))">
                    <xsl:value-of select="."/><xsl:text>, </xsl:text>
                </xsl:if>
            </xsl:for-each-group>
            
                
         
            
        

            <xsl:text>&#10;</xsl:text>
            <xsl:text>Nombre de le pour la au cas régime féminin sing</xsl:text>
            <xsl:for-each-group
                select="descendant::w[@type = 'POS=PROper|PERS.=3|NOMB.=s|GENRE=f|CAS=r']"
                group-by=".">
                <xsl:sort order="ascending"/>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>,</xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each-group>
        </xsl:result-document>

    </xsl:template>






</xsl:stylesheet>
