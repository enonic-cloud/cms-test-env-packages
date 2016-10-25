<xsl:stylesheet exclude-result-prefixes="portal" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html"/>

    <xsl:template match="/">

        <h3>Content Sendmail: Send</h3>

        <link href="{portal:createResourceUrl('/_public/features/features.css')}" media="screen"
            rel="stylesheet" type="text/css"/>
        <script src="{portal:createResourceUrl('/_public/features/scripts/contentOperations.js', ())}" type="text/javascript"><xsl:comment>//</xsl:comment></script>

        <xsl:if test="/result/context/querystring/parameter[@name = 'error_content_sendmail_send']">

            <xsl:variable name="errorCode"
                select="/result/context/querystring/parameter[@name = 'error_content_sendmail_send']"/>

            <p class="formError"> An error occured: <xsl:value-of select="$errorCode"/>
                <xsl:text> - </xsl:text>
                <xsl:choose>
                    <xsl:when test="$errorCode='100'">Missing receipient e-mail</xsl:when>
                    <xsl:when test="$errorCode='101'">Error in receipient e-mail, missing
                        '@'</xsl:when>
                    <xsl:when test="$errorCode='102'">Error in receipient e-mail, missing at least
                        one '.'</xsl:when>
                    <xsl:when test="$errorCode='103'">Missing "from"-parameter</xsl:when>
                    <xsl:when test="$errorCode='104'">Missing "to"-parameter</xsl:when>
                    <xsl:when test="$errorCode='105'">Missing "subject"-parameter</xsl:when>
                    <xsl:when test="$errorCode='150'">Missing category key</xsl:when>
                </xsl:choose>
            </p>

        </xsl:if>

        <xsl:variable name="categorykey" select="45"/>

        <xsl:variable name="pageId" select="/result/context/querystring/parameter[@name='id']"></xsl:variable>
        <xsl:variable name="redirect" select="portal:createPageUrl($pageId, ())"/>
      
        <form action="{portal:createServicesUrl('content_sendmail','send', $redirect, ())}"
            method="post" enctype="multipart/form-data">

            <fieldset>
                <legend>Content:</legend>
                <label for="categorykey">Categorykey:</label>
                <input type="text" name="categorykey" value="{$categorykey}"/>

                <label for="name">Product name</label>
                <input type="text" name="name" value="a new product"/>

                <label for="number">Product Number:</label>
                <input type="text" name="number" value="product number here"/>

                <label for="product_price">Price</label>
                <input type="text"  name="product_price" value="4550"/>

                <label for="product_body">Product Description:</label>
                <input type="text"  name="product_body" value="A nice product"/>

                <label for="product_body">Product Attachment:</label>
                <input type="file"  name="product_file" />
                
            </fieldset>
            <fieldset>
                <legend>Mail properties:</legend>
                <label for="to">To:</label>
                <input type="text"  name="to" value="rmy@myklebust.me"/>
                
                <label for="cc">cc:</label>
                <input type="text"  name="cc" value="runar@myklebust.me"/>
                
                <label for="cc">cc:</label>
                <input type="text"  name="cc" value="bogus@myklebust.me"/>
                
                <label for="bcc">bcc:</label>
                <input type="text"  name="bcc" value="bcc@myklebust.me"/>
                
                <label for="subject">subject</label>
                <input type="text"  name="subject"
                    value="Testmail fra versiontest testpage"/>

                <label for="sort_order">sort_order:</label>
                <input type="text"  name="sort_order"
                    value="from_name,from_email,a_text,comment"/>
            </fieldset>
            
            <fieldset>
                <legend>Mail:</legend>
                <label for="from_name">From name:</label>
                <input type="text" name="from_name"/>

                <label name="from_email">From e-mail:</label>
                <input type="text" name="from_email"/>
                
                <label name="comment">Comment:</label>
                <textarea name="comment"/>
                
                
            </fieldset>
                
            <input type="submit" name="submit" value="sendmail_send"/>
            
        </form>

    </xsl:template>

</xsl:stylesheet>
