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
        <xsl:variable name="redirect" select="portal:createPageUrl($redirectKey, ('update','ok'))"/>

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

        <xsl:variable name="user" select="result/context/user"/>

        <p>
            <xsl:if test="/result/context/querystring/parameter[@name = 'update']">

                <xsl:variable name="status"
                    select="/result/context/querystring/parameter[@name = 'update']"/>

                <p class="formError">User updated: <xsl:value-of select="$status"/></p>
            </xsl:if>
        </p>


        <p>
            <xsl:if test="/result/context/querystring/parameter[@name = 'error_user_update']">

                <xsl:variable name="errorCode"
                    select="/result/context/querystring/parameter[@name = 'error_user_update']"/>

                <p class="formError"> An error occured: <xsl:value-of select="$errorCode"/>
                    <xsl:text> - </xsl:text>
                    <xsl:choose>
                        <xsl:when test="$errorCode='100'">Email already exists</xsl:when>
                        <xsl:when test="$errorCode='109'">Missing group key</xsl:when>
                        <xsl:when test="$errorCode='110'">Join or leave group failed</xsl:when>
                        <xsl:when test="$errorCode='111'">Join or leave group not allowed</xsl:when>
                        <xsl:when test="$errorCode='113'">Update user not allowed</xsl:when>
                        <xsl:when test="$errorCode='115'">Userstore not found</xsl:when>
                        <xsl:when test="$errorCode='401'">Invalid or missing parameter</xsl:when>
                    </xsl:choose>
                </p>
            </xsl:if>

            <p>
                <h3>Update User</h3>

                <h5>To remove fields from form-input, use the disable-button next to the input</h5>

                <form action="{portal:createServicesUrl('user','update', $redirect, ())}" id="form"
                    method="post" enctype="multipart/form-data">

                    <xsl:call-template name="userInfo">
                        <xsl:with-param name="user" select="$user"/>
                    </xsl:call-template>

                    <input type="submit" value="user_update"/>
                </form>
            </p>
            <p>
                <h3>Existing memberships:</h3>
                <table class="httpservices">
                    <tr>
                        <td>
                            <table class="httpservices">
                                <th>Name</th>
                                <th>Key</th>
                                <th>Type</th>
                                <th>Operations</th>

                                <xsl:for-each
                                    select="$user/memberships/group[@direct-membership='true']">
                                    <tr>
                                        <td class="shadowed">
                                            <xsl:choose>
                                                <xsl:when test="@restricted='false'">
                                                  <xsl:attribute name="class">ok</xsl:attribute>
                                                </xsl:when>
                                            </xsl:choose>

                                            <xsl:value-of select="@name"/>
                                        </td>
                                        <td class="shadowed">
                                            <xsl:choose>
                                                <xsl:when test="@restricted='false'">
                                                  <xsl:attribute name="class">ok</xsl:attribute>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:value-of select="@key"/>
                                        </td>
                                        <td class="shadowed">
                                            <xsl:if test="@restricted='false'">
                                                <xsl:attribute name="class">ok</xsl:attribute>
                                                Open<BR/>
                                            </xsl:if>
                                            <xsl:if test="@restricted='true'">Restricted
                                                <BR/></xsl:if>
                                            <xsl:if test="@built-in='true'">Built-in</xsl:if>

                                        </td>
                                        <td>
                                            <xsl:if test="@restricted='false'">
                                                <form
                                                  action="{portal:createServicesUrl('user','leavegroup', ())}"
                                                  id="form" method="post">
                                                  <input type="hidden" name="key" value="{@key}"/>
                                                  <input type="submit" value="leave"/>
                                                </form>
                                            </xsl:if>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </table>
                        </td>
                    </tr>
                </table>
            </p>
        </p>
    </xsl:template>
</xsl:stylesheet>
