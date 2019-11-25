<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://fn.com"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="text" encoding="UTF-8"/>
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
      <xsl:result-document href="../../resultats/Morphologie4_Conjugaison.tsv">   
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
          <xsl:text>&#10;</xsl:text>
          <!-- Repérer tous les verbes à la P1 avec un ç à la fin -->
          
          <!-- Repérer tous les verbes à la P1 avec un ç à la fin -->
          <xsl:text>P1 en ç à l'indicatif présent</xsl:text><xsl:text>&#09;</xsl:text>
          <xsl:value-of select="count(//w[@pos='VERcjg' and matches(@msd, $P1) and matches(@msd, $indicatifPresent)])"/>
          <xsl:text>&#10;</xsl:text>
          <xsl:for-each-group select="//w[@pos='VERcjg' and matches(@msd, $P1) and matches(@msd, $indicatifPresent) and ends-with(text(), 'ç') ]" group-by="@lemma">
              <xsl:variable name="lemma" select="current-grouping-key()"/>
              <xsl:value-of select="$lemma"/><xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()" group-by=".">
                  <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  <xsl:for-each-group select="//w[@lemma=$lemma and matches(@msd, $P1) and matches(@msd, $indicatifPresent) and not(ends-with(text(), 'ç'))]" group-by='.'>
                      <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  </xsl:for-each-group>    
                  <xsl:text>&#10;</xsl:text>
                  <xsl:text>&#10;</xsl:text>
              </xsl:for-each-group>
              <xsl:text>&#10;</xsl:text>
          </xsl:for-each-group>
          <xsl:text>ç autre que P1</xsl:text>
          <xsl:for-each-group select="//w[@pos='VERcjg' and not(matches(@msd, $P1)) and matches(@msd, $indicatifPresent) and ends-with(text(), 'ç') ]" group-by="@lemma">
              <xsl:variable name="lemma" select="current-grouping-key()"/>
              <xsl:value-of select="$lemma"/><xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()" group-by=".">
                  <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/>
                  <xsl:text>&#10;</xsl:text>
              </xsl:for-each-group>
          </xsl:for-each-group>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>P1 en ç à l'indicatif parfait</xsl:text><xsl:text>&#09;</xsl:text>
          <xsl:value-of select="count(//w[@pos='VERcjg' and matches(@msd, $P1) and matches(@msd, $indicatifParfait)])"/>
          <xsl:text>&#10;</xsl:text>
          <xsl:for-each-group select="//w[@pos='VERcjg' and matches(@msd, $P1) and matches(@msd, $indicatifParfait)  and ends-with(text(), 'ç') ]" group-by="@lemma">
              <xsl:variable name="lemma" select="current-grouping-key()"/>
              <xsl:value-of select="$lemma"/><xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()" group-by=".">
                  <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  <xsl:for-each-group select="//w[@lemma=$lemma and matches(@msd, $P1) and matches(@msd, $indicatifParfait) and not(ends-with(text(), 'ç'))]" group-by='.'>
                      <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  </xsl:for-each-group>    
                  <xsl:text>&#10;</xsl:text>
                  <xsl:text>&#10;</xsl:text>
              </xsl:for-each-group>
              <xsl:text>&#10;</xsl:text>
          </xsl:for-each-group>
          <xsl:text>ç autre que P1</xsl:text>
          <xsl:for-each-group select="//w[@pos='VERcjg' and not(matches(@msd, $P1)) and matches(@msd, $indicatifParfait) and ends-with(text(), 'ç') ]" group-by="@lemma">
              <xsl:variable name="lemma" select="current-grouping-key()"/>
              <xsl:value-of select="$lemma"/><xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()" group-by=".">
                  <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/>
                  <xsl:text>&#10;</xsl:text>
              </xsl:for-each-group>
          </xsl:for-each-group>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>&#10;</xsl:text>
          <!-- futur indicatif P1 en -é -->
          <xsl:text>futur indicatif P1 en -é</xsl:text><xsl:text>&#10;</xsl:text>
          <xsl:text>formes en -é :</xsl:text><xsl:value-of select="count(//w[matches(@msd, $P1) and matches(@msd, $indicatifFutur)  and ends-with(text(), 'é')])"/><xsl:text>&#09;</xsl:text>
          <xsl:text>formes en -ai :</xsl:text><xsl:value-of select="count(//w[matches(@msd, $P1) and matches(@msd, $indicatifFutur)  and ends-with(text(), 'ai')])"/>
          <xsl:text>&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@msd, $indicatifFutur) and matches(@msd, $P1) and ends-with(text(), 'é')]" group-by="@lemma">
              <xsl:variable name="lemma" select="current-grouping-key()"/>
              <xsl:value-of select="$lemma"/><xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()" group-by=".">
                  <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  <xsl:for-each-group select="//w[@lemma=$lemma and matches(@msd, $indicatifFutur) and matches(@msd, $P1) and not(ends-with(text(), 'é'))]" group-by='.'>
                      <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  </xsl:for-each-group>    
                  <xsl:text>&#10;</xsl:text>
                  <xsl:text>&#10;</xsl:text>
              </xsl:for-each-group>
              <xsl:text>&#10;</xsl:text>
          </xsl:for-each-group>
          <xsl:text>parfait indicatif P1 en -é</xsl:text><xsl:text>&#10;</xsl:text>
          <xsl:text>formes en -é :</xsl:text><xsl:value-of select="count(//w[matches(@msd, $P1) and matches(@msd, $indicatifParfait)  and ends-with(text(), 'é')])"/><xsl:text>&#09;</xsl:text>
          <xsl:text>formes en -ai :</xsl:text><xsl:value-of select="count(//w[matches(@msd, $P1) and matches(@msd, $indicatifParfait)  and ends-with(text(), 'ai')])"/><xsl:text>&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@msd, $indicatifParfait) and matches(@msd, $P1) and ends-with(text(), 'é')]" group-by="@lemma">
              <xsl:variable name="lemma" select="current-grouping-key()"/>
              <xsl:value-of select="$lemma"/><xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()" group-by=".">
                  <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  <xsl:for-each-group select="//w[@lemma=$lemma and matches(@msd, $indicatifParfait) and matches(@msd, $P1) and not(ends-with(text(), 'é'))]" group-by='.'>
                      <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  </xsl:for-each-group>    
                  <xsl:text>&#10;</xsl:text>
                  <xsl:text>&#10;</xsl:text>
              </xsl:for-each-group>
              <xsl:text>&#10;</xsl:text>
          </xsl:for-each-group>
          <!-- Absence de -t, P3 indicatif pst et parfait -->
          <xsl:text>Absence de -t, P3 indicatif pst</xsl:text><xsl:text>&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@msd, $indicatifPresent) and matches(@msd, $P3) and not(ends-with(text(), 't')) and not(matches(@lemma, 'er[\d]?$'))]" group-by="@lemma">
              <xsl:variable name="lemma" select="current-grouping-key()"/>
              <xsl:value-of select="$lemma"/><xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()" group-by=".">
                  <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  <xsl:for-each-group select="//w[@lemma=$lemma and matches(@msd, $indicatifPresent) and matches(@msd, $P3) and ends-with(text(), 't')]" group-by='.'>
                      <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  </xsl:for-each-group>    
                  <xsl:text>&#10;</xsl:text>
                  <xsl:text>&#10;</xsl:text>
              </xsl:for-each-group>
              <xsl:text>&#10;</xsl:text>
          </xsl:for-each-group>
          <xsl:text>Absence de -t, P3 indicatif parfait</xsl:text><xsl:text>&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@msd, $indicatifParfait) and matches(@msd, $P3) and not(ends-with(text(), 't')) and not(matches(@lemma, 'er[\d]?$'))]" group-by="@lemma">
              <xsl:variable name="lemma" select="current-grouping-key()"/>
              <xsl:value-of select="$lemma"/><xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()" group-by=".">
                  <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  <xsl:for-each-group select="//w[@lemma=$lemma and matches(@msd, $indicatifParfait) and matches(@msd, $P3) and ends-with(text(), 't')]" group-by='.'>
                      <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  </xsl:for-each-group>    
                  <xsl:text>&#10;</xsl:text>
                  <xsl:text>&#10;</xsl:text>
              </xsl:for-each-group>
              <xsl:text>&#10;</xsl:text>
          </xsl:for-each-group>
          <xsl:text>Présence de -t, P3 indicatif parfait</xsl:text><xsl:text>&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@msd, $indicatifParfait) and matches(@msd, $P3) and ends-with(text(), 't')]" group-by="@lemma">
              <xsl:variable name="lemma" select="current-grouping-key()"/>
              <xsl:value-of select="$lemma"/><xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()" group-by=".">
                  <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  <xsl:for-each-group select="//w[@lemma=$lemma and matches(@msd, $indicatifParfait) and matches(@msd, $P3) and not(ends-with(text(), 't'))]" group-by='.'>
                      <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  </xsl:for-each-group>    
                  <xsl:text>&#10;</xsl:text>
                  <xsl:text>&#10;</xsl:text>
              </xsl:for-each-group>
              <xsl:text>&#10;</xsl:text>
          </xsl:for-each-group>
          <!-- Première personne du pluriel (Gossen §78)-->
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Première personne du pluriel en omes</xsl:text><xsl:text>&#10;</xsl:text>
          <xsl:text>formes en -omes :</xsl:text><xsl:value-of select="count(//w[matches(@msd, $P4) and matches(@msd, $indicatifPresent)  and ends-with(text(), 'omes')])"/><xsl:text>&#09;</xsl:text>
          <xsl:text>formes en -ons :</xsl:text><xsl:value-of select="count(//w[matches(@msd, $P4) and matches(@msd, $indicatifPresent)  and ends-with(text(), 'ons')])"/><xsl:text>&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@msd, $P4) and matches(text(), 'omes')]" group-by="@lemma">
              <xsl:variable name="lemma" select="current-grouping-key()"/>
              <xsl:value-of select="$lemma"/><xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()" group-by=".">
                  <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  <xsl:for-each-group select="//w[@lemma=$lemma and matches(@msd, $P4) and not(matches(text(), 'omes'))]" group-by='.'>
                      <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  </xsl:for-each-group>    
                  <xsl:text>&#10;</xsl:text>
                  <xsl:text>&#10;</xsl:text>
              </xsl:for-each-group>
              <xsl:text>&#10;</xsl:text>
          </xsl:for-each-group>
          <xsl:text>Première personne du pluriel en om</xsl:text>
          <xsl:for-each-group select="//w[matches(@msd, $P4) and ends-with(text(), 'om')]" group-by="@lemma">
              <xsl:variable name="lemma" select="current-grouping-key()"/>
              <xsl:value-of select="$lemma"/><xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()" group-by=".">
                  <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  <xsl:for-each-group select="//w[@lemma=$lemma and matches(@msd, $P4) and not(ends-with(text(), 'om'))]" group-by='.'>
                      <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  </xsl:for-each-group>    
                  <xsl:text>&#10;</xsl:text>
                  <xsl:text>&#10;</xsl:text>
              </xsl:for-each-group>
              <xsl:text>&#10;</xsl:text>
          </xsl:for-each-group>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Deuxième personne du pluriel en és</xsl:text><xsl:text>&#10;</xsl:text>
          <xsl:text>formes en -és :</xsl:text><xsl:value-of select="count(//w[matches(@msd, $P5) and (matches(@msd, 'MODE=ind\|TEMPS=pst') or matches(@msd, 'imp')) and ends-with(text(), 'és')])"/><xsl:text>&#09;</xsl:text>
          <xsl:text>formes en -ez :</xsl:text><xsl:value-of select="count(//w[matches(@msd, $P5) and (matches(@msd, 'MODE=ind\|TEMPS=pst') or matches(@msd, 'imp')) and ends-with(text(), 'ez')])"/>
          <xsl:text>&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@msd, $P5) and ends-with(text(), 'és')]" group-by="@lemma">
              <xsl:variable name="lemma" select="current-grouping-key()"/>
              <xsl:value-of select="$lemma"/><xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()" group-by=".">
                  <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  <xsl:for-each-group select="//w[@lemma=$lemma and matches(@msd, $P5) and not(ends-with(text(), 'és'))]" group-by='.'>
                      <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  </xsl:for-each-group>    
                  <xsl:text>&#10;</xsl:text>
                  <xsl:text>&#10;</xsl:text>
              </xsl:for-each-group>
              <xsl:text>&#10;</xsl:text>
          </xsl:for-each-group>
          <xsl:text>&#10;</xsl:text>
          <xsl:text>deuxième personne du pluriel en oiz</xsl:text><xsl:text>&#10;</xsl:text>
          <xsl:text>formes en -oiz :</xsl:text><xsl:value-of select="count(//w[matches(@msd, $P5) and matches(@msd, 'fut') and ends-with(text(), 'oiz')])"/><xsl:text>&#09;</xsl:text>
          <xsl:text>formes en -ez :</xsl:text><xsl:value-of select="count(//w[matches(@msd, $P5) and matches(@msd, 'fut') and ends-with(text(), 'ez')])"/>
          <xsl:text>&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@msd, $P5) and matches(@msd, 'fut') and ends-with(text(), 'oiz')]" group-by="@lemma">
              <xsl:variable name="lemma" select="current-grouping-key()"/>
              <xsl:value-of select="$lemma"/><xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()" group-by=".">
                  <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  <xsl:for-each-group select="//w[@lemma=$lemma and matches(@msd, $P5) and matches(@msd, 'fut') and not(ends-with(text(), 'oiz'))]" group-by='.'>
                      <xsl:value-of select="."/><xsl:text>&#09;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#10;</xsl:text>
                  </xsl:for-each-group>    
                  <xsl:text>&#10;</xsl:text>
                  <xsl:text>&#10;</xsl:text>
              </xsl:for-each-group>
              <xsl:text>&#10;</xsl:text>
          </xsl:for-each-group>
          </xsl:result-document>          
   </xsl:template>
    
</xsl:stylesheet>