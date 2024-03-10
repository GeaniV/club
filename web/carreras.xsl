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
		
		<section class="carreras">
			<h1>Carreras hasta 15 km</h1>
			<!-- Seleccionamos las carreras que queremos y les aplicamos la plantilla correspondiente -->
            <xsl:apply-templates select="carrera[kilometros&lt;15]"></xsl:apply-templates>
		</section>
		
		<section class="carreras">
			<h1>Carreras de más de 15 km</h1>
			<!-- Seleccionamos las carreras que queremos y les aplicamos la plantilla correspondiente -->
            <xsl:apply-templates select="carrera[kilometros&gt;15]"></xsl:apply-templates>
		</section>
		
		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>	
<!-- Plantilla para las carreras. En este caso, se usa la misma para las 2 selecciones -->
<xsl:template match="carrera">
    <!-- Mostramos solo las 3 primeras para cumplir con la maquetación -->
    <xsl:if test="position()&lt;4">
        <article>
            <!-- Usamos las {} para combinar codigo HTML y XSLT -->
            <a href="{informacion}">
                <img src="../img/{img}" alt="{nombre}" />
                <p class="texto"><xsl:value-of select='nombre' /> </p>
            </a>
        </article>
    </xsl:if>
</xsl:template>	
</xsl:stylesheet>