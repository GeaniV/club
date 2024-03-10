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
		
		<section class="excursiones">
			<h1>Excursiones</h1>
			<!-- Contamos las excursiones que hay dentro de "eventos" -->
			<h2>Total: <xsl:value-of select='count(excursion)' /></h2>
			<table>
				<tr>
					<th>RUTA</th>
					<th>FECHA</th>
					<th>PRECIO</th>
					<th>DIFICULTAD</th>
				</tr>
        <!-- Seleccionamos las excursiones que queremos mostrar y les aplicamos la plantilla correspondiente -->
				<xsl:apply-templates select="excursion" />

			</table>			
		</section>
		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

<!-- Plantilla para las excursiones -->
<xsl:template match="excursion">
	<tr>
    <!-- Mostramos el nombre de la ruta, su fecha y el precio con IVA
		Podemos usar el método format-number() para visualizar solo 2 decimales -->
		<td><xsl:value-of select='ruta' /></td>
		<td><xsl:value-of select='salida/@dia' /></td>
		<td><xsl:value-of select='format-number(precio*1.21, "#.00")' />€</td>
		<td>
      <!-- En función de la dificultad, aplicamos formatos diferentes 
			Como td se repite en todas las opciones se queda fuera -->
			<xsl:choose>
				<xsl:when test='@dificultad="baja"'>
					<span class="dificultad verde"><xsl:value-of select='@dificultad' /></span>
				</xsl:when>
				<xsl:when test='@dificultad="media"'>
				  <span class="dificultad naranja"><xsl:value-of select='@dificultad' /></span>
				</xsl:when>
				<xsl:when test='@dificultad="alta"'>
				  <span class="dificultad rojo"><xsl:value-of select='@dificultad' /></span>
				</xsl:when>
			</xsl:choose>
		</td>
	</tr>
</xsl:template>

</xsl:stylesheet>