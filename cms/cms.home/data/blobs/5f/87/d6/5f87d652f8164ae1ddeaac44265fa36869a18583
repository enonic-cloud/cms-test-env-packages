<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
  xmlns:util="enonic:utilities" xmlns:portal="http://www.enonic.com/cms/xslt/portal"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  
  
  <xsl:output encoding="utf-8" indent="no" method="xhtml" omit-xml-declaration="yes"/>
  
  <xsl:include href="/libraries/utilities/process-html-area.xsl"/>
  
  <xsl:param name="baseURL" select="'http://www.enonic.com'"/>
  <xsl:variable as="xs:integer" name="region-width" select="325"/>
  <xsl:variable as="xs:integer" name="region-width-right" select="163"/>
  
  <xsl:variable name="language" select="/result/context/@languagecode"/>
  
  <xsl:template match="/">
    <html lang="en" xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>Newsletter - Test</title>
      </head>
      <body>
        <p>
          <h2>The document-resource</h2>
          <xsl:value-of select="/result/context/resource/document"/>
          <h2>Content published to this section:</h2>
        </p>
        <table border="1px">
          <th>Type</th>
          <th>title</th>
          <xsl:for-each select="/result/contents[1]/content">
            <tr>
              <td>
                <xsl:value-of select="@contenttype"/>
              </td>
              <td>
                <xsl:value-of select="title"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <h2>Some other section's content</h2>
        <table border="1px">
          <th>Type</th>
          <th>title</th>
          <xsl:for-each select="/result/contents[2]/content">
            <tr>
              <td>
                <xsl:value-of select="@contenttype"/>
              </td>
              <td>
                <xsl:value-of select="title"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        
      </body>
      
    </html>
    
  </xsl:template>
  
</xsl:stylesheet>
