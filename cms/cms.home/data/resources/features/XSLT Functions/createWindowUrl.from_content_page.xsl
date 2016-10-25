<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  exclude-result-prefixes="xs portal"
  version="2.0" xmlns="http://www.w3.org/1999/xhtml"
  xmlns:portal="http://www.enonic.com/cms/xslt/portal"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output
    indent="yes"
    media-type="text/html"
    method="xml"
    omit-xml-declaration="yes"/>
  
  <xsl:include href="/features/includes/displayContext.xsl"/>
  
  <xsl:template match="/">  
    <div class="frame clear clearfix">
      <p>
        Create Window URL test:
      </p>
      <p>
        <a href="{portal:createWindowUrl()}" target="_blank" >
          Link to window
        </a>
      </p>
    </div>
    
    <xsl:if test="not(portal:isWindowInline())">
      <xsl:call-template name="displayContext"> </xsl:call-template>
    </xsl:if>
  </xsl:template>
  
  
</xsl:stylesheet>
