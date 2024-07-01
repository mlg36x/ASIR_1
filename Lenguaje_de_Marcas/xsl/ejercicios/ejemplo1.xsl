<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
<meta charset="UTF-8"/>
</head>
<body>
<h2>
<xsl:value-of select="pelicula/titulo"/>
</h2>
<p>
<xsl:value-of select="pelicula/argumento"/>
</p>
</body>
</html>
</xsl:template>
</xsl:stylesheet>