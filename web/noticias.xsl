<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="about:legacy-compat" encoding="utf-8"/>
<xsl:template match='/rss/channel'>
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
		
		<main>
			<h1>NOTICIAS</h1>
				<xsl:for-each select="item">
					<article class="noticias">
						<h4><xsl:value-of select='title' /></h4>
						<time><xsl:value-of select='pubDate' /></time>
						<p><xsl:value-of select='description' /></p>
						<form action="{link}" target="_blank">
							<input type="submit" class="btnInfo" value="Seguir leyendo" />
						</form>
					</article>
				</xsl:for-each>
		</main>

		<footer>
			<address>&#169; 2020 desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>		
</xsl:stylesheet>