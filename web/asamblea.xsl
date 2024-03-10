<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="about:legacy-compat" encoding="utf-8"/>
<xsl:template match='/eventos'>
<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Club de montaña" />
			<a href="asamblea.xml">Asamblea</a>
			<a href="excursiones.xml">Excursiones</a>
			<a href="carreras.xml">Carreras</a>
			<a href="noticias.xml">Noticias</a>
			<a href="contacto.xml">Contacto</a>
		</header>
		
		<main class="principal">
			<section class="asamblea">
        		<!-- Seleccionamos las asambleas a las que queremos aplicar la plantilla -->
                <xsl:apply-templates select="asamblea">
                    <!-- Las ordenamos por fecha de menos reciente a más -->
                    <xsl:sort select="convocatoria/fecha" order="ascending" />
                </xsl:apply-templates>
			</section>
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

<!-- Plantilla para las asambleas-->
<xsl:template match="asamblea">
    <xsl:variable name="fc" select="convocatoria/fecha"/>
        <!-- Seleccionamos solo la última -->
        <xsl:if test="position()=last()">
            <h1>ASAMBLEA</h1>
            <p>El <xsl:value-of select='$fc' /> celebraremos una asamblea <xsl:value-of select='convocatoria/@tipo' />.</p>
            <p>Los temas a tratar serán:</p>
            <ol>
                <!-- Seleccionamos los temas y les aplicamos la plantilla correspondiente. -->
                <xsl:apply-templates select="orden_dia/tema" />
            </ol>
            <p>Te esperamos</p>
        </xsl:if>   
</xsl:template>

<!-- Plantilla para los temas-->
<xsl:template match="tema">
	<li><xsl:value-of select='.' /></li>
</xsl:template>
</xsl:stylesheet>