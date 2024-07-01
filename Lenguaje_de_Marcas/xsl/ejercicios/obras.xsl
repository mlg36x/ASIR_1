<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<style>
th{
	background-color:#1E7B05;
	color:white;
	padding:0.5em;
	}
	td{
	padding:0.5em;
	}
	tr:nth-child(even){
	background-color:#CCC;
	}
	tr:nth-child(odd){
	background-color:#FFF;
	}
	.blueColor{
	color:blue;
	}
</style>
<body>
<table border="1">
<tr>
<th>Pais</th>
<th>Año</th>
<th>titulo</th>
<th>Autor</th>
<th>Museo</th>
</tr>
<xsl:for-each select="obras/obra">
<xsl:sort select="titulo"/>
<xsl:if test="@anyo &gt; 1850">
<tr>
<td><xsl:value-of select="@pais"/></td>
<td><xsl:value-of select="@anyo"/></td>
<td><xsl:value-of select="titulo"/></td>
<td><xsl:value-of select="autor"/></td>
<td><xsl:value-of select="museo"/></td>
</tr>
</xsl:if>
</xsl:for-each>
</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>