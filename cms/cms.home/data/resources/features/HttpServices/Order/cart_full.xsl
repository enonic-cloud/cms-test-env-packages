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

    <xsl:template match="shoppingcart">
        <p>
            <div class="cartfull">
                <h4>Shoppingcart (full):</h4>

                <xsl:if test="not(item)"> Empty </xsl:if>

                <xsl:if test="item">
                    <table class="cartfull">
                        <th>Product id</th>
                        <th>Number</th>
                        <th>Price</th>
                        <th>Count</th>
                        <th/>
                        <xsl:for-each select="item">
                            <tr>
                                <td>
                                    <xsl:value-of select="@productid"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@productnumber"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@subtotal"/>
                                </td>

                                <td>
                                    <form
                                        action="{portal:createServicesUrl('order', 'cart_update','',())}"
                                        method="post">
                                        <input type="hidden" name="productid" value="{@productid}"/>
                                        <input type="text" name="count" size="2" value="{@count}"/>
                                        <input type="submit" value="cart_update"/>
                                    </form>
                                </td>
                                <td>
                                    <form
                                        action="{portal:createServicesUrl('order', 'cart_remove','',())}"
                                        method="post">
                                        <input type="hidden" name="productid" value="{@productid}"/>
                                        <input type="submit" value="cart_remove"/>
                                    </form>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <tr>
                            <td colspan="5">
                                <hr/>
                            </td>
                        </tr>
                        <tr>
                            <td>Total items:</td>
                            <td>
                                <xsl:value-of select="@count"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Sum:</td>
                            <td>
                                <xsl:value-of select="@total"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <hr/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <form
                                    action="{portal:createServicesUrl('order', 'cart_empty','',())}"
                                    method="post">
                                    <input type="submit" value="cart_empty"/>
                                </form>
                            </td>
                            <td>
                                <a href="{portal:createPageUrl(132, ())}">Proceed to checkout</a>
                            </td>
                        </tr>

                    </table>
                </xsl:if>
            </div>
        </p>
    </xsl:template>

</xsl:stylesheet>
