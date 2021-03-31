<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" version="3.0" xmlns:my="LOCALHOST">
    <xsl:strip-space elements="*" />

    <xsl:function name="my:no-accent">
        <xsl:param name="string"/>
        <xsl:value-of select="translate($string, 'áàâäéèêëíìîïóòôöúùûü', 'aaaaeeeeiiiioooouuuu')"/>
    </xsl:function>

    <xsl:function name="my:regularizeName">
        <xsl:param name="node"/>
        <xsl:variable name="var"
            select="$node/(text() | tei:hi/text() | .//tei:reg/text() | .//tei:expan/text() | .//tei:ex/text() | .//tei:pc[@type = 'reg' and not(text() = '-')])"/>
        <xsl:value-of
            select="
                normalize-space(
                replace(
                replace(
                string-join($var),
                '&#160;',
                ' ')
                , '^\s*[sS][ae]in[tze]{0,2}s?',
                ''
                )
                )"
        />
    </xsl:function>
    <xsl:function name="my:regularizePlace">
        <xsl:param name="node"/>
        <xsl:variable name="var"
            select="$node/(text() | tei:hi/text() | .//tei:reg/text() | .//tei:expan/text() | .//tei:ex/text() | .//tei:pc[@type = 'reg' and not(text() = '-')])"/>
        <xsl:value-of
            select="
                normalize-space(
                replace(
                string-join($var),
                '&#160;',
                ' '
                )
                )"
        />
    </xsl:function>
    
    <xsl:output method="html" indent="yes" omit-xml-declaration="yes" name="html"/>

    <xsl:template match="tei:TEI">
        <xsl:variable name="witfile">
            <xsl:value-of select="tokenize(replace(base-uri(.), '.xml', ''), '/')[last()]"/>
            <!-- récupération du nom du fichier courant -->
        </xsl:variable>
        <xsl:result-document
            href="{concat('/Users/arianepinche/Dropbox/transcription/html/',$witfile,'.html')}"
            method="html" indent="yes">
            <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
            <xsl:variable name="adresse">
                <xsl:value-of select="tokenize(tei:body/@n, ':')[last()]"/>
                <!-- récupération dans l'uri uniquement du nom du document -->
            </xsl:variable>

            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                    <title>
                        <xsl:value-of select="tei:title"/>
                    </title>
                    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
                    <link rel="stylesheet" type="text/css" href="../css/theme.css"/>
                    <script src="../js/jquery.min.js"/>
                    <script src="../js/bootstrap.min.js"/>
                    <script src="../js/normalisation.js"/>
                    <script src="../js/jquery.apparatus.min.js"/>
                    <script type="text/javascript">
                    /* activation des légendes */
                    $(document).ready(function() {
                        $(".activation").apparatus({"target": ".linkapp"});
                    });
                    </script>
                </head>
                <body>
                    <div class="Notice">
                        <ul class="nav nav-tabs">

                           

                            <li role="presentation" class="active">
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="concat($witfile, '.html')"/>
                                    </xsl:attribute> Edition </xsl:element>
                            </li>



                        </ul>

                        <div class="tab-content">
                            <xsl:apply-templates select=".//tei:body"/>
                        </div>

                    </div>
                    <hr/>
                </body>
            </html>

        </xsl:result-document>

    </xsl:template>

    <xsl:template match="tei:body">

        <article id="text" class="tab-pane active">
            <section class="row">
                <div class="col-md-2">
                    <!-- mise en place d'un système de navigation -->
                    <!-- boutons pour choisir une vue facsimilaire ou normalisée -->
                    <div class="affix">
                        <aside class="text-left">
                            <div class="btn-group">
                                <button type="button" class="btn btn-success" id="fac"
                                    >Facsimilaire</button>
                                <button type="button" class="btn btn-default" id="reg"
                                    >Normalisée</button>
                            </div>
                        </aside>
                        <!-- fin boutons pour choisir une vue facsimilaire ou normalisée -->
                        <!-- barre de navigation dans le texte -->
                        <ul class="list-unstyled text-left" id="nav-text">
                            <xsl:for-each select="tei:div">
                                <xsl:sort select="position()" data-type="number" order="ascending"/>
                                <li>
                                    <xsl:element name="a">
                                        <xsl:attribute name="href">
                                            <xsl:text>#</xsl:text>
                                            <xsl:value-of select="./@type"/>
                                            <xsl:value-of select="./@n"/>
                                        </xsl:attribute>
                                        <xsl:text>Chapitre </xsl:text>
                                        <xsl:value-of select="./@n"/>
                                    </xsl:element>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>

                </div>
                <div class="col-md-4" ><xsl:apply-templates/></div>
            </section>
                <!-- fin elements de la barre de navigation dans le texte -->
                <!-- fin ce barre de navigation dans le texte -->


            <br/>
            
        </article>
       
    </xsl:template>

    <xsl:template match="tei:body/tei:div">
        <xsl:element name="div">
            <xsl:call-template name="id"/>
            <xsl:if test="./tei:head">
                <xsl:element name="h2">
                    <xsl:attribute name="class">reg</xsl:attribute>
                    <xsl:apply-templates select="./tei:head"/>
                    <xsl:text>&#160;</xsl:text>
                </xsl:element>
            </xsl:if>
            <xsl:element name="div">
                <xsl:apply-templates select="./tei:div"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:l">
        <xsl:element name="li">
            <xsl:attribute name="n">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:lg">
        <xsl:element name="ol">
            <xsl:attribute name="n">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:p">
        <xsl:element name="div">
            <xsl:attribute name="class">row</xsl:attribute>
            <xsl:if test="parent::tei:div[@n = '1']">
                <xsl:element name="span">
                    <xsl:attribute name="class">reg</xsl:attribute>
                    <xsl:value-of select="./ancestor::tei:div[@type = 'chapter']/@n"/>
                    <xsl:text>.&#160;</xsl:text>
                </xsl:element>
            </xsl:if>
            <xsl:apply-templates/>
        </xsl:element>

        <xsl:element name="br"/>
    </xsl:template>

    <!-- saut de page et de colonne + espace -->

    <xsl:template match="tei:lb">
        <xsl:element name="br">
            <xsl:attribute name="class">orig</xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:cb">
        <hr class="information-hr orig" title="Colonne {@n}"/>
        <span class="reg">
            <xsl:element name="span">
                <xsl:attribute name="class">reg</xsl:attribute>
                <xsl:element name="a">
                    <xsl:attribute name="href">
                        <xsl:value-of select="preceding::tei:pb[1]/@facs"/>
                    </xsl:attribute>
                    <xsl:attribute name="target">
                        <xsl:text>_blank</xsl:text>
                    </xsl:attribute>
                    <xsl:text>&#160;[ fol. </xsl:text>
                    <xsl:value-of select="preceding::tei:pb[1]/@n"/>
                    <xsl:value-of select="@n"/>
                    <xsl:text>]&#160;</xsl:text>

                </xsl:element>
            </xsl:element>
        </span>
    </xsl:template>

    <xsl:template match="tei:pb">
        <hr class="information-hr orig" title="Folio {@n}" a="{@facs}"/>
        <a href="{@facs}" class="orig col-md-1 col-md-offset-10">
            <xsl:attribute name="target">
                <xsl:text>_blank</xsl:text>
            </xsl:attribute>
            <xsl:text>[fol.</xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:if test="following::tei:cb[1]/@n = 'a'">
                <xsl:text>r</xsl:text>
            </xsl:if>
            <xsl:if test="following::tei:cb[1]/@n = 'c'">
                <xsl:text>v</xsl:text>
            </xsl:if>
            <xsl:text>]</xsl:text>
        </a>
        <br/>
    </xsl:template>

    <!-- fin saut de page et de colonne -->

    <xsl:template match="tei:persName|tei:placeName">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:choice">
        <xsl:apply-templates/>
    </xsl:template>
    

    <!-- éléments à affichier pour la visualisation facsimilaire -->
    <xsl:template match="tei:orig">
        <xsl:element name="span">
            <xsl:attribute name="class">orig</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:sic">
        <xsl:element name="span">
            <xsl:attribute name="class">orig</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:abbr">
        <xsl:element name="span">
            <xsl:attribute name="class">abbr</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:pc[@type = 'orig']">
        <xsl:element name="span">
            <xsl:attribute name="class">orig</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:hi[@rend]">
        <xsl:choose>
            <xsl:when test="./@rend = 'exp'">
                <xsl:element name="sup">
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="span">
                    <xsl:attribute name="class">
                        <xsl:value-of select="@rend"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <!-- finir en créant un variable i + 1 -->
    <!-- fin éléments à afficher pour la visualisation facsimilaire -->


    <xsl:template match="tei:app">
        <!-- chercher une solution pour les apparats imbriqués -->
     <xsl:choose>
         <xsl:when test="tei:lem[not(@wit)]">
             <xsl:apply-templates select="tei:lem"/>
         </xsl:when>
         <xsl:otherwise>
             <xsl:apply-templates select="tei:rdg[contains(@wit, 'C1')]"/>
         </xsl:otherwise>
     </xsl:choose> 
    </xsl:template>
    
   
    <xsl:template match="tei:del[@type = 'exponctué']">
        <xsl:element name="span">
            <xsl:attribute name="class">exponc</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:del[@type = 'raturé']">
        <xsl:element name="span">
            <xsl:attribute name="class">exponc</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- éléments à afficher pour la visualisation normalisée -->
    <xsl:template match="tei:reg">
        <xsl:element name="span">
            <xsl:attribute name="class">reg</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:corr">
        <xsl:choose>
            <xsl:when test="@type = 'add'">
                <xsl:element name="span">
                    <xsl:attribute name="class">reg</xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
            <xsl:when test="@type = 'del'">
                <xsl:element name="span">
                    <xsl:attribute name="class">orig</xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:expan">
        <xsl:element name="span">
            <xsl:attribute name="class">expan</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:ex">
        <xsl:element name="span">
            <xsl:attribute name="style">
                <xsl:text>margin-left: 0;</xsl:text>
                <xsl:text>background-color:#ccc;</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:pc[@type = 'reg']">
        <xsl:element name="span">
            <xsl:attribute name="class">reg</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:said">
        <xsl:element name="span">
            <xsl:attribute name="class">reg</xsl:attribute>
            <xsl:text>" </xsl:text>
        </xsl:element>
        <xsl:apply-templates/>
        <xsl:element name="span">
            <xsl:attribute name="class">reg</xsl:attribute>
            <xsl:text> "</xsl:text>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:quote[@xml:lang = 'grec'] | tei:quote[@xml:lang = 'lat']">
        <xsl:element name="i">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:seg[@xml:lang = 'grec'] | tei:seg[@xml:lang = 'lat']">
        <xsl:element name="i">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:seg[@type = 'number']">
        <xsl:element name="span">
            <xsl:attribute name="class">number</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- fin éléments à affichier pour la visualisation normalisée -->

    <!-- Footer starts -->
    <xsl:template match="tei:body//tei:note"/>
      

    
    <!-- Header ends -->

    <!-- templates -->
   
    <!-- attribution des id -->
    <xsl:template name="id">
        <xsl:attribute name="id">
            <xsl:value-of select="@type"/>

            <xsl:value-of select="@n"/>

        </xsl:attribute>
    </xsl:template>

  
</xsl:stylesheet>
