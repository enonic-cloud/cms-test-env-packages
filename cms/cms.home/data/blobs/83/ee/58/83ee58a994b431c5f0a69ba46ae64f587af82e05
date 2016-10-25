<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
                xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="xs portal" version="2.0">

  <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>


  <xsl:template match="/">

    <p>
      Using function with a content of type File:
    </p>
    <ul>
      <li>
        <a href="{portal:createAttachmentUrl( 1499 )}">
          createAttachmentUrl( 1499 )
        </a>
      </li>
      <li>
        <a href="{portal:createAttachmentUrl( '1499/label/source' )}">
          createAttachmentUrl( '1499/label/source' )
        </a>
      </li>
      <li>
        <a href="{portal:createAttachmentUrl( '1499/label/' )}">createAttachmentUrl( '1499/label/' )</a> - should not work: label missing
      </li>
      <li>
        <a href="{portal:createAttachmentUrl( '1499/binary/850' )}">createAttachmentUrl( '1499/binary/850' )</a>
      </li>
      <li>
        <a href="{portal:createAttachmentUrl( '1499/binary' )}">createAttachmentUrl( '1499/binary' )</a>
        - should not work: binary key missing
      </li>
    </ul>

    <p>
      Using function with a content of type Image:
    </p>
    <ul>
      <li>
        <a href="{portal:createAttachmentUrl( '1503' )}">
          createAttachmentUrl( '1503' )
        </a>
      </li>
      <li>
        <a href="{portal:createAttachmentUrl( '1503/label/source' )}">
          createAttachmentUrl( '1503/label/source' )
        </a>
      </li>
      <li>
        <a href="{portal:createAttachmentUrl( '1503/label/large' )}">
          createAttachmentUrl( '1503/label/large' )
        </a>
      </li>
      <li>
        <a href="{portal:createAttachmentUrl( '1503/label/medium' )}">
          createAttachmentUrl( '1503/label/medium' )
        </a>
      </li>
      <li>
        <a href="{portal:createAttachmentUrl( '1503/label/small' )}">
          createAttachmentUrl( '1503/label/small' )
        </a>
      </li>
    </ul>

  </xsl:template>

</xsl:stylesheet>
