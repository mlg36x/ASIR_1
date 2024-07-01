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
			<head>
				<meta charset="UTF-8" />
			</head>
			<body>
				<table border="1">
					<tr>
						<th>Marca</th>
						<th>Modelo</th>
						<th>Precio</th>
						<th>Web</th>
					</tr>
					<xsl:for-each select="vehiculos/vehiculo">
						<tr>
							<td>
								<xsl:value-of select="marca" />
							</td>
							<td>
								<xsl:value-of select="modelo" />
							</td>
							<td>
								<xsl:value-of select="precio" />
							</td>
							<td>
								<xsl:value-of select="web" />
							</td>
						</tr>
						<!--/xsl:sort-->
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>