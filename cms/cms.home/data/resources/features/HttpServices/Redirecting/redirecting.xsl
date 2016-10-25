<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
    exclude-result-prefixes="xs portal"
    version="2.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>

  <xsl:include href="/features/includes/displayContext.xsl"/>

  <xsl:template match="/">

    <xsl:variable name="redirectOK" select="portal:createPageUrl( ('result','ok', 'testæøå', 'ok') ) "/>
    
    <p>
      Testing general redirecting functinality in HTTP Services. Using the simplest service for this: handler='portal', op='resetLocale'
    </p>
   
    <fieldset>
      <legend>Testing redirect using HTTP User Services: resetLocale</legend>
      
      <xsl:if test="/result/context/querystring/parameter[@name = 'result']">
        <p>Ok!</p>
      </xsl:if>
     
      <form action="{portal:createServicesUrl('portal','resetLocale', $redirectOK, ())}" id="form" method="post">
        <input class="button" type="submit" value="submit" style="clear: both"/> 
        
      </form>    
      
      <label>Resulting link:</label>
      
      <textarea>
        <xsl:value-of select="portal:createServicesUrl('portal','resetLocale', $redirectOK, ())"/>
      </textarea>           
      
    </fieldset>
   
    <p>
        <fieldset>
          <legend>Check email</legend>
   
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
   
          <form action="{portal:createServicesUrl('user','emailexists', $redirectOK, ())}" id="form"
            method="post">
   
          <label for="email">email:</label>
          <input type="text" id="text" disable="false" name="email"/>
          
          <label for="userstore">userstore:</label>
          <input type="text" id="text" disable="false" name="userstore"/>
    
          <input class="button" id="sumbit" type="submit" value="user_emailexists" style="clear: both"/>
          </form>
          
        </fieldset>
     
  
      
    </p>
    
  </xsl:template>

</xsl:stylesheet>
