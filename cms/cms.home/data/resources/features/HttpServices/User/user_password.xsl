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
        <xsl:variable name="redirect" select="portal:createPageUrl($redirectKey, ('reset', 'ok'))"/>
        <xsl:variable name="user" select="result/context/user"/>
        
        <p>
            <xsl:if test="/result/context/querystring/parameter[@name = 'reset']">
                
                <xsl:variable name="status"
                    select="/result/context/querystring/parameter[@name = 'reset']"/>
                
                <p class="formError">Password changed: <xsl:value-of select="$status"/></p>
            </xsl:if>
        </p>
        
        
        
        <xsl:if test="/result/context/querystring/parameter[@name = 'error_user_resetpwd']">
            
            <xsl:variable name="errorCode"
                select="/result/context/querystring/parameter[@name = 'error_user_resetpwd']"/>
            
            <p class="formError"> An error occured: <xsl:value-of select="$errorCode"/>
                <xsl:text> - </xsl:text>
                <xsl:choose>
                    <xsl:when test="$errorCode='103'">User not found</xsl:when>
                    <xsl:when test="$errorCode='113'">Not allowed to update user password</xsl:when>
                    <xsl:when test="$errorCode='401'">Invalid parameter</xsl:when>
                    
                </xsl:choose>
            </p>
            
        </xsl:if>
        
        <p>
            <form action="{portal:createServicesUrl('user','resetpwd', $redirect, ())}" id="form" method="post"
                enctype="multipart/form-data">
                <fieldset>
                    <legend>Reset password</legend>
                    
                    <label for="reset_userstore">Userstore:</label>
                    <input id="reset_userstore" type="text" name="userstore"/>
                    
                    <label for="reset_uid">uid:</label>
                    <input id="reset_uid" type="text" name="uid"/>
                    
                    <label for="reset_email">email:</label>
                    <input id="reset_email" type="text" name="email"/>
                    <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
                    
                    <label for="reset_id">id (deprecated)</label>
                    <input id="reset_id" type="text" name="id" disabled="true"/>
                    <input type="button" class="button" onclick="toggleFormInput(this);" value="enable"/>
                    
                    <label for="from_name">From:</label>
                    <input id="from_name" type="text" name="from_name" value="Enonic CMS admin"/>
                
                    <label for="from_email">From email:</label>
                    <input id="from_email" type="text" name="from_email" value="admin@test.com"/>
                    
                    <label for="mail_subject">Email subject:</label>
                    <input id="mail_subject" type="text" name="mail_subject" value="Your password has been reset"/>
                    
                    <label for="mail_body">Email body:</label>
                    <input if="mail_body" type="text" name="mail_body" value="Hi %uid%.\n\n Your new password is %password%.\nYou could change this after login."/>
                    
                    <p class="clear">
                        <input type="submit" value="Reset password"/>
                    </p>    
                </fieldset>
                
            </form>
        </p>
        
        <xsl:if test="/result/context/querystring/parameter[@name = 'error_user_changepwd']">
            
            <xsl:variable name="errorCode"
                select="/result/context/querystring/parameter[@name = 'error_user_changepwd']"/>
            
            <p class="formError"> An error occured: <xsl:value-of select="$errorCode"/>
                <xsl:text> - </xsl:text>
                <xsl:choose>
                    <xsl:when test="$errorCode='103'">User not found</xsl:when>
                    <xsl:when test="$errorCode='104'">Missing user name and/or password</xsl:when>
                    <xsl:when test="$errorCode='106'">User id or password is wrong</xsl:when>
                    <xsl:when test="$errorCode='107'">newpassword1 and newpassword2 are not equal</xsl:when>
                    <xsl:when test="$errorCode='108'">The new password was not valid, currently it can not be empty</xsl:when>
                    <xsl:when test="$errorCode='113'">Not allowed to update user password</xsl:when>
                    <xsl:when test="$errorCode='114'">Uid is in wrong format, email not supported</xsl:when>
                    <xsl:when test="$errorCode='115'">Userstore not found</xsl:when>
                </xsl:choose>
            </p>
            
        </xsl:if>
        
        <!-- 
            <xsl:when test="$errorCode='103'">Missing</xsl:when>
        -->
        
        <p>
            <form action="{portal:createServicesUrl('user','changepwd', $redirect, ())}" id="form" method="post"
                enctype="multipart/form-data">
                <fieldset>
                    <legend>Change password</legend>
                    <label for="change_userstore">Userstore:</label>
                    <input id="change_userstore" type="text" name="userstore" disabled="true" value="{$user/userstore}"/>
                    <input type="button" class="button" onclick="toggleFormInput(this);" value="enable"/>
                    
                    <label for="change_uid">User id or email:</label>
                    <input id="change_uid" type="text" name="uid" disabled="true" value="{$user/@qualified-name}"/>
                    <input type="button" class="button" onclick="toggleFormInput(this);" value="enable"/>
                    
                    <label for="change_password">Old password:</label>
                    <input id="change_password" type="text" name="password"/>
                    
                    <label for="newpassword1">New password 1:</label>
                    <input id="newpassword1" type="text" name="newpassword1"/>
                    
                    <label for="newpassword2">New password 2:</label>
                    <input id="newpassword2" type="text" name="newpassword2"/>
                    
                    <p class="clear">
                        <input type="submit" value="Change password"/>
                    </p>
                </fieldset>
            </form>
        </p>
        
    </xsl:template>
    
    
</xsl:stylesheet>
