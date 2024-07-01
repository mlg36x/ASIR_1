<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<style>
th{
	background-color:blue;
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
</style>
<body>
<table border="1">
<tr>
<th>Concepto</th>
<th>Importe</th>
</tr>
<xsl:value-of select="//mes"/>
<xsl:for-each select="gastos/gasto">
<xsl:sort select="concepto"/>
<xsl:if test="./@desgravable='si'">
<tr>
<td><xsl:value-of select="concepto"/></td>
<td><xsl:value-of select="importe"/></td>
</tr>
</xsl:if>
</xsl:for-each>
</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>