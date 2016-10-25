<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="xs portal" version="2.0">
	
   <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>
	   
	   
	<xsl:template match="/">		
      
      If we ouput data from a textarea input field in a html from textarea,
      the the line breaks should appear.
	   <br/>
	   <br/> 
	   <textarea>
	     <xsl:copy-of select="/result/contents/content/contentdata/textarea/node()"/>
	   </textarea>      
	   
	</xsl:template>
</xsl:stylesheet>
