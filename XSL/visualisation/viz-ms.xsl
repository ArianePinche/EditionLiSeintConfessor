<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" version="3.0" xmlns:my="LOCALHOST" >
    <xsl:strip-space elements="*" />
    
    <xsl:function name="my:no-accent">
        <xsl:param name="string" />
        <xsl:value-of select="translate($string,'áàâäéèêëíìîïóòôöúùûü','aaaaeeeeiiiioooouuuu')"/>
    </xsl:function>
    
    <xsl:function name="my:regularizeName">
        <xsl:param name="node"/>
        <xsl:variable name="var"
            select="$node/(text() | tei:hi/text() | .//tei:reg/text() | .//tei:expan/text() | .//tei:ex/text() | .//tei:pc[@type = 'reg' and not(text() = '-')])"/>
        <xsl:value-of select="
            normalize-space(
            replace(
            replace(
            string-join($var),
            '&#160;',
            ' ')
            , '^\s*[sS][ae]in[tze]{0,2}s?',
            ''
            )
            )"/>
    </xsl:function>
    <xsl:function name="my:regularizePlace">
        <xsl:param name="node"/>
        <xsl:variable name="var"
            select="$node/(text() | tei:hi/text() | .//tei:reg/text() | .//tei:expan/text() | .//tei:ex/text() | .//tei:pc[@type = 'reg' and not(text() = '-')])"/>
        <xsl:value-of select="
            normalize-space(
            replace(
            string-join($var),
            '&#160;',
            ' '
            )
            )"/>
    </xsl:function>
    <xsl:output method="html" indent="yes" omit-xml-declaration="yes" name="html"/>

    <xsl:template match="tei:TEI">
        <xsl:variable name="witfile">
            <xsl:value-of select="tokenize(replace(base-uri(.), '.xml', ''), '/')[last()]"/>
            <!-- récupération du nom du fichier courant -->
        </xsl:variable>
        <xsl:result-document href="/Users/arianepinche/Dropbox/these/corpus/html/{concat($witfile,'.html')}"
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

                            <li role="presentation">
                                <li role="presentation">
                                    <a data-toggle="tab" href="#notice">Notice </a>
                                </li>
                            </li>

                            <li role="presentation" class="active">
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="concat($witfile, '.html')"/>
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
                            <li role="presentation">
                                <xsl:element name="a">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="concat($witfile, '-trad', '.html')"/>
                                    </xsl:attribute> Texte avec traduction </xsl:element>
                            </li>

                        </ul>

                        <div class="tab-content">
                            <xsl:apply-templates select=".//tei:teiHeader"/>
                            <xsl:apply-templates select=".//tei:body"/>
                        </div>

                    </div>
                    <hr/>
                </body>
            </html>

        </xsl:result-document>

    </xsl:template>

    <!-- notice -->
    <xsl:template match="tei:fileDesc">
        <article id="notice" class="tab-pane container">
            <xsl:call-template name="titre"/>
            <xsl:call-template name="edition"/>
            <xsl:element name="br"/>
            <xsl:call-template name="sourceDesc"/>
        </article>
    </xsl:template>

    <xsl:template name="titre">
        <h1>
            <xsl:text>Édition de la </xsl:text>
            <xsl:value-of select="tei:titleStmt/tei:title"/>
            <xsl:element name="br"/>
            <xsl:text>de </xsl:text>
            <xsl:value-of select="tei:titleStmt/tei:author"/>
        </h1>
        <br/>
        <br/>
    </xsl:template>

    <xsl:template name="edition">
        <xsl:text>Édition établie par </xsl:text>
        <xsl:value-of select="tei:publicationStmt/tei:publisher"/>
        <xsl:element name="br"/>
        <xsl:text>Le texte est disponibles sous licence </xsl:text>
        <xsl:value-of select="tei:publicationStmt/tei:availability/tei:licence"/>
        <xsl:element name="br"/>
        <xsl:value-of select="tei:publicationStmt/tei:date"/>
    </xsl:template>

    <xsl:template name="sourceDesc">
        <xsl:apply-templates select="tei:sourceDesc/tei:msDesc[1]"/>
    </xsl:template>

    <xsl:template match="tei:msIdentifier">
        <br/> Identifiant du manuscrit : <em>
            <xsl:value-of select="./*" separator=", "/>
        </em>
        <br/>
    </xsl:template>
    <xsl:template match="tei:note">
        <br/>
        <xsl:apply-templates/>
        <br/>
    </xsl:template>
    <xsl:template match="tei:head/tei:title">
        <br/>
        <xsl:text>Titre : </xsl:text>
        <em>
            <xsl:apply-templates/>
        </em>
        <br/>
    </xsl:template>


    <xsl:template match="tei:origDate">
        <br/> Date : <xsl:value-of select="."/>
        <br/>
    </xsl:template>

    <xsl:template match="tei:msItemStruct/tei:locus">
        <br/>
        <b>folios : </b><xsl:value-of select="."/>, lien vers le manuscrit : <xsl:element name="a">
            <xsl:attribute name="href"><xsl:value-of
                    select="ancestor::tei:TEI//tei:body/descendant::tei:pb[1]/@facs"
                /></xsl:attribute>
            <xsl:value-of select="ancestor::tei:TEI//tei:body/descendant::tei:pb[1]/@facs"
            /></xsl:element>
        <br/>
    </xsl:template>

    <xsl:template match="tei:msItemStruct/tei:incipit">
        <b>Incipit : </b>
        <em>
            <xsl:apply-templates/>
        </em>
        <br/>
    </xsl:template>
    <xsl:template match="tei:msItemStruct/tei:explicit">
        <b>Explicit : </b>
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>

    <!-- à utiliser pour la description générale
        
        <xsl:template match="tei:supportDesc/tei:support">
        <dt>Support</dt>
        <dd>
            <xsl:value-of select="."/>
        </dd>
    </xsl:template>
    <xsl:template match="tei:supportDesc/tei:extent/tei:height">
        <dt>Hauteur</dt>
        <dd><xsl:value-of select="."/> mm</dd>
    </xsl:template>
    <xsl:template match="tei:supportDesc/tei:extent/tei:width">
        <dt>Largeur</dt>
        <dd><xsl:value-of select="."/> mm</dd>
    </xsl:template>

    <xsl:template match="tei:supportDesc/tei:foliation">
        <dt>Foliation</dt>
        <dd>
            <xsl:value-of select="."/>
        </dd>
    </xsl:template>
    <xsl:template match="tei:supportDesc/tei:condition">
        <dt>Etat physique du manuscrit :</dt>
        <dd>
            <xsl:value-of select="."/>
        </dd>
    </xsl:template>
    <xsl:template match="tei:supportDesc/tei:layoutDesc">
        <dt>Mise en page</dt>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:layoutDesc/tei:layout">
        <dt>Nombre de colonnes par page : </dt>
        <dd>
            <xsl:value-of select="@columns"/>
        </dd>
    </xsl:template>
    <xsl:template match="tei:layoutDesc/tei:layout">
        <dt>Nombre de lignes par page : </dt>
        <dd>
            <xsl:value-of select="@writtenLines"/>
        </dd>
    </xsl:template>
    <xsl:template match="tei:handDesc/tei:handNote">
        <dt>Mains du manuscrit</dt>
        <dd>
            <xsl:value-of select="."/>
        </dd>
    </xsl:template>
    <xsl:template match="tei:scriptDesc">
        <div class="scriptDesc">
            <h4>Ecriture</h4>
            <p>
                <xsl:value-of select="."/>
            </p>
        </div>
    </xsl:template>
      -->
    <xsl:template match="tei:history"/>
    <xsl:template match="tei:encodingDesc"/>

    <!-- Index des noms de personnages -->
    <xsl:template match="tei:particDesc">
        <article id="indexPers" class="tab-pane container">
            <xsl:apply-templates/>
        </article>
    </xsl:template>
    <xsl:template match="tei:person">
            <xsl:variable name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:variable>
            <xsl:element name="dt">
                <xsl:value-of select="tei:persName"/>
                <xsl:if test="tei:death">
                    <xsl:text> (</xsl:text>
                    <xsl:choose>
                        <xsl:when test="tei:birth">
                            <xsl:apply-templates select="tei:birth"/>
                        <xsl:text>-</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="tei:death/@when">†</xsl:if></xsl:otherwise>
                    </xsl:choose>
                    <xsl:apply-templates select="tei:death"/>
                    <xsl:text>)</xsl:text>
                </xsl:if>
                <xsl:text> - nombre d'apparitions : </xsl:text>
                <xsl:value-of
                    select="count(ancestor::tei:TEI//tei:body//tei:persName[@ref= '#'||$id])"/>
            </xsl:element>
            <xsl:element name="dd"><xsl:value-of select="tei:note"/></xsl:element>
            <xsl:element name="dd">
                <xsl:element name="ul">
                    <xsl:attribute name="class">list-occurences</xsl:attribute>
                    <xsl:for-each-group select="ancestor::tei:TEI//tei:body//tei:persName[@ref = '#'||$id and not(ancestor::tei:head)]" group-by="my:regularizeName(.)">
                        <xsl:element name="li">
                            <xsl:apply-templates mode="regName" select="current()"/>
                            <xsl:text> :</xsl:text>
                            <xsl:for-each-group select="current-group()/ancestor::tei:div[@type='chapter']" group-by="@n">
                                <xsl:element name="li">
                                    <xsl:attribute name="class">par</xsl:attribute>
                                    <xsl:text> §</xsl:text>
                            <xsl:value-of select="@n"/>
                                </xsl:element>
                            </xsl:for-each-group>
                        </xsl:element>
                    </xsl:for-each-group>
                </xsl:element>
            </xsl:element>
            <xsl:element name="br"/>
        
    </xsl:template>
    
    <xsl:template match="tei:persName" mode="regName">
        <xsl:value-of
            select="my:regularizeName(.)"/>
    </xsl:template>
    <xsl:template match="tei:placeName" mode="regPlace">
        <xsl:value-of
            select="my:regularizePlace(.)"/>
    </xsl:template>
    
    
    <!-- Index des noms de lieux -->
    <xsl:template match="tei:settingDesc">
        <article id="indexLieu" class="tab-pane container">
            <xsl:apply-templates/>
        </article>
    </xsl:template>

    <xsl:template match="tei:place">
        <xsl:variable name="id">
            <xsl:value-of select="@xml:id"/>
        </xsl:variable>
        <xsl:element name="dt">
            <xsl:value-of select="tei:placeName"/>
            <xsl:text> - nombre d'apparitions : </xsl:text>
            <xsl:value-of
                select="count(ancestor::tei:TEI//tei:body//tei:placeName[@ref = '#'||$id])"/>
        </xsl:element>
        <xsl:element name="dd">
            <xsl:value-of select="tei:note"/>
        </xsl:element>
        <xsl:element name="dd">
            <xsl:element name="ul">
                <xsl:attribute name="class">list-occurences</xsl:attribute>
                <xsl:for-each-group select="ancestor::tei:TEI//tei:body//tei:placeName[@ref = '#'||$id and not(ancestor::tei:head)]" group-by="my:regularizePlace(.)">
                    <xsl:element name="li">
                        <xsl:apply-templates mode="regPlace" select="current()"/>
                        <xsl:text> :</xsl:text>
                        <xsl:for-each-group select="current-group()/ancestor::tei:div[@type='chapter']" group-by="@n">
                            <xsl:element name="li">
                                <xsl:attribute name="class">par</xsl:attribute>
                                <xsl:text> §</xsl:text>
                                <xsl:value-of select="@n"/>
                            </xsl:element>
                        </xsl:for-each-group>
                    </xsl:element>
                </xsl:for-each-group>
            </xsl:element>
        </xsl:element>
        <xsl:element name="br"/>
    </xsl:template>

    
    <xsl:template match="tei:location"/>



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

                <!-- fin elements de la barre de navigation dans le texte -->
                <!-- fin ce barre de navigation dans le texte -->


                <div class="col-md-6" id="contenu">
                    <xsl:element name="h1">
                        <xsl:value-of select="./ancestor::tei:TEI//tei:titleStmt/tei:title"/>
                    </xsl:element>
                    <xsl:apply-templates/>

                </div>
                <div class="col-md-3 col-md-offset-1">
                    <xsl:element name="h4">Sélection des temoins</xsl:element>
                    <xsl:for-each select="./ancestor::tei:TEI//tei:msDesc">
                        <div class="checkbox">
                            <label>
                                <xsl:element name="input">
                                    <xsl:attribute name="class">
                                        <xsl:text>activation activation-legende</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="type">
                                        <xsl:text>checkbox</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="data-target">
                                        <xsl:text>.</xsl:text>
                                        <xsl:value-of select="./@xml:id"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="data-category">
                                        <xsl:text>activation-legende</xsl:text>
                                    </xsl:attribute>
                                </xsl:element>
                                <xsl:variable name="xmlidTok">
                                    <xsl:value-of select="replace(./@xml:id, '#', '')"/>
                                </xsl:variable>
                                <xsl:variable name="xmlidLet">
                                    <xsl:value-of select="replace($xmlidTok, '\d+', '')"/>
                                </xsl:variable>
                                <xsl:variable name="xmlidNum">
                                    <xsl:value-of select="replace($xmlidTok, '\D+', '')"/>
                                </xsl:variable>
                                <xsl:value-of select="$xmlidLet"/>
                                <xsl:element name="sup">
                                    <xsl:value-of select="$xmlidNum"/>
                                </xsl:element>
                            </label>
                        </div>
                    </xsl:for-each>
                    <div id="note-container"/>
                </div>
            </section>


            <!-- fin de mise en place d'un système de navigation -->

            <br/>
            <footer class="row">
                <hr class="information-hr" title="notes de bas de page"/>
                <div class="col-md-7 col-md-push-2">
                    <ul class="list-unstyled">
                        <xsl:apply-templates select=".//tei:text//tei:witDetail"
                            mode="notesbasdepage"/>
                    </ul>
                </div>
            </footer>
        </article>
        <div class="modal fade" tabindex="-1" role="dialog" id="app">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                            >x</button>
                        <h4 class="modal-title" id="myModalLabel">Apparat</h4>
                    </div>
                    <div class="modal-body"/>
                </div>
            </div>
        </div>
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
    <!-- rajouter l'xml id à l'apparat pour le pop-up -->
    <!-- fin éléments à afficher pour la visualisation facsimilaire -->


    <xsl:template match="tei:app">
        <!-- chercher une solution pour les apparats imbriqués -->
        <xsl:variable name="renvoiNote">
            <xsl:number count="tei:app" level="any" from="tei:text"/>
        </xsl:variable>
        <xsl:apply-templates select="./tei:lem"/>
        <xsl:element name="span">
            <xsl:attribute name="class">
                <xsl:text>linkapp </xsl:text>
                <xsl:value-of select="child::node()/replace(@wit, '#', '')"/>
            </xsl:attribute>
            <xsl:attribute name="data-toggle">
                <xsl:text>note</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="data-target">#app</xsl:attribute>
            <xsl:element name="sup">
                <xsl:text>[</xsl:text>
                <xsl:value-of select="$renvoiNote"/>
                <xsl:text>]</xsl:text>
            </xsl:element>
            <xsl:element name="div">
                <xsl:attribute name="class">app</xsl:attribute>
                <xsl:element name="ul">
                    <xsl:attribute name="class">list-unstyled</xsl:attribute>
                    <xsl:element name="li">
                        <xsl:value-of
                            select=".//tei:lem/text() | .//tei:lem/tei:hi/text() | .//tei:lem/tei:choice/tei:reg/text() | .//tei:lem/tei:choice/tei:corr/text() | .//tei:lem/tei:choice/tei:expan/text() |.//tei:lem/tei:choice/tei:expan/tei:ex/text() | .//tei:lem/tei:hi/tei:pc/text() | .//tei:lem/tei:hi/tei:placeName/text() | .//tei:lem/tei:hi/tei:persName/text()  | .//tei:lem/tei:persName/text() | .//tei:lem/tei:placeName/text() | .//tei:lem/tei:pc/text() | .//tei:lem/tei:corr[@type='del']/text() | .//tei:lem/tei:corr[@type='add']/text()"/>
                        <xsl:if test="./@wit">
                            <xsl:value-of select="replace(./@wit, '#', '')"/>
                        </xsl:if>
                        <xsl:text> ]</xsl:text>
                    </xsl:element>
                    <xsl:for-each select="child::tei:rdg">
                        <xsl:element name="li">
                            <xsl:apply-templates/>
                            <xsl:if test="./@cause">
                                <xsl:element name="i">
                                    <xsl:value-of select="./@cause"/>
                                </xsl:element>
                            </xsl:if>
                            <xsl:text>&#160;</xsl:text>
                            <xsl:element name="span">
                                <xsl:attribute name="class">wit</xsl:attribute>
                                <xsl:for-each select="tokenize(./@wit, '\s+')">
                                    <xsl:variable name="witTok">
                                        <xsl:value-of select="replace(., '#', '')"/>
                                    </xsl:variable>
                                    <xsl:variable name="witLet">
                                        <xsl:value-of select="replace($witTok, '\d+', '')"/>
                                    </xsl:variable>
                                    <xsl:variable name="witNum">
                                        <xsl:value-of select="replace($witTok, '\D+', '')"/>
                                    </xsl:variable>
                                    <xsl:value-of select="$witLet"/>
                                    <xsl:element name="sup">
                                        <xsl:value-of select="$witNum"/>
                                        <xsl:text> </xsl:text>
                                    </xsl:element>
                                </xsl:for-each>
                            </xsl:element>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:element>
        </xsl:element>
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
                    <xsl:text>[</xsl:text>
                    <xsl:apply-templates/>
                    <xsl:text>]</xsl:text>
                </xsl:element>
            </xsl:when>
            <xsl:when test="@type = 'del'">
                <xsl:element name="span">
                    <xsl:attribute name="class">orig</xsl:attribute>
                    <xsl:text>(</xsl:text>
                    <xsl:apply-templates/>
                    <xsl:text>)</xsl:text>
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

    <xsl:template match="tei:ref">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="./@target"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
