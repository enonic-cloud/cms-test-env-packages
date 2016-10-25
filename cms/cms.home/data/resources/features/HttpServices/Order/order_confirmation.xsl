<xsl:stylesheet exclude-result-prefixes="portal" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    
    <xsl:template match="/">
        
        <link href="{portal:createResourceUrl('/_public/features/features.css')}" media="screen"
            rel="stylesheet" type="text/css"/>
        <script src="{portal:createResourceUrl('/_public/features/scripts/contentOperations.js', ())}" type="text/javascript"><xsl:comment>//</xsl:comment></script>
        
         <h3>Order confirmation:</h3>
       
           <xsl:apply-templates select="/result/contents/content"/>
       
        </xsl:template>
    
        <xsl:template match="content">
            
            <table class="productlist">
                <tr>
                    <td>Status:</td><td><xsl:value-of select="contentdata/status"></xsl:value-of></td>
                </tr>
            
                <tr>
                    <td>Orderreference:</td><td><xsl:value-of select="contentdata/orderreference"></xsl:value-of></td>
                </tr>
                <tr>
                    <td>Items:</td><td><xsl:value-of select="contentdata/items/@count"></xsl:value-of></td>
                </tr>
                <tr>
                    <td>Receipt sent to:</td><td><xsl:value-of select="contentdata/customer/email"></xsl:value-of></td>
                </tr>
                </table>
            
        </xsl:template>
    
</xsl:stylesheet>
