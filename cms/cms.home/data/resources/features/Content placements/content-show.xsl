<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="xs portal" version="2.0">
	
   <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>
	   
	
   <xsl:include href="/features/includes/displayContext.xsl"/>
	   
	<xsl:template match="/">		
      
     
     <fieldset>
        <legend>Expected resolved path to content</legend>
	     <xsl:value-of select="/result/displayed-content/contents/content/contentdata/expected-path"/>
     </fieldset>

    <br/>
    <br/>
    <xsl:call-template name="displayContext"/>
	   
	</xsl:template>
   
</xsl:stylesheet>
