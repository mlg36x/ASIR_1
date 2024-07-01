<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8" />
            </head>
            <body>
                <xsl:for-each select="receta/ingrediente">
                    <ul>
                        <li>
                            <xsl:value-of select="@nombre" />
                        </li>
                    </ul>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>   
