<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" 
  xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:util="enonic:utilities" 
  xmlns:portal="http://www.enonic.com/cms/xslt/portal" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:xs="http://www.w3.org/2001/XMLSchema">
  
  
  <xsl:output encoding="utf-8" indent="no" method="xhtml" omit-xml-declaration="yes"/>
  
  <xsl:include href="/features/includes/displayContext.xsl"/>
  
  <xsl:template match="/">
 
    <script src="{portal:createResourceUrl('/_public/features/scripts/contentOperations.js', ())}" type="text/javascript"><xsl:comment>//</xsl:comment></script>
    
    <div id="fullXML" style="display: none">
      <a href="javascript:hidediv('fullXML')">hide xml</a>
      
      <p>
        <textarea>
          <xsl:copy-of select="/result"/>
        </textarea>
      </p>
    </div>
    <a href="javascript:showdiv('fullXML')">show xml</a>
    
    
 
 
    <xsl:call-template name="displayContext">
    </xsl:call-template>
    
  </xsl:template>
  
</xsl:stylesheet>