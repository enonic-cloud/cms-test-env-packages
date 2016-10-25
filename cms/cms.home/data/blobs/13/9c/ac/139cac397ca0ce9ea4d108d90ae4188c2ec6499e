<xsl:stylesheet exclude-result-prefixes="portal" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html"/>
    
    <xsl:template match="/">
        
        <h3>Content Sendmail: Send</h3>
         
        <link href="{portal:createResourceUrl('/_public/features/features.css')}" media="screen"
            rel="stylesheet" type="text/css"/>
        <script src="{portal:createResourceUrl('/_public/features/scripts/contentOperations.js', ())}" type="text/javascript"><xsl:comment>//</xsl:comment></script>
        
    
    
        <xsl:variable name="categorykey" select="45"/>
        
        <xsl:variable name="redirect" select="portal:createPageUrl(136, ())"/>
        <form action="{portal:createServicesUrl('content_sendmail','send', $redirect, ())}" method="post" enctype="multipart/form-data">
            
            <table class="productlist">
                <tr>
                    <td>categorykey:</td>
                    <td>
                        <xsl:value-of select="$categorykey"></xsl:value-of><input type="hidden" name="categorykey" value="{$categorykey}"/>
                    </td>
                </tr>
                <tr>
                    <td>Subject:</td>
                    <td>
                        <input type="text" size="57" name="subject" value="a test"/>
                    </td>
                </tr>
                <tr>
                    <td>Title:</td>
                    <td>
                        <input type="text" size="57" name="title" value="This is the title"/>
                    </td>
                </tr>
                <tr>
                    <td>To:</td>
                    <td>
                        <input type="text" size="57" name="to" value="rmy@enonic.com"/>
                    </td>
                </tr>
                <tr>
                    <td>cc:</td>
                    <td>
                        <input type="text" size="57" name="cc" value="runar@myklebust.me"/>
                    </td>
                </tr>
                <tr>
                    <td>cc:</td>
                    <td>
                        <input type="text" size="57" name="cc" value="bogus@myklebust.me"/>
                    </td>
                </tr>
                <tr>
                    <td>bcc:</td>
                    <td>
                        <input type="text" size="57" name="bcc" value="bcc@myklebust.me"/>
                    </td>
                </tr>
                <tr>
                    <td>subject</td>
                    <td>
                        <input type="text" size="57" name="subject"
                            value="Testmail fra versiontest testpage"/>
                    </td>
                </tr>
                <tr>
                    <td>sort_order:</td>
                    <td>
                        <input type="text" size="57" name="sort_order"
                            value="from_name,from_email,a_text,comment"/>
                    </td>
                </tr>
                <tr>
                    <th colspan="2">Send a mail:</th>
                </tr>
                <tr>
                    <td> Name:</td>
                    <td>
                        <input name="from_name"/>
                    </td>
                </tr>
                <tr>
                    
                    <td>E-mail:</td>
                    <td>
                        <input name="from_email"/>
                    </td>
                </tr>
                <tr>
                    <td> A text:</td>
                    <td>
                        <input type="text" name="a_text" size="25"/>
                    </td>
                </tr>
                <tr>
                    <td> A text (2): </td>
                    <td>
                        <input type="text" name="a_text" size="25"/>
                    </td>
                </tr>
                <tr>
                    <td> Comment:</td>
                    <td>
                        <textarea name="comment" rows="6" cols="25"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" name="submit" value="sendmail_send"/>
                    </td>
                </tr>
                
            </table>
            
        </form>
        
    </xsl:template>
    
</xsl:stylesheet>