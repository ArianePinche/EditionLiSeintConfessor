<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" 
    version="2.0">
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
   
       
      <xsl:template match="tei:teiCorpus">
          <xsl:for-each select="tei:TEI">
              <xsl:result-document href="../XML/vies/tokenise(replace(./base-uri(.), '.xml', ''), 'test', '.xml')">
                <xsl:apply-templates/>
              </xsl:result-document>
          </xsl:for-each>
          <!--  
        <xsl:if test="./@xml:id=replace(ancestor::tei:TEI/descendant::tei:text/descendant::tei:persName/@ref,'#','')">
            <xsl:copy-of select="ancestor::teiCorpus/teiHeade[1]/descendant::tei:person/@xml:id=./@xml:id"/>
        </xsl:if>
         -->          
    </xsl:template>
   
</xsl:stylesheet>