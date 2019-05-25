<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Horaire ligne H</title>
            </head>
            <body>
                <h1>Liste des gares :</h1>
                <ul>
                    <xsl:for-each select="ligne_H/gares/gare">
                        <li><xsl:value-of select="."/></li>
                    </xsl:for-each>
                </ul>
                <hr/>
                <h1>Pour une gare donnée, la liste des horaires des trains qui s'y arrêtent :</h1>
                <ul>
                    <xsl:for-each select="ligne_H/gares/gare">
                        <li><xsl:value-of select="."/> :
                        <xsl:variable name="id" select="@idGare"/>
                        <xsl:for-each select="/ligne_H/trajets/trajet/horaire[@refGare=$id]">
                            <xsl:value-of select="."/> |
                        </xsl:for-each>
                        </li>
                    </xsl:for-each>
                </ul>
                <hr/>
                <h1>Nombre de trains circulant le dimanche :</h1>
                <p><xsl:value-of select="count(/ligne_H/trajets/trajet[not(@nomJour) or attribute::nomJour='D' or attribute::nomJour='SD' or attribute::nomJour='DV'])"/></p>
                <hr/>
                <h1>Pour un horaire donnée, un jour donnée et une gare donnée, le type de correspondances qui existent :</h1>
                <p><xsl:value-of select="/ligne_H/trajets/trajet[@nomJour='D']/horaire[text()='06:20' and @refGare='PaN']/parent::trajet/@nomTrain"/></p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>