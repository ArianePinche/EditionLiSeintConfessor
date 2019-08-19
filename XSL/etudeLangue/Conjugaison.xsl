<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://fn.com"
    xmlns="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" version="2.0">
    
    <xsl:template match="/">
      <xsl:result-document href="../../resultats/Conjugaison.tsv">
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
          <xsl:variable name="deuxièmeGroupe" select="'^venir$|^dire$|^tenir1$|^öir$'"/>
          <xsl:variable name="troisièmeGroupe" select="'^repondre$|^metre2$|^entendre$|^croire$|^recevoir$|^soloir$|^vëoir$'"/>
          <xsl:variable name="Auxiliaires" select="'^estre1$|^avoir$'"/>
          <xsl:variable name="verbesirréguliers" select="'^savoir$|^pöoir$|^faire$|^aler$|^devoir$|^cuidier1|^voloir$'"/>
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Indicatif présent&#10;</xsl:text>
          <xsl:text>Premier groupe&#10;</xsl:text>
          
          <xsl:for-each-group select="//w[matches(@type, $indicatifPresent) and matches(@lemma, $premierGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Deuxième groupe&#10;</xsl:text>
          
          <xsl:for-each-group select="//w[matches(@type, $indicatifPresent) and matches(@lemma, $deuxièmeGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Troisième groupe&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $indicatifPresent) and matches(@lemma, $troisièmeGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les auxiliaires avoir et être&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $indicatifPresent) and matches(@lemma, $Auxiliaires)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les verbes irréguliers&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $indicatifPresent) and matches(@lemma, $verbesirréguliers)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
         
         
        
      <xsl:text>&#10;</xsl:text>
          <xsl:text>Subjonctif présent&#10;</xsl:text>
          <xsl:text>Premier groupe&#10;</xsl:text>
    
     <xsl:for-each-group select="//w[matches(@type, $subjonctifPresent) and matches(@lemma, $premierGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Deuxième groupe&#10;</xsl:text>
          
          <xsl:for-each-group select="//w[matches(@type, $subjonctifPresent) and matches(@lemma, $deuxièmeGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Troisième groupe&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $subjonctifPresent) and matches(@lemma, $troisièmeGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les auxiliaires avoir et être&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $subjonctifPresent) and matches(@lemma, $Auxiliaires)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les verbes irréguliers&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $subjonctifPresent) and matches(@lemma, $verbesirréguliers)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
  
          <xsl:text>&#10;</xsl:text>
            <xsl:text>Indicatif imparfait&#10;</xsl:text>
          <xsl:text>Premier groupe&#10;</xsl:text>
          
          <xsl:for-each-group select="//w[matches(@type, $indicatifImparfait) and matches(@lemma, $premierGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Deuxième groupe&#10;</xsl:text>
          
          <xsl:for-each-group select="//w[matches(@type, $indicatifImparfait) and matches(@lemma, $deuxièmeGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Troisième groupe&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $indicatifImparfait) and matches(@lemma, $troisièmeGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les auxiliaires avoir et être&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $indicatifImparfait) and matches(@lemma, $Auxiliaires)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les verbes irréguliers&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $indicatifImparfait) and matches(@lemma, $verbesirréguliers)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
         
         
        
      <xsl:text>&#10;</xsl:text>
          <xsl:text>Subjonctif imparfait&#10;</xsl:text>
          <xsl:text>Premier groupe&#10;</xsl:text>
    
     <xsl:for-each-group select="//w[matches(@type, $subjonctifImparfait) and matches(@lemma, $premierGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Deuxième groupe&#10;</xsl:text>
          
          <xsl:for-each-group select="//w[matches(@type, $subjonctifImparfait) and matches(@lemma, $deuxièmeGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Troisième groupe&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $subjonctifImparfait) and matches(@lemma, $troisièmeGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les auxiliaires avoir et être&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $subjonctifImparfait) and matches(@lemma, $Auxiliaires)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les verbes irréguliers&#10;</xsl:text>
          
          <xsl:for-each-group select="//w[matches(@type, $subjonctifImparfait) and matches(@lemma, $verbesirréguliers)]" group-by="@lemma">
                  <xsl:sort order="ascending" select="current-grouping-key()"/>
                  <xsl:text>&#10;</xsl:text>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text>&#10;</xsl:text>
                  <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                      <xsl:sort order="descending" select="count(current-group())"/>
                      <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                      <xsl:value-of select="current-grouping-key()"/>
                      <xsl:text> (</xsl:text>
                      <xsl:value-of select="count(current-group())"/>
                      <xsl:text>)</xsl:text>
                      <xsl:if test="position() != last()">, </xsl:if>
                      <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
                  </xsl:for-each-group>
                  <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                      <xsl:sort order="descending" select="count(current-group())"/>
                      <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                      <xsl:value-of select="current-grouping-key()"/>
                      <xsl:text> (</xsl:text>
                      <xsl:value-of select="count(current-group())"/>
                      <xsl:text>)</xsl:text>
                      <xsl:if test="position() != last()">, </xsl:if>
                      <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
                  </xsl:for-each-group> 
                  <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                      <xsl:sort order="descending" select="count(current-group())"/>
                      <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                      <xsl:value-of select="current-grouping-key()"/>
                      <xsl:text> (</xsl:text>
                      <xsl:value-of select="count(current-group())"/>
                      <xsl:text>)</xsl:text>
                      <xsl:if test="position() != last()">, </xsl:if>
                      <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
                  </xsl:for-each-group> 
                  <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                      <xsl:sort order="descending" select="count(current-group())"/>
                      <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                      <xsl:value-of select="current-grouping-key()"/>
                      <xsl:text> (</xsl:text>
                      <xsl:value-of select="count(current-group())"/>
                      <xsl:text>)</xsl:text>
                      <xsl:if test="position() != last()">, </xsl:if>
                      <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
                  </xsl:for-each-group> 
                  <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                      <xsl:sort order="descending" select="count(current-group())"/>
                      <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                      <xsl:value-of select="current-grouping-key()"/>
                      <xsl:text> (</xsl:text>
                      <xsl:value-of select="count(current-group())"/>
                      <xsl:text>)</xsl:text>
                      <xsl:if test="position() != last()">, </xsl:if>
                      <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
                  </xsl:for-each-group> 
                  <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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


      <xsl:text>&#10;</xsl:text>
          <xsl:text>Indicatif parfait&#10;</xsl:text>
          <xsl:text>Premier groupe&#10;</xsl:text>
    
     <xsl:for-each-group select="//w[matches(@type, $indicatifParfait) and matches(@lemma, $premierGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Deuxième groupe&#10;</xsl:text>
          
          <xsl:for-each-group select="//w[matches(@type, $indicatifParfait) and matches(@lemma, $deuxièmeGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Troisième groupe&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $indicatifParfait) and matches(@lemma, $troisièmeGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les auxiliaires avoir et être&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $indicatifParfait) and matches(@lemma, $Auxiliaires)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les verbes irréguliers&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $indicatifParfait) and matches(@lemma, $verbesirréguliers)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
    
      
          <xsl:text>&#10;</xsl:text>
          
           <xsl:text>&#10;</xsl:text>
          <xsl:text>Indicatif futur&#10;</xsl:text>
          <xsl:text>Premier groupe&#10;</xsl:text>
    
     <xsl:for-each-group select="//w[matches(@type, $indicatifFutur) and matches(@lemma, $premierGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Deuxième groupe&#10;</xsl:text>
          
          <xsl:for-each-group select="//w[matches(@type, $indicatifFutur) and matches(@lemma, $deuxièmeGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Troisième groupe&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $indicatifFutur) and matches(@lemma, $troisièmeGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les auxiliaires avoir et être&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $indicatifFutur) and matches(@lemma, $Auxiliaires)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les verbes irréguliers&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $indicatifFutur) and matches(@lemma, $verbesirréguliers)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
    
      
          <xsl:text>&#10;</xsl:text>
          
          
          <xsl:text>Conditionnel&#10;</xsl:text>
          <xsl:text>Premier groupe&#10;</xsl:text>
          
          <xsl:for-each-group select="//w[matches(@type, $conditionnel) and matches(@lemma, $premierGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Deuxième groupe&#10;</xsl:text>
          
          <xsl:for-each-group select="//w[matches(@type, $conditionnel) and matches(@lemma, $deuxièmeGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Troisième groupe&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $conditionnel) and matches(@lemma, $troisièmeGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les auxiliaires avoir et être&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $conditionnel) and matches(@lemma, $Auxiliaires)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les verbes irréguliers&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $conditionnel) and matches(@lemma, $verbesirréguliers)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P1)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P1&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P3)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P3&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P5&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P6)]" group-by='lower-case(.)'>
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
      
      
       <xsl:text>&#10;</xsl:text>
          <xsl:text>Impératif&#10;</xsl:text>
          <xsl:text>Premier groupe&#10;</xsl:text>
          
          <xsl:for-each-group select="//w[matches(@type, $imperatif) and matches(@lemma, $premierGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Deuxième groupe&#10;</xsl:text>
          
          <xsl:for-each-group select="//w[matches(@type, $imperatif) and matches(@lemma, $deuxièmeGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
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
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Troisième groupe&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $imperatif) and matches(@lemma, $troisièmeGroupe)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
            
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
         
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les auxiliaires avoir et être&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $imperatif) and matches(@lemma, $Auxiliaires)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
            
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
             
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
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
          
          <xsl:text>&#10;</xsl:text>
          <xsl:text>Les verbes irréguliers&#10;</xsl:text>
          <xsl:for-each-group select="//w[matches(@type, $imperatif) and matches(@lemma, $verbesirréguliers)]" group-by="@lemma">
              <xsl:sort order="ascending" select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
              <xsl:value-of select="current-grouping-key()"/>
              <xsl:text>&#10;</xsl:text>
            
              <xsl:for-each-group select="current-group()[matches(@type,$P2)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P2&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
         
              <xsl:for-each-group select="current-group()[matches(@type,$P4)]" group-by='lower-case(.)'>
                  <xsl:sort order="descending" select="count(current-group())"/>
                  <xsl:if test="position() = 1"><xsl:text>P4&#09;</xsl:text></xsl:if>
                  <xsl:value-of select="current-grouping-key()"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="count(current-group())"/>
                  <xsl:text>)</xsl:text>
                  <xsl:if test="position() != last()">, </xsl:if>
                  <xsl:if test="position() = last()"><xsl:text>&#10;</xsl:text></xsl:if>
              </xsl:for-each-group> 
              <xsl:for-each-group select="current-group()[matches(@type,$P5)]" group-by='lower-case(.)'>
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
      </xsl:result-document>          
   </xsl:template>
    
</xsl:stylesheet>