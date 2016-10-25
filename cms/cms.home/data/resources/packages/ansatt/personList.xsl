<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>

  <xsl:template match="/">
    <xsl:choose>
      <xsl:when test="/result/contents/@totalcount = 0">
        <h2>Ingen ansatte publisert.</h2>
      </xsl:when>
      <xsl:otherwise>
        <div class="item">
          <table cellspacing="0" class="list">
            <thead>
              <tr>
                <th>Navn</th>
                <th>Stilling</th>
                <th>Mobil</th>
                <th>E-post</th>
              </tr>
            </thead>
            <tbody>
              <xsl:apply-templates select="/result/contents/content"/>
            </tbody>
          </table>
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="content">
    <tr>
      <td><a href="{portal:createContentUrl(@key, ())}"><xsl:value-of select="contentdata/name"/></a></td>
      <td><xsl:value-of select="contentdata/position"/></td>
      <td><xsl:value-of select="contentdata/mobile"/></td>
      <td><a href="mailto:{contentdata/email}"><xsl:value-of select="contentdata/email"/></a></td>
    </tr>      
  </xsl:template>
</xsl:stylesheet>