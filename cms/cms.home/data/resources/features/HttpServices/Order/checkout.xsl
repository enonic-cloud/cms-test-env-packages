<xsl:stylesheet exclude-result-prefixes="portal" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html"/>

    <xsl:template match="/">

        <link href="{portal:createResourceUrl('/_public/features/features.css')}" media="screen"
        rel="stylesheet" type="text/css"/>
                
        <script src="{portal:createResourceUrl('/_public/features/scripts/contentOperations.js', ())}" type="text/javascript"><xsl:comment>//</xsl:comment></script>

        <xsl:variable name="redirect" select="portal:createPageUrl()"/>

        <form action="{portal:createServicesUrl('order', 'cart_checkout', '',())}" method="post">

            <fieldset>

                <legend>Order properties:</legend>

                <label for="categorykey">*Category key:</label>
                <input type="text"  name="categorykey" value="36"/>

                <label for="_redirect">Redirect:</label>
                <input name="_redirect" type="text" value="{portal:createPageUrl(134, ())}"/>

                <label for="showorderonredirect">showorderonredirect:</label>
                <select id="showorderonredirect" name="showorderonredirect" value="true">
                    <option value="true">true</option>
                    <option value="false">false</option>
                </select>

                <label for="showorderurl">showorderurl:</label>
                <input type="text" id="showorderurl" name="showorderurl"/>

                <label for="showorderpage">showorderpage:</label>
                <input type="text" id="showorderpage" name="showorderpage" value=""/>

                <label for="mail_sender_name">*mail_sender_name</label>
                <input type="text" id="mail_sender_name" name="mail_sender_name" value="Enonic testbench"/>

                <label for="mail_sender_email">*mail_sender_email</label>
                <input type="text" id="mail_sender_email" name="mail_sender_email" value="rmy@enonic.com"/>

                <label for="shopmanager_email">shopmanager_email</label>
                <input type="text" id="shopmanager_email"  name="shopmanager_email" value=""/>

                <label for="shopmanager_name">shopmanager_name</label>
                <input type="text" id="shopmanager_name" name="shopmanager_name " value=""/>

                <label for="mail_subject">*mail_subject</label>
                <input type="text" id="mail_subject" name="mail_subject"
                    value="Order generated from versiontest-bench"/>

                <label for="mail_message">*mail_message:</label>
                <textarea rows="10" cols="25" name="mail_message"> Order
                    --------------------------\n Order no.: %order_id%\n Order date: %order_date%\n
                    Order reference: %order_reference%\n Customer information\n
                    --------------------------\n Customer no.: %customer_refno%\n Name:
                    %customer_firstname% %customer_surname%\n E-mail: %customer_email%\n Company:
                    %customer_company%\n Phone: %customer_telephone%\n \n Delivery address\n
                    \---------------------------\n Address:\n %shipping_postaladdress%\n Location:
                    %shipping_postalcode% %shipping_location%\n State: %shipping_state%\n Country:
                    %shipping_country%\n Delivery option: %details_shippingoptions%\n Comments:
                    %details_comments%\n \n Invoice address\n \---------------------------\n
                    Address:\n %billing_postaladdress%\n Location: %billing_postalcode%
                    %billing_location%\n State: %billing_state%\n Country: %billing_country%\n \n
                    Item name Prod.no. Count\n
                    \----------------------------------------------------------------------------\n
                    %order_items%
                    \----------------------------------------------------------------------------\n </textarea>

                <label for="mail_order_item">*mail_order_item:</label>
                <input type="text" id="mail_order_item" name="mail_order_item"
                    value="%item_productname(30,l)% %item_productnumber(15,l)% %item_count(4,c)%\\n"/>

                <label for="order_reference">order_reference:</label>
                <input type="text" id="order_reference"  name="order_reference"/>
            </fieldset>
            
                <fieldset>
                <legend>Customer info:</legend>
                    <label for="customer_refno">customer_refno:</label>
                    <input type="text" id="customer_refno" name="customer_refno"/>

                <label for="customer_firstname">*customer_firstname:</label>
                    <input type="text" id="customer_firstname" name="customer_firstname" value="Runar"/>

                <label for="customer_surname">*customer_surname:</label>
                    <input type="text" id="customer_surname"  name="customer_surname" value="Myklebust"/>

                <label for="customer_email">*customer_email:</label>
                    <input type="text" id="customer_email" name="customer_email" value="rmy@enonic.com"/>


                <label for="customer_company">customer_company:</label>
                    <input type="text" id="customer_company"  name="customer_company"/>

                <label for="customer_telephone">customer_telephone:</label>
                    <input type="text" id="customer_telephone"  name="customer_telephone"/>

            </fieldset>
            <fieldset>
                <legend>Shipping:</legend>
                

                <label for="shipping_postaladdress">shipping_postaladdress:</label>
                <input type="text" id="shipping_postaladdress" name="shipping_postaladdress"/>

                <label for="shipping_postalcode">shipping_postalcode:</label>
                <input type="text" id="shipping_postalcode" name="shipping_postalcode"/>

                <label for="shipping_location">shipping_location:</label>
                <input type="text" id="shipping_location" name="shipping_location"/>

                <label for="shipping_state">shipping_state:</label>
                <input type="text" id="shipping_state"  name="shipping_state"/>

                <label for="shipping_country">shipping_country:</label>
                <input type="text" id="shipping_country" name="shipping_country"/>

                <label for="details_shippingoptions">details_shippingoptions:</label>
                <input type="text" id="details_shippingoptions" name="details_shippingoptions"/>

                <label for="details_comments">details_comments:</label>
                <input type="text" id="details_comments" name="details_comments"/>
            </fieldset>
            <fieldset>
                 <legend>Billing:</legend>
                <label for="billing_postaladdress">billing_postaladdress:</label>
                <input type="text"  name="billing_postaladdress"/>

                <label for="billing_postalcode">billing_postalcode:</label>
                <input type="text"  name="billing_postalcode"/>

                <label for="billing_location">billing_location:</label>
                <input type="text"  name="billing_location"/>

                <label for="billing_state">billing_state:</label>
                <input type="text"  name="billing_state"/>

                <label for="billing_country">billing_country :</label>
                <input type="text"  name="billing_country"/>

            </fieldset>

            <fieldset>
                
                <xsl:if test="/result/context/querystring/parameter[@name = 'error_order_cart_checkout']">
                    <xsl:variable name="errorCode"
                        select="/result/context/querystring/parameter[@name = 'error_order_cart_checkout']"/>
                    
                    <p class="formError"> An error occured: <xsl:value-of select="$errorCode"/>
                        <xsl:text> - </xsl:text>
                        <xsl:choose>
                            <xsl:when test="$errorCode='405'">Invalid CAPTCHA</xsl:when>
                        </xsl:choose>
                    </p>
                </xsl:if>
                
                <label for="">Type text from image:</label>
                <input name="{portal:createCaptchaFormInputName()}" type="text" value=""/>
                
                <p style="clear">
                    <img src="{portal:createCaptchaImageUrl()}"/>
                </p>
                
            </fieldset>
           
            <input type="submit" value="cart_checkout"/>

        </form>

    </xsl:template>

</xsl:stylesheet>
