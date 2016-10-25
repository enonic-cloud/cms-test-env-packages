<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>
   
   
   
   <xsl:include href="/features/Datasources/datasource-result.include.xsl"/>
   
   <xsl:template match="/">
      
      <form method="post">
         <label for="qualifiedUsername">qualifiedUsername:</label>
         <input type="text" id="qualifiedUsername" name="qualifiedUsername" value="{/result/context/querystring/parameter[ @name = 'qualifiedUsername' ]}"/>
         
         <label for="includeMemberships">includeMemberships:</label>
         <input type="text" id="includeMemberships" name="includeMemberships" value="{/result/context/querystring/parameter[ @name = 'includeMemberships' ]}"/>
         
         <label for="normalizeGroups">normalizeGroups:</label>
         <input type="text" id="normalizeGroups" name="normalizeGroups" value="{/result/context/querystring/parameter[ @name = 'normalizeGroups' ]}"/>
         
         <label for="includeCustomUserFields">includeCustomUserFields:</label>
         <input type="text" id="includeCustomUserFields" name="includeCustomUserFields" value="{/result/context/querystring/parameter[ @name = 'includeCustomUserFields' ]}"/>

         <input type="submit" class="button clear"/>
      </form>
      
      <xsl:call-template name="datasource-result"/>
      
   </xsl:template>


</xsl:stylesheet>
