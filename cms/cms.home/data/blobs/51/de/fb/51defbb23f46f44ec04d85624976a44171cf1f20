<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      
      <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>
      
      <xsl:include href="../../includes/displayContext.xsl"/>
      
      <xsl:variable name="redirect" select="portal:createPageUrl()"/>
      
      
      <xsl:template match="/">
            
            <link href="{portal:createResourceUrl('/_public/features/features.css')}" media="screen"
                  rel="stylesheet" type="text/css"/>
            <script src="{portal:createResourceUrl('/_public/features/scripts/contentOperations.js', ())}" type="text/javascript"><xsl:comment>//</xsl:comment></script>
            
            
            <fieldset>
                  <legend>Cart for captcha</legend>
                  
                        <xsl:apply-templates select="/result/contents"/> 
                        <xsl:apply-templates select="/result/contentobject/shoppingcart"/>
            </fieldset>
            
            <fieldset>
                  
                  <legend>Captcha test</legend>
                  <xsl:if test="/result/context/querystring/parameter[@name = 'error_order_cart_checkout']">
                        <xsl:variable name="errorCode"
                              select="/result/context/querystring/parameter[@name = 'error_order_cart_checkout']"/>
                        
                        <p class="formError"> An error occured: <xsl:value-of select="$errorCode"/>
                              <xsl:text> - </xsl:text>
                              <xsl:choose>
                                    <xsl:when test="$errorCode='405'">Invalid CAPTCHA</xsl:when>
                                    <xsl:when test="$errorCode='100'">The shopping cart is empty </xsl:when>
                                    <xsl:when test="$errorCode='101'">Failed to get product </xsl:when>
                              </xsl:choose>
                        </p>
                  </xsl:if>
      
                  <xsl:choose>
                        <xsl:when test="portal:isCaptchaEnabled('order', 'cart_checkout') = 'true'">
                              <form action="{portal:createServicesUrl('order','cart_checkout', $redirect, ())}" id="form" method="post">
                                    
                                    <label for="">Type text from image:</label>
                                    <input name="{portal:createCaptchaFormInputName()}" type="text" value=""/>
                                    
                                    <input type="hidden" id="deviceclass" name="deviceclass" value="screen"/>     
                                    <input type="hidden"  name="categorykey" value="36"/>
                                    <input type="hidden" id="mail_sender_name" name="mail_sender_name" value="Enonic testbench"/>
                                    <input type="hidden" id="mail_sender_email" name="mail_sender_email" value="rmy@enonic.com"/>
                                    <input type="hidden" id="mail_subject" name="mail_subject"
                                                value="Order generated from versiontest-bench ( Features - Captcha support )"/>
                                    <input type="hidden" name="mail_message" value="Captcha succeeded"/>
                                    <input type="hidden" id="mail_order_item" name="mail_order_item"
                                                value="%item_productname(30,l)% %item_productnumber(15,l)% %item_count(4,c)%\\n"/>
                                    <input type="hidden" id="customer_firstname" name="customer_firstname" value="Runar"/>
                                    <input type="hidden" id="customer_surname"  name="customer_surname" value="Myklebust"/>
                                    <input type="hidden" id="customer_email" name="customer_email" value="rmy@enonic.com"/>
                                    
                                    <br/>
                                    
                                    <p style="clear">
                                          <img src="{portal:createCaptchaImageUrl()}"/>
                                    </p>
                                    
                                    
                                    
                                    <label for="captcha">Test captcha</label>
                                    <input type="submit" value="Ok" name="captcha"/>
                              </form>
                        </xsl:when>
                        <xsl:otherwise>
                              Captcha not enabled for order:cart_checkout
                        </xsl:otherwise>
                  </xsl:choose>
                  
            </fieldset>
            
            <fieldset>
                  
                  <legend>Captcha test - service and operation not enabled</legend>
                  
                  <xsl:choose>
                        <xsl:when test="portal:isCaptchaEnabled('poll', 'update') = 'true'">
                        </xsl:when>
                        <xsl:otherwise>
                              Captcha not enabled for poll-update
                        </xsl:otherwise>
                  </xsl:choose>
                  
            </fieldset>

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
                                    <form action="{portal:createServicesUrl('order', 'cart_add',$redirect,())}" method="post">
                                          <input type="hidden" name="productid"  value="{@key}"/>
                                          <input type="hidden" name="count" value="1"/>    
                                          <input type="submit" value="cart_add"/>
                                    </form>
                              </td>
                        </tr>
                        
                  </xsl:for-each>
            </table>
            
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
