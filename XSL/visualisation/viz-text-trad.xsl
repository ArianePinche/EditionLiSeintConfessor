<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xi="http://www.w3.org/2001/XInclude" exclude-result-prefixes="xs tei xi" version="3.0">

    <xsl:strip-space elements="*"/>
    <xsl:output method="text"/>
    <xsl:output method="html" indent="yes" omit-xml-declaration="yes" name="html"/>

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <xsl:variable name="adresse">
            <xsl:value-of select="tokenize(//tei:text[@n ='edition']/tei:body/@n, ':')[last()]"/>
            <!-- récupération dans l'uri uniquement du nom du document -->
        </xsl:variable>
        <xsl:result-document href="Users/arianepinche/Dropbox/these/corpus/html/{concat($adresse,'-trad', '.html')}" format="html">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                    <title>Recueil des oeuvres hagiographiques de Wauchier de Denain</title>
                    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
                    <link rel="stylesheet" type="text/css" href="../css/theme.css"/>
                    <script src="../js/jquery.min.js"/>
                    <script src="../js/jquery/plugins/jquery.blockUI.js"/>
                    <script src="../js/bootstrap.min.js"/>
                    <script src="../js/jquery.apparatus.min.js"/>
                    <script type="text/javascript">
                    
                    /* function init() {
                    dragDrop.initElement('teibpToolbox');
                    }
                    */
                    $(document).ready(function(){
                    
                    //iterate on divs of main text to compare with every parallel div (same data-corresp)
                    //get the maximum height of the group and assign it to all
                    //http://stackoverflow.com/questions/6060992/element-with-the-max-height-from-a-set-of-elements
                    $("div#text div.spacer").each(function(){
                    var that = $(this);
                    var maxHeight = Math.max.apply(null, $("div[data-corresp='" + that.data("corresp") + "']").map(function () {
                    return $(this).height();
                    }).get());
                    
                    $(this).css({height: maxHeight + "px"});
                    $("div[data-corresp='" + that.data("corresp") + "']").css({height: maxHeight + "px"});
                    })
                    
                    /* activation des légendes */
                    
                    $(".activation").apparatus(".nom");
                    
                    /* activation des popover */
                    $(function () 
                    {
                    $('[data-toggle="popover"]').popover()
                    })
                    
                    }); 
                </script>

                </head>
                <body>
                    <div class="Notice">
                        <ul class="nav nav-tabs">
                             <li role="presentation">
                                    <li role="presentation">
                                        <a data-toggle="tab" href="#notice">Notice </a>
                                    </li>
                                </li>
                                
                                <li role="presentation" class="active">
                                    <xsl:element name="a" >
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="concat($adresse, '-trad', '.html')"/>
                                        </xsl:attribute> Texte avec traduction </xsl:element>
                                </li>
                                
                                <li role="presentation">
                                    <xsl:element name="a">
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="concat($adresse, '.html')"/>
                                        </xsl:attribute> Edition </xsl:element>
                                </li>
                                
                                <li role="presentation">
                                    <li role="presentation">
                                        <a data-toggle="tab" href="#indexPers">Index des noms de
                                            personnages</a>
                                    </li>
                                </li>
                                
                                <li role="presentation">
                                    <li role="presentation">
                                        <a data-toggle="tab" href="#indexLieu">Index des noms de
                                            lieux</a>
                                    </li>
                                </li>                            
                               
                                
                            
                        </ul>
                        <div class="tab-content">
                            
                                <article id="notice" class="tab-pane container">
 
                                        <xsl:call-template name="titre" />
                                        <xsl:call-template name="edition"/>
                                        <xsl:element name="br"/>
                                        <xsl:call-template name="sourceDesc"/>
                                    
                                </article>
                            
                            <article id="text" class="tab-pane active">
                                <section class="row">
                                    <div class="col-md-2">
                                        <!-- mise en place d'un système de navigation -->
                                        <ul class="list-unstyled text-left" id="nav-text">
                                            <xsl:for-each
                                                select="//tei:text[@n = 'edition']/tei:body/tei:div">
                                                <xsl:sort select="position()" data-type="number"
                                                  order="ascending"/>
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
                                    <!-- fin elements de la barre de navigation dans le texte -->

                                    <div class="row">
                                        <h1>
                                            <xsl:value-of
                                                select="//tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:titleStmt/tei:title"
                                            />
                                        </h1>
                                        <br/>
                                        <div class="col-md-3" id="text">
                                            <xsl:apply-templates select="//tei:text[@n = 'edition']"
                                            />
                                        </div>
                                        <div class="col-md-1"/>
                                        <div class="col-md-3" id="traduction">
                                            <xsl:apply-templates
                                                select="//tei:text[@n = 'traduction']"/>
                                        </div>
                                        <div class="col-md-1 col-md-offset-1">
                                            <div class="checkbox">
                                                <label>
                                                  <input class="activation activation-legende"
                                                  type="checkbox" data-target=".persName"
                                                  data-category=".activation-legende"/> Nom de
                                                  personnage </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                  <input class="activation activation-legende"
                                                  type="checkbox" data-target=".placeName"
                                                  data-category=".activation-legende"/> Nom de lieu
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                </section>
                                <br/>
                                <footer class="row">
                                    <hr class="information-hr" title="notes de bas de page"/>
                                    <div class="col-md-7 col-md-push-2">
                                        <ul class="list-unstyled">
                                            <xsl:apply-templates select="//tei:text//tei:witDetail"
                                                mode="notesbasdepage"/>
                                        </ul>
                                    </div>
                                </footer>
                            </article>
                        </div>
                    </div>
                    <hr/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- notice -->
    
    
    <xsl:template name="titre">
        <h1>
            <xsl:text>Édition de la </xsl:text>
            <xsl:value-of select="//tei:teiHeader[@n='edition']//tei:titleStmt/tei:title"/>
            <xsl:element name="br"/>
            <xsl:text>de </xsl:text>
            <xsl:value-of select="//tei:teiHeader[@n='edition']//tei:titleStmt/tei:author"/>
        </h1>
        <br/>
        <br/>
    </xsl:template>
    
    <xsl:template name="edition">
        <xsl:text>Édition établie par </xsl:text>
        <xsl:value-of select="//tei:teiHeader[@n='edition']//tei:publicationStmt/tei:publisher"/>
        <xsl:element name="br"/>
        <xsl:text>Le texte est disponibles sous licence </xsl:text>
        <xsl:value-of select="//tei:teiHeader[@n='edition']//tei:publicationStmt/tei:availability/tei:licence"/>
        <xsl:element name="br"/>
        <xsl:value-of select="//tei:teiHeader[@n='edition']//tei:publicationStmt/tei:date"/>
    </xsl:template>
    
    <xsl:template name="sourceDesc">
        <xsl:apply-templates select="//tei:teiHeader[@n='edition']//tei:sourceDesc/tei:msDesc[1]"/>
    </xsl:template>
    
    <xsl:template match="//tei:teiHeader[@n='edition']//tei:msIdentifier">
        <br/> Identifiant du manuscrit : <em>
            <xsl:value-of select="./*" separator=", "/>
        </em>
        <br/>
    </xsl:template>
    <xsl:template match="//tei:teiHeader[@n='edition']//tei:note">
        <br/>
        <xsl:apply-templates/>
        <br/>
    </xsl:template>
    <xsl:template match="//tei:teiHeader[@n='edition']//tei:head/tei:title">
        <br/>
        <xsl:text>Titre : </xsl:text>
        <em>
            <xsl:apply-templates/>
        </em>
        <br/>
    </xsl:template>
    
    
    <xsl:template match="//tei:teiHeader[@n='edition']//tei:origDate">
        <br/> Date : <xsl:value-of select="."/>
        <br/>
    </xsl:template>
    
    <xsl:template match="//tei:teiHeader[@n='edition']//tei:msItemStruct/tei:locus">
        <br/>
        <b>folios : </b><xsl:value-of select="."/>, lien vers le manuscrit : <xsl:element name="a">
            <xsl:attribute name="href"><xsl:value-of
                select="ancestor::tei:TEI//tei:body/descendant::tei:pb[1]/@facs"
            /></xsl:attribute>
            <xsl:value-of select="ancestor::tei:TEI//tei:body/descendant::tei:pb[1]/@facs"
            /></xsl:element>
        <br/>
    </xsl:template>
    
    <xsl:template match="//tei:teiHeader[@n='edition']//tei:msItemStruct/tei:incipit">
        <b>Incipit : </b>
        <em>
            <xsl:apply-templates/>
        </em>
        <br/>
    </xsl:template>
    <xsl:template match="//tei:teiHeader[@n='edition']//tei:msItemStruct/tei:explicit">
        <b>Explicit : </b>
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>
    
    <!-- fin notice -->



    <xsl:template match="tei:body/tei:div">
        <xsl:element name="div">
            <xsl:attribute name="class">spacer</xsl:attribute>
            <xsl:attribute name="data-corresp">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:call-template name="id"/>
            <xsl:if test="./tei:head">
                <xsl:element name="h2">
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
            <xsl:attribute name="class">norm</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:p">
        <xsl:element name="div">
            <xsl:attribute name="class">row</xsl:attribute>
            <xsl:if test="parent::tei:div[@n = '1']">
                <xsl:element name="a">
                    <xsl:attribute name="id">
                        <xsl:value-of select="./ancestor::tei:div[@type = 'chapter']/@n"/>
                    </xsl:attribute>
                    <xsl:attribute name="href">
                        <xsl:text>#</xsl:text>
                        <xsl:value-of select="./ancestor::tei:div[@type = 'chapter']/@n"/>
                    </xsl:attribute>
                    <xsl:value-of select="./ancestor::tei:div[@type = 'chapter']/@n"/>
                    <xsl:text>.&#160;</xsl:text>
                </xsl:element>
            </xsl:if>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:cb">
        <xsl:element name="span">
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:value-of select="preceding::tei:pb[1]/@facs"/>
                </xsl:attribute>
                <xsl:attribute name="target">_blank,</xsl:attribute>
                <xsl:text>&#160;[ fol. </xsl:text>
                <xsl:value-of select="preceding::tei:pb[1]/@n"/>
                <xsl:value-of select="@n"/>
                <xsl:text>]&#160;</xsl:text>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <!-- éléments à ne pas afficher pour le texte normalisé -->
    <xsl:template match="tei:orig"/>
    <xsl:template match="tei:abbr"/>
    <xsl:template match="tei:lb"/>
    <xsl:template match="tei:rdg"/>
    <xsl:template match="tei:pc[@type = 'orig']"/>

    <!-- éléments de mise en page du manuscrit -->

    <xsl:template match="tei:app">
        <xsl:element name="span">
           <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:hi[@rend]">
        <xsl:choose>
            <xsl:when test="./@rend = 'rubricated orig'"/>
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

    <!-- éléments à affichier pour la visualisation normalisée -->
    <xsl:template match="tei:reg">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:corr">
        <xsl:element name="span">
            <xsl:text>[</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>]</xsl:text>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:expan">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:ex">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:pc[@type = 'reg']">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:said">
        <xsl:text>" </xsl:text>
        <xsl:apply-templates/>
        <xsl:text> "</xsl:text>
    </xsl:template>

    <xsl:template match="tei:seg[@xml:lang ='lat']">
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

    <!-- éléments à repérer dans le texte -->

    <xsl:template match="tei:persName">
        <xsl:choose>
            <xsl:when test="./child::tei:cb">
                <xsl:element name="a">
                    <xsl:attribute name="class">
                        <xsl:text>nom</xsl:text>
                        <xsl:text> </xsl:text>
                        <xsl:text>persName</xsl:text>
                    </xsl:attribute>
                    <xsl:if test="ancestor::tei:text[@n = 'edition']">
                        <xsl:attribute name="data-content">
                            <xsl:variable name="refPers">
                                <xsl:value-of select="replace(@ref, '#', '')"/>
                            </xsl:variable>
                            <xsl:value-of
                                select="ancestor::tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:person[@xml:id = $refPers]/tei:persName"/>
                            <xsl:if
                                test="ancestor::tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:person[@xml:id = $refPers]/tei:birth | ancestor::tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:person[@xml:id = $refPers]/tei:death">
                                <xsl:text> (</xsl:text>
                                <xsl:value-of
                                    select="ancestor::tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:person[@xml:id = $refPers]/tei:birth"/>
                                <xsl:text>-</xsl:text>
                                <xsl:value-of
                                    select="ancestor::tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:person[@xml:id = $refPers]/tei:death"/>
                                <xsl:text> )</xsl:text>
                            </xsl:if>
                            <xsl:text> : </xsl:text>
                            <xsl:apply-templates
                                select="ancestor::tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:person[@xml:id = $refPers]/tei:note"
                            />
                        </xsl:attribute>
                        <xsl:attribute name="data-placement">top</xsl:attribute>
                        <xsl:attribute name="data-toggle">popover</xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates select="child::tei:cb/preceding-sibling::node()"/>
                </xsl:element>
                <xsl:element name="span">
                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            <xsl:value-of select="preceding::tei:pb[1]/@facs"/>
                        </xsl:attribute>
                        <xsl:attribute name="target">_blank,</xsl:attribute>
                        <xsl:text>&#160;[ fol. </xsl:text>
                        <xsl:value-of select="preceding::tei:pb[1]/@n"/>
                        <xsl:value-of select="child::tei:cb/@n"/>
                        <xsl:text>]&#160;</xsl:text>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="a">
                    <xsl:attribute name="class">
                        <xsl:text>nom</xsl:text>
                        <xsl:text> </xsl:text>
                        <xsl:text>persName</xsl:text>
                    </xsl:attribute>
                    <xsl:if test="ancestor::tei:text[@n = 'edition']">
                        <xsl:attribute name="data-content">
                            <xsl:variable name="refPers">
                                <xsl:value-of select="replace(@ref, '#', '')"/>
                            </xsl:variable>
                            <xsl:value-of
                                select="ancestor::tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:person[@xml:id = $refPers]/tei:persName"/>
                            <xsl:if
                                test="ancestor::tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:person[@xml:id = $refPers]/tei:birth | ancestor::tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:person[@xml:id = $refPers]/tei:death">
                                <xsl:text> (</xsl:text>
                                <xsl:value-of
                                    select="ancestor::tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:person[@xml:id = $refPers]/tei:birth"/>
                                <xsl:text>-</xsl:text>
                                <xsl:value-of
                                    select="ancestor::tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:person[@xml:id = $refPers]/tei:death"/>
                                <xsl:text> )</xsl:text>
                            </xsl:if>
                            <xsl:text> : </xsl:text>
                            <xsl:apply-templates
                                select="ancestor::tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:person[@xml:id = $refPers]/tei:note"
                            />
                        </xsl:attribute>
                        <xsl:attribute name="data-placement">top</xsl:attribute>
                        <xsl:attribute name="data-toggle">popover</xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates select="./child::tei:cb/following-sibling::node()"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="a">
                    <xsl:attribute name="class">
                        <xsl:text>nom</xsl:text>
                        <xsl:text> </xsl:text>
                        <xsl:text>persName</xsl:text>
                    </xsl:attribute>
                    <xsl:if test="ancestor::tei:text[@n = 'edition']">
                        <xsl:attribute name="data-content">
                            <xsl:variable name="refPers">
                                <xsl:value-of select="replace(@ref, '#', '')"/>
                            </xsl:variable>
                            <xsl:value-of
                                select="ancestor::tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:person[@xml:id = $refPers]/tei:persName"/>
                            <xsl:if
                                test="ancestor::tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:person[@xml:id = $refPers]/tei:birth | ancestor::tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:person[@xml:id = $refPers]/tei:death">
                                <xsl:text> (</xsl:text>
                                <xsl:value-of
                                    select="ancestor::tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:person[@xml:id = $refPers]/tei:birth"/>
                                <xsl:text>-</xsl:text>
                                <xsl:value-of
                                    select="ancestor::tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:person[@xml:id = $refPers]/tei:death"/>
                                <xsl:text> )</xsl:text>
                            </xsl:if>
                            <xsl:text> : </xsl:text>
                            <xsl:apply-templates
                                select="ancestor::tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:person[@xml:id = $refPers]/tei:note"
                            />
                        </xsl:attribute>
                        <xsl:attribute name="data-placement">top</xsl:attribute>
                        <xsl:attribute name="data-toggle">popover</xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:placeName">
        <xsl:choose>
            <xsl:when test="./child::tei:cb">
                <xsl:element name="a">
                    <xsl:attribute name="class">
                        <xsl:text>nom</xsl:text>
                        <xsl:text> </xsl:text>
                        <xsl:text>placeName</xsl:text>
                    </xsl:attribute>
                    <xsl:if test="ancestor::tei:text[@n = 'edition']">
                        <xsl:attribute name="data-content">
                            <xsl:variable name="refPlace">
                                <xsl:value-of select="replace(@ref, '#', '')"/>
                            </xsl:variable>
                            <xsl:apply-templates
                                select="ancestor::tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:place[@xml:id = $refPlace]/tei:note"
                            />
                        </xsl:attribute>
                        <xsl:attribute name="data-placement">top</xsl:attribute>
                        <xsl:attribute name="data-toggle">popover</xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates select="child::tei:cb/preceding-sibling::node()"/>
                </xsl:element>
                <xsl:element name="span">
                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            <xsl:value-of select="preceding::tei:pb[1]/@facs"/>
                        </xsl:attribute>
                        <xsl:attribute name="target">_blank,</xsl:attribute>
                        <xsl:text>&#160;[ fol. </xsl:text>
                        <xsl:value-of select="preceding::tei:pb[1]/@n"/>
                        <xsl:value-of select="child::tei:cb/@n"/>
                        <xsl:text>]&#160;</xsl:text>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="a">
                    <xsl:attribute name="class">
                        <xsl:text>nom</xsl:text>
                        <xsl:text> </xsl:text>
                        <xsl:text>placeName</xsl:text>
                    </xsl:attribute>
                    <xsl:if test="ancestor::tei:text[@n = 'edition']">
                        <xsl:attribute name="data-content">
                            <xsl:variable name="refPlace">
                                <xsl:value-of select="replace(@ref, '#', '')"/>
                            </xsl:variable>
                            <xsl:apply-templates
                                select="ancestor::tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:place[@xml:id = $refPlace]/tei:note"
                            />
                        </xsl:attribute>
                        <xsl:attribute name="data-placement">top</xsl:attribute>
                        <xsl:attribute name="data-toggle">popover</xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates select="./child::tei:cb/following-sibling::node()"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="a">
                    <xsl:attribute name="class">
                        <xsl:text>nom</xsl:text>
                        <xsl:text> </xsl:text>
                        <xsl:text>placeName</xsl:text>
                    </xsl:attribute>
                    <xsl:if test="ancestor::tei:text[@n = 'edition']">
                        <xsl:attribute name="data-content">
                            <xsl:variable name="refPlace">
                                <xsl:value-of select="replace(@ref, '#', '')"/>
                            </xsl:variable>
                            <xsl:apply-templates
                                select="ancestor::tei:text[@n = 'edition']/preceding-sibling::tei:teiHeader//tei:place[@xml:id = $refPlace]/tei:note"
                            />
                        </xsl:attribute>
                        <xsl:attribute name="data-placement">top</xsl:attribute>
                        <xsl:attribute name="data-toggle">popover</xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- fin édition mode visualisation par témoin -->

    <!-- Footer starts -->
    <xsl:template match="tei:body//tei:note">
        <xsl:variable name="pos">
            <xsl:number count="tei:note" level="any" from="tei:text"/>
        </xsl:variable>

        <xsl:variable name="infobulle" select="normalize-space(.)"/>
        <sup>
            <a name="appelnote{$pos}" href="#textenote{$pos}" title="{$infobulle}">
                <xsl:value-of select="$pos"/>
            </a>
        </sup>
    </xsl:template>


    <xsl:template match="tei:text//tei:note" mode="notesbasdepage">
        <xsl:variable name="pos">
            <xsl:number count="tei:text//tei:note" level="any" from="tei:text"/>
        </xsl:variable>
        <li>
            <a name="textenote{$pos}" href="#appelnote{$pos}">
                <xsl:value-of select="$pos"/>
            </a>
            <xsl:text> </xsl:text>
            <xsl:value-of select="."/>
        </li>
    </xsl:template>

    <xsl:template match="tei:editionStmt">
        <p style="font-size:small">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:publicationStmt">
        <p style="font-size:small;">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <!-- Header ends -->

    <!-- templates -->
    <!-- règles de numérotation des vers -->

    <!--     <xsl:template name="ol">
        <xsl:element name="ol">
            <xsl:attribute name="start">
                <xsl:value-of select="./tei:l[1]/@n"/>
            </xsl:attribute>
            <xsl:attribute name="class">
                <xsl:text>norm</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    -->

    <!-- attribution des id -->
    <xsl:template name="id">
        <xsl:attribute name="id">
            <xsl:value-of select="@type"/>

            <xsl:value-of select="@n"/>

        </xsl:attribute>
    </xsl:template>
</xsl:stylesheet>
