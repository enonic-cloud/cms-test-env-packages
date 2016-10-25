<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
   exclude-result-prefixes="xs portal" 
   version="2.0" 
   xmlns="http://www.w3.org/1999/xhtml" 
   xmlns:portal="http://www.enonic.com/cms/xslt/portal" 
   xmlns:xs="http://www.w3.org/2001/XMLSchema" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output indent="yes" media-type="application/xhtml+xml" method="xhtml" omit-xml-declaration="yes"/>
  
   <xsl:include href="/features/includes/displayContext.xsl"/>
   
  <xsl:param name="name"/>
   
  <xsl:template match="/">
      
     <div style="background-color: lightblue">
        Portlet: <xsl:value-of select="$name"/>
        <br/>
        Am I rendered inline? <xsl:value-of select="portal:isWindowInline()"/>
        <br/>
        <br/>
        <br/>
        <xsl:call-template name="displayContext"/>       
        
     </div> 
      
      
  </xsl:template>


</xsl:stylesheet>
