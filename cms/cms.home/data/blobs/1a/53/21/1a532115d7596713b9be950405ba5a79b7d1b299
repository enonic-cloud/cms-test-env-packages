<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="saxon xs portal" version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:saxon="http://icl.com/saxon" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/xhtml1-strict.dtd" encoding="utf-8" indent="no" method="xhtml" omit-xml-declaration="yes"/>
  
  <xsl:param name="content">
    <type>object</type>
  </xsl:param>
  
  <xsl:include href="/features/Newsletter/newsletter.include.xsl"/>
   <xsl:include href="/features/includes/displayContext.xsl"/>
  
  <xsl:template match="/">
    
    <html dir="ltr" xmlns="http://www.w3.org/1999/xhtml">
      <body>
        <h1>Test av nyhetsbrev</h1>
        
        <xsl:call-template name="portalFunctionsForNewsletter">
        </xsl:call-template>
        
          <div style="background-color:lightblue"> Portlet <br/>
            <xsl:value-of disable-output-escaping="yes" select="$content"/>
          </div>
         
         <xsl:call-template name="displayContext">
         </xsl:call-template>
         
      </body>      
    </html>
    
  </xsl:template>
    
</xsl:stylesheet>
