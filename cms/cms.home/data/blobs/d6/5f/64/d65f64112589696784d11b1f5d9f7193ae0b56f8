<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
   exclude-result-prefixes="xs portal" 
   version="2.0" 
   xmlns="http://www.w3.org/1999/xhtml" 
   xmlns:portal="http://www.enonic.com/cms/xslt/portal" 
   xmlns:xs="http://www.w3.org/2001/XMLSchema" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   
   <xsl:output 
      indent="yes" 
      media-type="text/html" 
      method="xml" 
      omit-xml-declaration="yes"/>
   
   <xsl:include href="/features/includes/displayContext.xsl"/>

   <xsl:param name="textToDisplay"/>
   
   <xsl:param name="myCategory">
      <type>category</type>
   </xsl:param>
   
   <xsl:template match="/">
      
      [ <xsl:value-of select="$textToDisplay"/> ]     
      
   </xsl:template>
   
   
</xsl:stylesheet>
