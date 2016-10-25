<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
                xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>

  <xsl:include href="/features/includes/displayContext.xsl"/>

  <xsl:param name="rememberMe" select="'false'" as="xs:string"/>

  <xsl:template match="/">

    <script src="{portal:createResourceUrl('/_public/features/scripts/contentOperations.js', ())}" type="text/javascript"><xsl:comment>//</xsl:comment></script>
    
    <link href="{portal:createResourceUrl('/_public/features/features.css')}" media="screen"
          rel="stylesheet" type="text/css"/>

    <xsl:variable name="redirect" select="portal:createPageUrl()"/>


    <fieldset>

      <xsl:if test="/result/context/querystring/parameter[@name = 'error_user_logout']">

        <xsl:variable name="errorCode"
                      select="/result/context/querystring/parameter[@name = 'error_user_logout']"/>

        <p class="formError">An error occured:
          <xsl:value-of select="$errorCode"/>
          <xsl:text> - </xsl:text>
          <xsl:choose>
            <xsl:when test="$errorCode='102'">User not logged in</xsl:when>
          </xsl:choose>
        </p>

      </xsl:if>


      <legend>Operation: logout</legend>
      <xsl:choose>
        <xsl:when test="/result/context/user/@key">
          You are logged in as:
          <xsl:value-of select="/result/context/user/@qualified-name"/>
        </xsl:when>
        <xsl:otherwise>
          You are not logged in.
        </xsl:otherwise>
      </xsl:choose>

      <form action="{portal:createServicesUrl( 'user', 'logout', $redirect, () )}" method="post">
        <input type="submit" value="Logout"/>
      </form>

    </fieldset>

    <fieldset>


      <xsl:if test="/result/context/querystring/parameter[@name = 'error_user_login']">

        <xsl:variable name="errorCode"
                      select="/result/context/querystring/parameter[@name = 'error_user_login']"/>

        <p class="formError">An error occured:
          <xsl:value-of select="$errorCode"/>
          <xsl:text> - </xsl:text>
          <xsl:choose>
            <xsl:when test="$errorCode='103'">User not found</xsl:when>
            <xsl:when test="$errorCode='104'">Missing userid or password</xsl:when>
            <xsl:when test="$errorCode='106'">User id or password is wrong</xsl:when>
            <xsl:when test="$errorCode='115'">Userstore not found</xsl:when>
            <xsl:when test="$errorCode='400'">Missing or invalid parameter</xsl:when>
            <xsl:when test="$errorCode='506'">No rights to handle request</xsl:when>
          </xsl:choose>
        </p>

      </xsl:if>

      <legend>Operation: loginSRS</legend>
      <form action="{portal:createServicesUrl( 'user', 'login', $redirect, () )}" method="post">

        <label for="userstore">userstore (id or name, empty uses default):</label>
        <input type="text" name="userstore"/>
        <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
       
        <label for="uid">uid: (userstore\username or username)</label>
        <input type="text" name="uid"/>
        
		<label for="email">email</label>
	    <input type="text" name="email"/>
	
        <label for="password">password:</label>
        <input type="password" name="password"/>

        <label for="rememberme">rememberme:</label>
        <input type="checkbox" name="rememberme"/>


        <label for="resetguid">resetguid:</label>
        <input type="checkbox" name="resetguid"/>

        <p style="clear">
          <input type="submit" class="button" value="Login"/>
        </p>
      </form>

    </fieldset>

    <hr/>

    <xsl:call-template name="displayContext"/>

  </xsl:template>


</xsl:stylesheet>
