<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>
    <!--    <xsl:include href="/_public/packages/commons/scripts/common.xsl"/> -->

    <xsl:include href="user_common.xsl"/>

    <xsl:template match="/">
        <link href="{portal:createResourceUrl('/_public/features/features.css')}" media="screen"
            rel="stylesheet" type="text/css"/>
        <script src="{portal:createResourceUrl('/_public/features/scripts/contentOperations.js', ())}" type="text/javascript"><xsl:comment>//</xsl:comment></script>

        <xsl:variable name="redirectKey" select="/result/context/querystring/parameter[@name='id']"/>
        <xsl:variable name="redirect" select="portal:createPageUrl($redirectKey, ('modify', 'ok'))"/>

        <!--
 
        -->

        <div id="fullXML" style="display: none">
            <a href="javascript:hidediv('fullXML')">hide xml</a>

            <p>
                <textarea>
                    <xsl:copy-of select="/result"/>
                </textarea>
            </p>
        </div>
        <a href="javascript:showdiv('fullXML')">show xml</a>

        <p>
            <xsl:if test="/result/context/querystring/parameter[@name = 'error_user_modify']">

                <xsl:variable name="errorCode"
                    select="/result/context/querystring/parameter[@name = 'error_user_modify']"/>

                <p class="formError"> An error occured: <xsl:value-of select="$errorCode"/>
                    <xsl:text> - </xsl:text>
                    <xsl:choose>
                        <xsl:when test="$errorCode='100'">Email already exists</xsl:when>
                        <xsl:when test="$errorCode='109'">Missing group key</xsl:when>
                        <xsl:when test="$errorCode='110'">Join or leave group failed</xsl:when>
                        <xsl:when test="$errorCode='111'">Join or leave group not allowed</xsl:when>
                        <xsl:when test="$errorCode='113'">Modify user not allowed</xsl:when>
                        <xsl:when test="$errorCode='401'">Invalid or missing parameter</xsl:when>
                    </xsl:choose>
                </p>
            </xsl:if>
        </p>

        <xsl:variable name="user" select="result/context/user"/>

        <p>
            <xsl:if test="/result/context/querystring/parameter[@name = 'modify']">
                
                <xsl:variable name="status"
                    select="/result/context/querystring/parameter[@name = 'modify']"/>
                
                <p class="formError">User updated: <xsl:value-of select="$status"/></p>
            </xsl:if>
        </p>
        

        <p>
            <h3>Modify User</h3>

            <h5>To remove fields from form-input, use the disable-button next to the input</h5>

            <form action="{portal:createServicesUrl('user','modify', $redirect, ())}" id="form"
                method="post" enctype="multipart/form-data">

                <xsl:call-template name="userInfo">
                    <xsl:with-param name="user" select="$user"/>
                </xsl:call-template>

                <input type="submit" value="user_modify"/>
            </form>
        </p>
        <p>
            <h3>Existing memberships:</h3>
            
            <xsl:call-template name="groupInfo">
                <xsl:with-param name="user" select="$user"/>
            </xsl:call-template>
        </p>

    </xsl:template>

</xsl:stylesheet>
