<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
      exclude-result-prefixes="xs portal" 
      version="2.0" 
      xmlns="http://www.w3.org/1999/xhtml" 
      xmlns:portal="http://www.enonic.com/cms/xslt/portal" 
      xmlns:xs="http://www.w3.org/2001/XMLSchema" 
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   
   <xsl:output indent="yes" method="xhtml" omit-xml-declaration="yes"/>
   
   <xsl:include href="/features/includes/displayContext.xsl"/>
   
   <xsl:param name="content">
      <type>content</type>
   </xsl:param>
   
   <xsl:template match="/">     
         <div style="background-color: yellow">
            
            This is the border that paints a coloured box around the portlet.<br/>
            <br/>
            
            <xsl:value-of disable-output-escaping="yes" select="$content"/>
            
            <xsl:call-template name="displayContext"/>
            
         </div>     
   </xsl:template>
</xsl:stylesheet>