<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="portal util xs" version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:util="enonic:utilities" xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <xsl:output indent="no" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>

  <xsl:include href="/libraries/utilities/utilities.xsl"/>
  <xsl:include href="/libraries/utilities/navigation-menu.xsl"/>
  <xsl:include href="/libraries/utilities/standard-variables.xsl"/>

  <xsl:variable name="url-parameters" select="/result/context/querystring/parameter[not(@name = 'index' or @name = 'id' or starts-with(@name, '_config-'))]"/>
  <xsl:variable name="index" select="xs:integer(/result/contents/@index)"/>
  <xsl:variable name="content-count" select="xs:integer(/result/contents/@resultcount)"/>
  <xsl:variable name="total-count" select="xs:integer(/result/contents/@totalcount)"/>
  <xsl:variable name="contents-per-page" select="xs:integer(/result/contents/@count)"/>

  <xsl:template match="/">
    <xsl:choose>
      <xsl:when test="/result/contents/content">
        <h2>Find out what our flexible CMS can do for you</h2>
        <div class="shadowboxes clear clearfix">
          <xsl:apply-templates select="/result/contents/content"/>
        </div>
      </xsl:when>
      <xsl:otherwise>
        <p class="clear">
          <xsl:value-of select="portal:localize('No-articles')"/>
        </p>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="content">
    <xsl:variable name="href">
      <xsl:value-of select="if (contentdata/link_menuitem) then (portal:createPageUrl(contentdata/link_menuitem,())) else (contentdata/link_href)"/>
    </xsl:variable>
    <div class="item">
      <xsl:if test="position() = 1">
        <xsl:attribute name="class">item first</xsl:attribute>
      </xsl:if>
      <xsl:if test="position() = last()">
        <xsl:attribute name="class">item last</xsl:attribute>
      </xsl:if>
      <div class="inner-item">
        <xsl:if test="not($device-class = 'mobile')">
          <div class="image-container">
            <xsl:if test="/result/contents/relatedcontents/content[@key = current()/contentdata/image/@key]">
              <a href="{$href}" title="{title}">
                <xsl:call-template name="utilities.display-image">
                  <xsl:with-param name="region-width" select="$region-width"/>
                  <xsl:with-param name="filter" select="'scalewide(268, 98)'"/>
                  <xsl:with-param name="title" select="title"/>
                  <xsl:with-param name="image" select="/result/contents/relatedcontents/content[@key = current()/contentdata/image/@key]"/>
                </xsl:call-template>
              </a>
            </xsl:if>
          </div>
        </xsl:if>
        <div class="inner-shadowbox">
          <h2>
            <a href="{$href}" title="{title}">
              <xsl:value-of select="contentdata/heading"/>
            </a>
          </h2>
          <p><xsl:value-of disable-output-escaping="yes" select="replace(contentdata/preface, '&#xD;', '&lt;br /&gt;')"/></p>
          <a title="{title}" href="{$href}">
            <xsl:value-of select="if (contentdata/link_label) then (contentdata/link_label) else concat(portal:localize('Read-more'), ' »')"/>
          </a>
        </div>
      </div>
    </div>
  </xsl:template>

</xsl:stylesheet>
