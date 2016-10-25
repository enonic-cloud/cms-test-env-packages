<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:util="enonic:utilities" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="no" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <form action="{portal:createServicesUrl('sendmail', 'send')}" method="post" id="tip-form">
            <fieldset>

                <!--xsl:if test="$error-content-create = 405">
                        <div class="error">
                        <xsl:value-of select="portal:localize('user-error-405')"/>
                        </div>
                        </xsl:if-->

                <input name="subject" type="hidden"/>
                <input name="{portal:localize('Tip')}" type="hidden"/>
                <input name="sort_order" type="hidden" value="{portal:localize('Tip')}"/>
                <label for="tip-to">
                    <xsl:value-of select="portal:localize('Recipient-email')"/>
                </label>
                <input type="text" id="tip-to" name="to" class="text email required"/>
                <label for="tip-from-name">
                    <xsl:value-of select="portal:localize('Your-name')"/>
                </label>
                <input type="text" id="tip-from-name" name="from_name" class="text required"/>
                <label for="tip-from-email">
                    <xsl:value-of select="portal:localize('Your-email')"/>
                </label>
                <input type="text" id="tip-from-email" name="from_email" class="text email required"/>
                <label for="tip-message">
                    <xsl:value-of select="portal:localize('Message')"/>
                </label>
                <textarea type="text" id="tip-message" name="message" cols="5" rows="5"/>
                <input type="submit" class="button clear" value="{portal:localize('Send')}"/>
                <input type="button" class="button" value="{portal:localize('Cancel')}" onclick="$('#share-bar-tip-dialog').dialog('close');"/>
            </fieldset>
        </form>
    </xsl:template>

</xsl:stylesheet>
