<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei" version="2.0">

    <xsl:strip-space elements="*"/>
    <xsl:output method="html"/>
    <xsl:strip-space elements="tei:app"/>

    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>

        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <title>Table des abréviations</title>
                <link rel="stylesheet" href="../css/bootstrap.min.css"/>
                <link rel="stylesheet" type="text/css" href="../css/theme.css"/>
                <script src="../js/jquery.min.js"/>
                <script src="../js/bootstrap.min.js"/>
                <script src="../js/normalisation.js"/>
            </head>
            <body>







                <article id="text" class="tab-pane active">
                    <section class="row">
                        <xsl:apply-templates/>
                    </section>
                </article>




            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
