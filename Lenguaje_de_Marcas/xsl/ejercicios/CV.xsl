<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <style>
                td{
                padding: 15px;
                text-align: left;
                vertical-align:middle;
                font-weight: 300;
                font-size: 12px;
                color: #fff;
                border-bottom: solid 1px rgba(255,255,255,0.1);
                }
                body{
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 20 px;
                background: -webkit-linear-gradient(left, #25c481, #25b7c4);
                background: linear-gradient(to right, #25c481, #25b7c4);
                font-family: 'Roboto', sans-serif;
                }
            </style>
            <head>
                <meta charset="UTF-8" />
            </head>
            <body>
                <div>
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td>Nombre completo</td>
                            <td>
                                <xsl:value-of select="datos/nombre" />
                            </td>
                        </tr>
                        <tr>
                            <td>Número de teléfono</td>
                            <td>
                                <xsl:value-of select="datos/telefono" />
                            </td>
                        </tr>
                        <tr>
                            <td>Formación Académica</td>
                            <td>
                                <xsl:value-of select="datos/formacion/@titulo" />
                            </td>
                            <td> Centro: <xsl:value-of select="datos/formacion/@centro" /></td>
                            <td> Año finalización: <xsl:value-of select="datos/formacion/@anyofin" /></td>

                        </tr>
                        <tr>
                            <td>Experiencia profesional</td>
                            <td> Puesto: <xsl:value-of select="datos/experiencia/@puesto" />
                            </td>
                            <td> Empresa: <xsl:value-of select="datos/experiencia/@empresa" />
                            </td>
                            <td> Año comienzo:<xsl:value-of select="datos/experiencia/@puesto" />
                            </td>
                            <td> Año finalización: <xsl:value-of select="datos/experiencia/@puesto" />
                            </td>
                        </tr>

                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
