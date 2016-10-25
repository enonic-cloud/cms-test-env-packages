<xsl:stylesheet exclude-result-prefixes="portal" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html"/>
    <xsl:param name="redirect_success_page">
        <type>page</type>
    </xsl:param>
    <xsl:param name="redirect_failure_page">
        <type>page</type>
    </xsl:param>

    <xsl:template match="/">

        <link href="{portal:createResourceUrl('/_public/features/features.css')}" media="screen"
            rel="stylesheet" type="text/css"/>
        <script src="{portal:createResourceUrl('/_public/features/scripts/contentOperations.js', ())}" type="text/javascript"><xsl:comment>//</xsl:comment></script>

        <h3>Sendmail send</h3>

        <xsl:if test="/result/context/querystring/parameter[@name = 'error_sendmail_send']">

            <xsl:variable name="errorCode"
                select="/result/context/querystring/parameter[@name = 'error_sendmail_send']"/>

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
                </xsl:choose>
            </p>

        </xsl:if>

        <xsl:variable name="pageId" select="/result/context/querystring/parameter[@name='id']"/>
        <xsl:variable name="redirect" select="portal:createPageUrl($pageId, ())"/>

        <form action="{portal:createServicesUrl('sendmail','send', $redirect, ())}" method="post">
            <fieldset>
                <legend>Mail properties</legend>
                <label for="to">To:</label>
                <input type="text" size="57" name="to" id="to" value="rmy@enonic.com"/>
                <input type="button" class="button"
                    onclick="toggleFormInput(this, 'enable', 'disable');" value="disable"/>

                <label for="cc">cc:</label>
                <input type="text" size="57" name="cc" id="cc" value="runar@myklebust.me"/>
                <input type="button" class="button"
                    onclick="toggleFormInput(this, 'enable', 'disable');" value="disable"/>

                <label for="cc2">cc:</label>
                <input type="text" size="57" name="cc" id="cc2" value="bogus@myklebust.me"/>
                <input type="button" class="button"
                    onclick="toggleFormInput(this, 'enable', 'disable');" value="disable"/>

                <label for="bcc">bcc:</label>
                <input type="text" size="57" name="bcc" id="bcc" value="bcc@myklebust.me"/>
                <input type="button" class="button"
                    onclick="toggleFormInput(this, 'enable', 'disable');" value="disable"/>

                <label for="subject">subject</label>
                <input type="text" size="57" name="subject" id="subject"
                value="Testmail fra versiontest testpage"/>
                <input type="button" class="button"
                    onclick="toggleFormInput(this, 'enable', 'disable');" value="disable"/>

                <label for="sort_order">sort_order:</label>
                <input type="text" size="57" name="sort_order" id="sort_order"
                value="from_name,from_email,a_text,comment"/>
                <input type="button" class="button"
                    onclick="toggleFormInput(this, 'enable', 'disable');" value="disable"/>
            </fieldset>

            <fieldset>
                <legend>Mail:</legend>

                <label for="from_name"> from_name:</label>
                <input type="text" id="from_name" name="from_name"/>
                <input type="button" class="button"
                    onclick="toggleFormInput(this, 'enable', 'disable');" value="disable"/>

                <label for="from_email">from_email:</label>
                <input type="text" id="from_email" name="from_email"/>
                <input type="button" class="button"
                    onclick="toggleFormInput(this, 'enable', 'disable');" value="disable"/>

                <label for="a_text"> a_text:</label>
                <input id="a_text" type="text" name="a_text" size="25"/>
                <input type="button" class="button"
                onclick="toggleFormInput(this, 'enable', 'disable');" value="disable"/>
                
                <label for="a_text_2"> a_text_2: </label>
                <input type="text" id="a_text_2" name="a_text" size="25"/>
                <input type="button" class="button"
                    onclick="toggleFormInput(this, 'enable', 'disable');" value="disable"/>

                <label for="comment"> comment:</label>
                <textarea id="comment" name="comment" rows="6" cols="25"/>
                <input type="button" class="button"
                    onclick="toggleFormInput(this, 'enable', 'disable');" value="disable"/>

            </fieldset>

            <input type="submit" name="submit" value="sendmail_send"/>

        </form>

    </xsl:template>

</xsl:stylesheet>
