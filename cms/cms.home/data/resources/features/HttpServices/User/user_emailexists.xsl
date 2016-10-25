<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>


    <xsl:template match="/">
        <link href="{portal:createResourceUrl('/_public/features/features.css')}" media="screen"
            rel="stylesheet" type="text/css"/>
        <script src="{portal:createResourceUrl('/_public/features/scripts/contentOperations.js', ())}" type="text/javascript"><xsl:comment>//</xsl:comment></script>

        <xsl:variable name="redirectKey" select="/result/context/querystring/parameter[@name='id']"/>
        <xsl:variable name="redirect" select="portal:createPageUrl($redirectKey, ())"/>

        <div id="fullXML" style="display: none">
            <a href="javascript:hidediv('fullXML')">hide xml</a>

            <p>
                <textarea>
                    <xsl:copy-of select="/result"/>
                </textarea>
            </p>
        </div>
        <a href="javascript:showdiv('fullXML')">show xml</a>

        <xsl:if test="/result/context/querystring/parameter[@name = 'error_user_emailexists']">

            <xsl:variable name="errorCode"
                select="/result/context/querystring/parameter[@name = 'error_user_emailexists']"/>

            <p class="formError"> An error occured: <xsl:value-of select="$errorCode"/>
                <xsl:text> - </xsl:text>
                <xsl:choose>
                    <xsl:when test="$errorCode='115'">Userstore not found</xsl:when>
                    <xsl:when test="$errorCode='401'">Missing email</xsl:when>
                </xsl:choose>
            </p>

        </xsl:if>
    
        <xsl:if test="/result/context/querystring/parameter[@name = 'email']">
            <xsl:variable name="exists"
                select="/result/context/querystring/parameter[@name = 'exists']"/>
            <p>Email <xsl:value-of select="/result/context/querystring/parameter[@name = 'email']"/>
                exists: <xsl:value-of
                select="$exists"/>
                in userstore: <xsl:value-of select="/result/context/querystring/parameter[@name = 'userstore']"/>
            </p>
        </xsl:if>


        <p>
            <form action="{portal:createServicesUrl('user','emailexists', $redirect, ())}" id="form"
                method="post">
                <fieldset>
                    <legend>Check email</legend>

                    <label for="email">email:</label>
                    <input type="text" id="text" disable="false" name="email"/>

                    <label for="userstore">userstore:</label>
                    <input type="text" id="text" disable="false" name="userstore"/>
                </fieldset>
                <input id="sumbit" type="submit" value="user_emailexists"/>
            </form>

        </p>

    </xsl:template>

</xsl:stylesheet>
