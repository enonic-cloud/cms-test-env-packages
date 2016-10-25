<xsl:stylesheet exclude-result-prefixes="portal" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html"/>

    <xsl:template match="/">
        
        <link href="{portal:createResourceUrl('/_public/features/features.css')}" media="screen"
            rel="stylesheet" type="text/css"/>
        <script src="{portal:createResourceUrl('/_public/features/scripts/contentOperations.js', ())}" type="text/javascript"><xsl:comment>//</xsl:comment></script>

        <xsl:apply-templates select="/result/contents"/>

    </xsl:template>

    <xsl:template match="contents">

     <h3>Product list:</h3>

        <table class="productlist">
            <th>Product Number</th>
            <th>Name</th>
            <th>Price</th>
            <th colspan="3">Operations</th>

            <xsl:for-each select="content">
                <tr>
                    <td>
                        <xsl:value-of select="contentdata/number"/>
                    </td>
                    <td>
                        <xsl:value-of select="title"/>
                    </td>
                    <td>
                        <xsl:value-of select="contentdata/price"/>
                    </td>
                    <td>
                        <form action="{portal:createServicesUrl('order', 'cart_add','',())}" method="post">
                            <input type="hidden" name="productid"  value="{@key}"/>
                            <input type="hidden" name="count" value="1"/>    
                            <input type="submit" value="cart_add"/>
                        </form>
                    </td>
                </tr>

            </xsl:for-each>
        </table>


    </xsl:template>

</xsl:stylesheet>
