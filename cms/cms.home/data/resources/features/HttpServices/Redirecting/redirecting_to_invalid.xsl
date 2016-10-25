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

    <xsl:variable name="redirectOK" select="/result/context/querystring/parameter[@name = 'test-url']"/>
    
    <p>
      Testing general redirecting functionality in HTTP Services. Using the simplest service for this: handler='portal', op='resetLocale'
    </p>
    
    <p>
      The 'test-url' parameter of the menu item must have a value that is illegal by the 'cms.httpServices.redirect.allowedDomains' parameter in cms.properties.
      <b>Clicking submit should produce an error-message.</b>
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
   
  </xsl:template>

</xsl:stylesheet>
