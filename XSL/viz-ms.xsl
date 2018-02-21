<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" version="2.0">

    <xsl:strip-space elements="*"/>
    <xsl:output method="html"/>
    <xsl:strip-space elements="tei:app"/>     
    <xsl:variable name="adresse">            
        <xsl:value-of
            select="tokenize(//tei:body/@n, ':')[last()]"/>
        <!-- récupération dans l'uri uniquement du nom du document -->
    </xsl:variable>

    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        
  <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <title>Recueil des oeuvres hagiographiques de Wauchier de Denain</title>
                <link rel="stylesheet" href="../css/bootstrap.min.css"/>
                <link rel="stylesheet" type="text/css" href="../css/theme.css"/>
                <script src="../js/jquery.min.js"/>
                <script src="../js/bootstrap.min.js"/>
                <script src="../js/normalisation.js"/>
            </head>
            <body>
                <div class="Notice">
                    <ul class="nav nav-tabs">
                        <li role="presentation" class="active">
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:value-of
                                        select="concat($adresse,'.html')"/>
                                </xsl:attribute>
                                Edition
                            </xsl:element></li>
                        <li role="presentation" >
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:value-of
                                        select="concat($adresse, '-trad', '.html')"/>
                                </xsl:attribute>
                                Texte avec traduction
                            </xsl:element>
                        </li>   
                        <li role="presentation"><li role="presentation">
                            <a data-toggle="tab" href="#notice">
                                Notice
                            </a></li></li>
                    </ul>

                    <div class="tab-content">
                        <xsl:apply-templates select="//tei:teiHeader"/>
                        <xsl:apply-templates select="//tei:body"/>
                    </div>
                </div>
                <hr/>      
            </body>
        </html>
           

    </xsl:template>

    <!-- Header start -->
    <xsl:template match="tei:fileDesc">
        <h1>
            <xsl:apply-templates select="//tei:titleStmt"/>
        </h1>
        <xsl:apply-templates select="//tei:sourceDesc"/>
    </xsl:template>

    <xsl:template match="//tei:titleStmt">
        <xsl:copy-of select="tei:title"/>
    </xsl:template>
    <xsl:variable name="title">
        <xsl:copy-of select="//tei:titleStmt/tei:title"/>
    </xsl:variable>

    <xsl:template match="tei:teiHeader">
        <article id="notice" class="tab-pane container">
            <xsl:apply-templates/>
        </article>
    </xsl:template>

    <xsl:template match="tei:sourceDesc">
        <h2>Notice du manuscrit</h2>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:ref">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="./@target"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:encodingDesc">
        <aside>
            <h3>Principes de édition l'édition électronique</h3>
            <p>
                <xsl:apply-templates/>
            </p>
        </aside>
    </xsl:template>

    <xsl:template match="tei:encodingDesc//tei:p/tei:lb">
        <br/>
    </xsl:template>

    <xsl:template match="tei:msIdentifier">
        <br/> Identifiant du manuscrit : <em>
            <xsl:value-of select="./*" separator=", "/>
        </em>
        <br/>
    </xsl:template>


    <xsl:template match="tei:origDate">
        <br/> Date : <em>
            <xsl:value-of select="."/>
        </em>
        <br/>
    </xsl:template>

    <xsl:template match="/tei:header/tei:title">
        <br/>
        <b>
            <xsl:value-of select="."/>
        </b>
        <br/>
    </xsl:template>

    <xsl:template match="tei:msContents">
        <section>
            <h3>Contenu</h3>
            <xsl:apply-templates/>
        </section>
    </xsl:template>

    <xsl:template match="/tei:msContents/tei:msItemStruct">
        <div class="itemStruct">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:msItemStruct/tei:title">
        <h4>
            <xsl:value-of select="."/>
        </h4>
    </xsl:template>
    <xsl:template match="tei:msItemStruct/tei:locus">
        <b>folios :</b>
        <blockquote title="locus">
            <xsl:value-of select="."/>
        </blockquote>
    </xsl:template>
    <xsl:template match="tei:msItemStruct/tei:author">
        <b>auteur :</b>
        <blockquote title="author">
            <xsl:value-of select="."/>
        </blockquote>
    </xsl:template>
    <xsl:template match="tei:msItemStruct/tei:incipit">
        <b>Incipit :</b>
        <blockquote title="incipit">
            <xsl:value-of select="."/>
        </blockquote>
    </xsl:template>
    <xsl:template match="tei:msItemStruct/tei:explicit">
        <b>explicit :</b>
        <blockquote title="explicit">
            <xsl:value-of select="."/>
        </blockquote>
    </xsl:template>
    <xsl:template match="tei:physDesc">
        <section>
            <h3>Description physique</h3>
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    <xsl:template match="tei:objectDesc">
        <div class="objectDesc">
            <h4>Objet</h4>
            <dl>
                <xsl:apply-templates/>
            </dl>
        </div>
    </xsl:template>
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
    <xsl:template match="tei:decoDesc">
        <div class="decoDesc">
            <h4>Décoration</h4>
            <p>
                <xsl:value-of select="."/>
            </p>
        </div>
    </xsl:template>
    <xsl:template match="tei:history">
        <section>
            <h3>Histoire</h3>
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    <xsl:template match="tei:history/tei:origin">
        <h5>Origine</h5>
        <p>
            <xsl:value-of select="."/>
        </p>
    </xsl:template>
    <xsl:template match="tei:history/tei:provenance">
        <h5>Provenance</h5>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:provenance/tei:list">
        <p>
            <xsl:value-of select="tei:item"/>
        </p>
    </xsl:template>

    <xsl:template match="tei:listBibl">
        <section>
            <h3>bibliographie</h3>
            <xsl:apply-templates/>
        </section>
    </xsl:template>

    <xsl:template match="tei:bibl">
        <xsl:for-each select="tei:author">
            <xsl:apply-templates/>
        </xsl:for-each>
        <xsl:for-each select="tei:bibl/tei:title">
            <xsl:text>, </xsl:text>
            <i>
                <xsl:value-of select="."/>
            </i>
            <xsl:text>, </xsl:text>
        </xsl:for-each>
        <xsl:for-each select="tei:bibl/tei:pubPlace">
            <xsl:value-of select="."/>
        </xsl:for-each>
        <xsl:for-each select="tei:bibl/tei:publisher">
            <xsl:text> : </xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>, </xsl:text>
        </xsl:for-each>
        <xsl:for-each select="tei:bibl/tei:date">
            <xsl:value-of select="."/>
            <xsl:text>.</xsl:text>
        </xsl:for-each>
    </xsl:template>


    <!-- Header ends -->


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
                        </ul></div>
                    
                </div>

                <!-- fin elements de la barre de navigation dans le texte -->
                <!-- fin ce barre de navigation dans le texte -->


                <div class="col-md-7" id="contenu">
                    <xsl:element name="h1">
                        <xsl:value-of select="$title"/>
                    </xsl:element>
                    <xsl:apply-templates/>
                </div>
            </section>

            <!-- fin de mise en place d'un système de navigation -->

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
        <div class="modal fade" tabindex="-1" role="dialog" id="app">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button><h4 class="modal-title" id="myModalLabel">Apparatus</h4>
                    </div>
                    <div class="modal-body"></div>
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
            <xsl:if test="parent::tei:div[@n='1']">
                <xsl:element name="span">
                    <xsl:attribute name="class">reg</xsl:attribute>
                    <xsl:value-of select="./ancestor::tei:div[@type ='chapter']/@n"/>
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
            <xsl:text>[fol.</xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:if test="following::tei:cb[1]/@n='a'">
                <xsl:text>r</xsl:text>
            </xsl:if>
            <xsl:if test="following::tei:cb[1]/@n='c'">
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
    <!-- éléments à afficher pour la visualisation normalisée -->
    <xsl:template match="tei:lem">
                <xsl:element name="a">
                        <xsl:if test="@wit != '#A'">
                    <xsl:attribute name="class">
                        <xsl:text>reg</xsl:text>
                    </xsl:attribute>
                        </xsl:if>
                    <xsl:attribute name="data-toggle">
                        <xsl:text>modal</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="data-target">#app</xsl:attribute>
                    <xsl:apply-templates/>
                    <xsl:element name="div">
                        <xsl:attribute name="class">app</xsl:attribute>
                        <xsl:element name="ul">
                            <xsl:attribute name="class">list-unstyled</xsl:attribute>
                    <xsl:for-each
                        select="parent::tei:app/tei:rdg">
                        <xsl:element name="li">
                        <xsl:choose>
                            <xsl:when test="@wit='#A'">
                                <xsl:text>corr.</xsl:text>
                                <xsl:value-of select="@type | ."/> d'après ms. <xsl:value-of select="replace(parent::tei:app/tei:lem/@wit, '#', '')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="."/><xsl:text> [ </xsl:text><xsl:value-of select="replace(./@wit, '#', '')"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        </xsl:element>
                    </xsl:for-each>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:reg">
        <xsl:element name="span">
            <xsl:attribute name="class">reg</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:corr">
        <xsl:choose>
            <xsl:when test="@type='add'">
            <xsl:element name="span">
            <xsl:attribute name="class">reg</xsl:attribute>
            <xsl:text>[</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>]</xsl:text>
            </xsl:element></xsl:when>
            <xsl:when test="@type='del'">
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
</xsl:stylesheet>
