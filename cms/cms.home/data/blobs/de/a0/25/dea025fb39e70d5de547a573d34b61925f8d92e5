<xsl:stylesheet exclude-result-prefixes="portal" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html"/>

    <xsl:template match="/">

        <link href="{portal:createResourceUrl('/_public/features/features.css')}" media="screen"
            rel="stylesheet" type="text/css"/>
        <script src="{portal:createResourceUrl('/_public/features/scripts/contentOperations.js', ())}" type="text/javascript"><xsl:comment>//</xsl:comment></script>

        <xsl:apply-templates select="/result/contentobject/shoppingcart"/>

    </xsl:template>

    <xsl:template match="shoppingcart">€
        <table class="cartsummary">
            <tr><th colspan="2">Shoppingcart (summary):</th></tr>
            <tr>
                <td>Total items:</td>
                <td><xsl:value-of select="@count"/></td>
            </tr>
            <tr>
                <td>Sum:</td>
                <td><xsl:value-of select="@total"/></td>
            </tr>
        </table>
    </xsl:template>

</xsl:stylesheet>
