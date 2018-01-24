<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

    <xsl:output method="xml"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                omit-xml-declaration="yes"
                encoding="UTF-8"
                indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>futboliza.me</title>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <meta charset="utf-8"/>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <xsl:apply-templates select="/data/entries" mode="descripcion"/>
                <link rel="stylesheet" href="{$workspace}/css/futbolizame.css" media="all"/>
                <script src="{$workspace}/js/imagen.js" type="text/javascript"/>
            </head>
            <body>
                <xsl:apply-templates select="/data/entries"/>
                <script src="{$workspace}/js/ga.min.js" type="text/javascript"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="/data/entries">
        <div class="entry">
            <xsl:apply-templates select="entry"/>
        </div>
        <div class="pie">
            <xsl:apply-templates select="entry" mode="paginator"/>
            <xsl:apply-templates select="entry" mode="fecha"/>
        </div>
        <!--div class="busqueda">
            <div class="gcse-search"></div>
        </div-->
    </xsl:template>

    <xsl:template match="/data/entries" mode="descripcion">
        <xsl:apply-templates select="entry" mode="descripcion"/>
    </xsl:template>

    <xsl:template match="/data/entries/entry">
        <h1>
            <xsl:value-of select="titulo"/>
        </h1>
        <div class="contenido" id="contenido">
	        <xsl:copy-of select="texto/*"/>
	        <!--xsl:choose>
	            <xsl:when test="contenido">
                </xsl:when>
                <xsl:when test="imagen">
                    <script>imagen('<xsl:value-of select="$root"/>','<xsl:value-of select="concat(imagen/@path, imagen/filename)"/>');
                    </script>
                </xsl:when>
                <xsl:when test="video">

                </xsl:when>
            </xsl:choose-->
        </div>
    </xsl:template>

    <xsl:template match="/data/entries/entry" mode="descripcion">
        <meta name="description" content="{concat('futboliza.me - ', titulo)}"/>
    </xsl:template>

    <xsl:template match="/data/entries/entry" mode="fecha">
        <p class="id">
            Entrada&#58;&#160;<xsl:value-of select="@id"/>
        </p>
        <xsl:call-template name="fecha">
            <xsl:with-param name="fecha" select="system-date"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="/data/entries/entry" mode="paginator">
        <xsl:variable name="myid" select="@id"/>
        <xsl:apply-templates select="/data/entries-todos/entry[@id &lt; $myid][1]">
            <xsl:with-param name="texto">Anterior</xsl:with-param>
        </xsl:apply-templates>
        <xsl:apply-templates select="/data/entries-todos/entry[@id &gt; $myid][last()]">
            <xsl:with-param name="texto">Siguiente</xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="/data/entries-todos/entry">
        <xsl:param name="texto"/>
        <p>
            <a href="{$root}/{titulo/@handle}">
                <xsl:value-of select="$texto"/>&#58;&#160;<xsl:value-of select="titulo"/>
            </a>
        </p>
    </xsl:template>

    <xsl:template name="fecha">
        <xsl:param name="fecha"/>
        <p class="fecha">
            Creado:
            <xsl:call-template name="fecha-formato">
                <xsl:with-param name="fecha" select="$fecha/created"/>
            </xsl:call-template>
            &#160;Modificado:
            <xsl:call-template name="fecha-formato">
                <xsl:with-param name="fecha" select="$fecha/modified"/>
            </xsl:call-template>
        </p>
    </xsl:template>

    <xsl:template name="fecha-formato">
        <xsl:param name="fecha"/>
        <xsl:value-of
                select="concat(substring($fecha/@iso, 9, 2), '/', substring($fecha/@iso, 6, 2), '/', substring($fecha/@iso, 1, 4))"/>&#160;<xsl:value-of
            select="$fecha/@time"/>
    </xsl:template>

</xsl:stylesheet>
