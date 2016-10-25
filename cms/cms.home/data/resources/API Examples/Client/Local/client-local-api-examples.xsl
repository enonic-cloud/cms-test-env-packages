<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
                xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>

  <xsl:template match="/">

    <ul>
      <li>
        <a href="{portal:createUrl( '/api-examples/plugin/client/local/minimal-example' )}" target="_blank">
          Minimal Example
        </a>
        - a controller plugin that prints out cms and site properties
      </li>

      <li>
        <a href="{portal:createPageUrl( 278, () )}" target="_blank">
          GetRelatedContent Example
        </a>
        - a controller plugin that calls the Client.getRelatedContent function and prints out the result
      </li>

      <li>
        <a href="{portal:createUrl( '/api-examples/plugin/client/local/minimal-import-content-example', ('category-to-import-to', 123) )}" target="_blank">
          Minimal Import Content Example
        </a>
        - a controller plugin that parses each HTTP request and import it into a category that contains content with HTTP request info.
      </li>



    </ul>

  </xsl:template>


</xsl:stylesheet>
