<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://fn.com"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    
    <!-- Personnes -->
    <xsl:variable name="P1" select="'PERS.=1\|NOMB.=s'"/>
    <xsl:variable name="P2" select="'PERS.=2\|NOMB.=s'"/>
    <xsl:variable name="P3" select="'PERS.=3\|NOMB.=s'"/>
    <xsl:variable name="P4" select="'PERS.=1\|NOMB.=p'"/>
    <xsl:variable name="P5" select="'PERS.=2\|NOMB.=p'"/>
    <xsl:variable name="P6" select="'PERS.=3\|NOMB.=p'"/>
    
    <!-- temps et mode -->
    <xsl:variable name="indicatifPresent" select="'MODE=ind\|TEMPS=pst\|'"/>
    <xsl:variable name="subjonctifPresent" select="'MODE=sub\|TEMPS=pst\|'"/>
    <xsl:variable name="indicatifImparfait" select="'MODE=ind\|TEMPS=ipf\|'"/>
    <xsl:variable name="subjonctifImparfait" select="'MODE=sub\|TEMPS=ipf\|'"/>
    <xsl:variable name="indicatifParfait" select="'MODE=ind\|TEMPS=psp\|'"/>
    <xsl:variable name="indicatifFutur" select="'MODE=ind\|TEMPS=fut\|'"/>
    <xsl:variable name="conditionnel" select="'MODE=con\|'"/>
    <xsl:variable name="imperatif" select="'MODE=imp\|'"/>
    
    <!-- groupe -->
    <xsl:variable name="premierGroupe" select="'^comencier$|^priier$|^comander$|^laissier$'"/>
    <xsl:variable name="deuxiemeGroupe" select="'^venir$|^dire$|^tenir1$|^öir$'"/>
    <xsl:variable name="troisiemeGroupe" select="'^repondre$|^metre2$|^entendre$|^croire$|^recevoir$|^soloir$|^vëoir$'"/>
    <xsl:variable name="Auxiliaires" select="'^estre1$|^avoir$'"/>
    <xsl:variable name="verbesirreguliers" select="'^savoir$|^pöoir$|^faire$|^aler$|^devoir$|^cuidier1|^voloir$'"/>
    
    <xsl:template name="conjugaison">
        <xsl:param name="temps"/>
        <xsl:param name="groupe"/>
        <!-- Pour chaque verbe à un temps donné et un groupe donné, classer toutes les formes graphiques en fonction des personnes -->
        <xsl:for-each-group select="//w[matches(@msd, $temps) and matches(@lemma, $groupe) and @pos='VERcjg']" group-by="@lemma">
            <xsl:sort order="ascending" select="current-grouping-key()"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:value-of select="current-grouping-key()"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@msd,$P1)]" group-by='lower-case(.)'>
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">, </xsl:if>
                <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
            </xsl:for-each-group>
            <xsl:for-each-group select="current-group()[matches(@msd,$P2)]" group-by='lower-case(.)'>
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">, </xsl:if>
                <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
            </xsl:for-each-group> 
            <xsl:for-each-group select="current-group()[matches(@msd,$P3)]" group-by='lower-case(.)'>
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">, </xsl:if>
                <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
            </xsl:for-each-group> 
            <xsl:for-each-group select="current-group()[matches(@msd,$P4)]" group-by='lower-case(.)'>
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">, </xsl:if>
                <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
            </xsl:for-each-group> 
            <xsl:for-each-group select="current-group()[matches(@msd,$P5)]" group-by='lower-case(.)'>
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">, </xsl:if>
                <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
            </xsl:for-each-group> 
            <xsl:for-each-group select="current-group()[matches(@msd,$P6)]" group-by='lower-case(.)'>
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:if test="position() = 1"><xsl:text>P6&#09;</xsl:text></xsl:if>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">, </xsl:if>
                <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
            </xsl:for-each-group> 
        </xsl:for-each-group>
    </xsl:template>
    <xsl:template name="imperatif">
        <xsl:param name="groupe"/>
        <xsl:for-each-group select="//w[matches(@msd, $imperatif) and matches(@lemma, $groupe)]" group-by="@lemma">
            <xsl:sort order="ascending" select="current-grouping-key()"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:value-of select="current-grouping-key()"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:for-each-group select="current-group()[matches(@msd,$P2)]" group-by='lower-case(.)'>
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">, </xsl:if>
                <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
            </xsl:for-each-group> 
            <xsl:for-each-group select="current-group()[matches(@msd,$P4)]" group-by='lower-case(.)'>
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">, </xsl:if>
                <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
            </xsl:for-each-group> 
            <xsl:for-each-group select="current-group()[matches(@msd,$P5)]" group-by='lower-case(.)'>
                <xsl:sort order="descending" select="count(current-group())"/>
                <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                <xsl:value-of select="current-grouping-key()"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of select="count(current-group())"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="position() != last()">, </xsl:if>
                <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
            </xsl:for-each-group> 
        </xsl:for-each-group>
    </xsl:template>
    
    <xsl:template match="/">
      <xsl:result-document href="../../resultats/Conjugaison.tsv">   
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Indicatif présent&#10;</xsl:text>
          <xsl:text>Premier groupe&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$premierGroupe"/>
              <xsl:with-param name="temps" select="$indicatifPresent"/>
          </xsl:call-template>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Deuxième groupe&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$deuxiemeGroupe"/>
              <xsl:with-param name="temps" select="$indicatifPresent"/>
          </xsl:call-template> 
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Troisième groupe&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$troisiemeGroupe"/>
              <xsl:with-param name="temps" select="$indicatifPresent"/>
          </xsl:call-template> 
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les auxiliaires avoir et être&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$Auxiliaires"/>
              <xsl:with-param name="temps" select="$indicatifPresent"/>
          </xsl:call-template> 
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les verbes irréguliers&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$verbesirreguliers"/>
              <xsl:with-param name="temps" select="$indicatifPresent"/>
          </xsl:call-template> 
          <xsl:text>&#10;</xsl:text>
          
          <xsl:text>Subjonctif présent&#10;</xsl:text>
          <xsl:text>Premier groupe&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$premierGroupe"/>
              <xsl:with-param name="temps" select="$subjonctifPresent"/>
          </xsl:call-template> 
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Deuxième groupe&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$deuxiemeGroupe"/>
              <xsl:with-param name="temps" select="$subjonctifPresent"/>
          </xsl:call-template> 
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Troisième groupe&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$troisiemeGroupe"/>
              <xsl:with-param name="temps" select="$subjonctifPresent"/>
          </xsl:call-template> 
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les auxiliaires avoir et être&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$Auxiliaires"/>
              <xsl:with-param name="temps" select="$subjonctifPresent"/>
          </xsl:call-template>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les verbes irréguliers&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$verbesirreguliers"/>
              <xsl:with-param name="temps" select="$subjonctifPresent"/>
          </xsl:call-template>
          <xsl:text>&#10;</xsl:text>
          
          <xsl:text>Indicatif imparfait&#10;</xsl:text>
          <xsl:text>Premier groupe&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$premierGroupe"/>
              <xsl:with-param name="temps" select="$indicatifImparfait"/>
          </xsl:call-template>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Deuxième groupe&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$deuxiemeGroupe"/>
              <xsl:with-param name="temps" select="$indicatifImparfait"/>
          </xsl:call-template>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Troisième groupe&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$troisiemeGroupe"/>
              <xsl:with-param name="temps" select="$indicatifImparfait"/>
          </xsl:call-template>
         <xsl:text>&#10;</xsl:text>
          <xsl:text>Les auxiliaires avoir et être&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$Auxiliaires"/>
              <xsl:with-param name="temps" select="$indicatifImparfait"/>
          </xsl:call-template>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les verbes irréguliers&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$Auxiliaires"/>
              <xsl:with-param name="temps" select="$verbesirreguliers"/>
          </xsl:call-template>
         <xsl:text>&#10;</xsl:text>
          
          <xsl:text>Subjonctif imparfait&#10;</xsl:text>
          <xsl:text>Premier groupe&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$premierGroupe"/>
              <xsl:with-param name="temps" select="$subjonctifImparfait"/>
          </xsl:call-template>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Deuxième groupe&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$deuxiemeGroupe"/>
              <xsl:with-param name="temps" select="$subjonctifImparfait"/>
          </xsl:call-template>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Troisième groupe&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$troisiemeGroupe"/>
              <xsl:with-param name="temps" select="$subjonctifImparfait"/>
          </xsl:call-template>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les auxiliaires avoir et être&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$Auxiliaires"/>
              <xsl:with-param name="temps" select="$subjonctifImparfait"/>
          </xsl:call-template>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les verbes irréguliers&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$verbesirreguliers"/>
              <xsl:with-param name="temps" select="$subjonctifImparfait"/>
          </xsl:call-template>
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Indicatif parfait&#10;</xsl:text>
          <xsl:text>Premier groupe&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$premierGroupe"/>
              <xsl:with-param name="temps" select="$indicatifParfait"/>
          </xsl:call-template>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Deuxième groupe&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$deuxiemeGroupe"/>
              <xsl:with-param name="temps" select="$indicatifParfait"/>
          </xsl:call-template>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Troisième groupe&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$troisiemeGroupe"/>
              <xsl:with-param name="temps" select="$indicatifParfait"/>
          </xsl:call-template>  
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les auxiliaires avoir et être&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$Auxiliaires"/>
              <xsl:with-param name="temps" select="$indicatifParfait"/>
          </xsl:call-template>  
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les verbes irréguliers&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$verbesirreguliers"/>
              <xsl:with-param name="temps" select="$indicatifParfait"/>
          </xsl:call-template>
          <xsl:text>&#10;</xsl:text>
          
           <xsl:text>&#10;</xsl:text>
          <xsl:text>Indicatif futur&#10;</xsl:text>
          <xsl:text>Premier groupe&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$premierGroupe"/>
              <xsl:with-param name="temps" select="$indicatifFutur"/>
          </xsl:call-template>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Deuxième groupe&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$deuxiemeGroupe"/>
              <xsl:with-param name="temps" select="$indicatifFutur"/>
          </xsl:call-template>
           <xsl:text>&#10;</xsl:text>
          <xsl:text>Troisième groupe&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$troisiemeGroupe"/>
              <xsl:with-param name="temps" select="$indicatifFutur"/>
          </xsl:call-template>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les auxiliaires avoir et être&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$Auxiliaires"/>
              <xsl:with-param name="temps" select="$indicatifFutur"/>
          </xsl:call-template>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les verbes irréguliers&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$verbesirreguliers"/>
              <xsl:with-param name="temps" select="$indicatifFutur"/>
          </xsl:call-template>
          <xsl:text>&#10;</xsl:text>
             
          <xsl:text>Conditionnel&#10;</xsl:text>
          <xsl:text>Premier groupe&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$premierGroupe"/>
              <xsl:with-param name="temps" select="$conditionnel"/>
          </xsl:call-template>
           <xsl:text>&#10;</xsl:text>
          <xsl:text>Deuxième groupe&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$deuxiemeGroupe"/>
              <xsl:with-param name="temps" select="$conditionnel"/>
          </xsl:call-template>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Troisième groupe&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$troisiemeGroupe"/>
              <xsl:with-param name="temps" select="$conditionnel"/>
          </xsl:call-template>
         <xsl:text>&#10;</xsl:text>
          <xsl:text>Les auxiliaires avoir et être&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$Auxiliaires"/>
              <xsl:with-param name="temps" select="$conditionnel"/>
          </xsl:call-template>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les verbes irréguliers&#10;</xsl:text>
          <xsl:call-template name="conjugaison">
              <xsl:with-param name="groupe" select="$verbesirreguliers"/>
              <xsl:with-param name="temps" select="$conditionnel"/>
          </xsl:call-template>
         <xsl:text>&#10;</xsl:text>
          <xsl:text>Impératif&#10;</xsl:text>
          <xsl:text>Premier groupe&#10;</xsl:text>
          <xsl:call-template name="imperatif">
              <xsl:with-param name="groupe" select="$premierGroupe"/>
          </xsl:call-template>
         <xsl:text>&#10;</xsl:text>
          <xsl:text>Deuxième groupe&#10;</xsl:text> 
          <xsl:call-template name="imperatif">
              <xsl:with-param name="groupe" select="$deuxiemeGroupe"/>
          </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
          <xsl:text>Troisième groupe&#10;</xsl:text>
          <xsl:call-template name="imperatif">
              <xsl:with-param name="groupe" select="$troisiemeGroupe"/>
          </xsl:call-template>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les auxiliaires avoir et être&#10;</xsl:text>
          <xsl:call-template name="imperatif">
              <xsl:with-param name="groupe" select="$Auxiliaires"/>
          </xsl:call-template>
         <xsl:text>&#10;</xsl:text>
          <xsl:text>Les verbes irréguliers&#10;</xsl:text>
          <xsl:call-template name="imperatif">
              <xsl:with-param name="groupe" select="$verbesirreguliers"/>
          </xsl:call-template>
          </xsl:result-document>          
   </xsl:template>
    
</xsl:stylesheet>