<xsl:stylesheet
    exclude-result-prefixes="saxon xs portal"
    version="2.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:saxon="http://icl.com/saxon"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
              doctype-system="http://www.w3.org/TR/xhtml1/xhtml1-strict.dtd"
              encoding="utf-8"
              indent="yes"
              method="xhtml"
              omit-xml-declaration="yes"/>

  <xsl:include href="smartphone-device.xsl"/>

  <xsl:param name="webmaster-email" select="'admin@example.com'"/>
  <xsl:param name="show-page-heading" select="true()"/>

  <xsl:variable name="device-class">
    <xsl:choose>
      <xsl:when test="/verticaldata/context/querystring/parameter[@name = 'device']">
        <xsl:value-of select="/verticaldata/context/querystring/parameter[@name = 'device']"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>default</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!-- Todo: ta bort variabler som ikke er i bruk -->
  <xsl:variable name="site-language" select="/verticaldata/context/@languagecode"/>
  <xsl:variable name="site-name" select="/verticaldata/context/site/name"/>
  <xsl:variable name="site-logo-screen" select="portal:createResourceUrl('/_public/packages/site/images/logo_screen.gif')"/>
  <xsl:variable name="site-first-page-key" select="/verticaldata/menus/menu/firstpage/@key"/>
  <xsl:variable name="context-page-id" select="/verticaldata/context/querystring/parameter[@name = 'id']"/>
  <xsl:variable name="context-page-title" select="/verticaldata/context/querystring/parameter[@name = 'pagetitle']"/>
  <xsl:variable name="context-http-status-code" select="/verticaldata/context/querystring/parameter[@name = 'http_status_code']"/>
  <xsl:variable name="context-exception-message" select="/verticaldata/context/querystring/parameter[@name = 'exception_message']"/>
  <xsl:variable name="context-heading" select="/verticaldata/context/querystring/parameter[@name = 'heading']"/>
  <xsl:variable name="container-max-width" select="950"/>

  <xsl:param name="left-column">
    <type>object</type>
  </xsl:param>
  <xsl:param name="main-column">
    <type>object</type>
  </xsl:param>
  <xsl:param name="right-column">
    <type>object</type>
  </xsl:param>
  <xsl:variable name="page-heading">
    <xsl:choose>
      <xsl:when test="/verticaldata/menuitems/descendant-or-self::menuitem[@key = $context-page-id]/subtitle != ''">
        <xsl:value-of select="/verticaldata/menuitems/descendant-or-self::menuitem[@key = $context-page-id]/subtitle"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="/verticaldata/menuitems/descendant-or-self::menuitem[@key = $context-page-id]/name"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="sub-menu-items" select="/verticaldata/menuitems/menuitem[$context-page-id]/menuitems/menuitem"/>
  <xsl:variable name="content" select="/verticaldata/contents/content"/>
  <xsl:template match="/">
    <xsl:choose>
      <xsl:when test="$device-class = 'smartphone'">
        <xsl:call-template name="smartphone-device"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="default-device"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="default-device">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>
          <xsl:value-of select="$site-name"/>
        </title>
        <meta name="robots" content="all"/>
        <meta name="author" content="Enonic"/>
        <meta name="description" content="Sample packages"/>
        <meta name="generator" content="Enonic Vertical Site"/>
        <link rel="Shortcut Icon" href="/favicon.ico" type="image/x-icon"/>
        <link rel="stylesheet" href="{portal:createResourceUrl('/_public/packages/site/blueprint/screen.css')}" type="text/css" media="screen, projection"/>
        <link rel="stylesheet" href="{portal:createResourceUrl('/_public/packages/site/blueprint/print.css')}" type="text/css" media="print"/>
        <link rel="stylesheet" href="{portal:createResourceUrl('/_public/packages/site/site-screen.css')}" type="text/css" media="screen, projection"/>
        <xsl:text disable-output-escaping="yes">
          &lt;!--[if IE]&gt;
            &lt;link rel="stylesheet" type="text/css" media="screen" href="</xsl:text>
        <xsl:value-of select="portal:createResourceUrl('/_public/packages/site/blueprint/ie.css')"/>
        <xsl:text disable-output-escaping="yes">"/&gt;
          &lt;![endif]--&gt;
        </xsl:text>
      </head>
      <body>
        <div id="framework">
          <div class="container">
            <div id="header" class="append-bottom">
              <a class="screen" href="{portal:createPageUrl($site-first-page-key, ())}">
                <img alt="{$site-name}" id="logo" src="{$site-logo-screen}" title="{$site-name}"/>
              </a>
            </div>
            <div id="top-menu" class="append-bottom">
              <xsl:apply-templates select="/verticaldata/menuitems" mode="horizontal"/>
            </div>
            <div id="breadcrumb-trail" class="append-bottom">
              <div>
                <xsl:call-template name="breadcrumb-trail"/>
              </div>
            </div>
            <xsl:if test="$left-column != '' or $sub-menu-items">
              <div id="left-column" class="span-5">
                <xsl:apply-templates select="/verticaldata/menuitems/menuitem/menuitems" mode="vertical"/>
                <xsl:if test="$left-column !=''">
                  <xsl:value-of disable-output-escaping="yes" select="$left-column"/>
                </xsl:if>
                <br/>
              </div>
            </xsl:if>
            <div id="main-column">
              <xsl:attribute name="class">
                <xsl:choose>
                  <xsl:when test="($sub-menu-items or $left-column != '') and $right-column != ''">
                    <xsl:text>span-14</xsl:text>
                  </xsl:when>
                  <xsl:when test="$sub-menu-items or ($left-column != '' and $right-column = '') or ($left-column = '' and $right-column != '')">
                    <xsl:text>span-19</xsl:text>
                    <xsl:if test="($left-column != '' or $sub-menu-items) and $right-column = ''">
                      <xsl:text> last</xsl:text>
                    </xsl:if>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>span-24</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <xsl:if test="$show-page-heading = true()">
                <h1>
                  <xsl:value-of select="$page-heading"/>
                </h1>
              </xsl:if>
              <xsl:value-of disable-output-escaping="yes" select="$main-column"/>
              <br/>
            </div>
            <xsl:if test="$right-column != ''">
              <div id="right-column" class="span-5 last">
                <xsl:value-of disable-output-escaping="yes" select="$right-column"/>
                <br/>
              </div>
            </xsl:if>
            <div id="footer" class="span-24">
              <div>
                <xsl:text>2000 - 2009 © Enonic AS, Enonic // Kirkegata 1-3 // N-0153 Oslo // Norway</xsl:text>
              </div>
            </div>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="menuitems" mode="horizontal">
    <xsl:variable name="number-of-menu-items" select="count(menuitem)"/>
    <xsl:if test="$number-of-menu-items">
      <xsl:variable name="width-per-menu-item" select="floor($container-max-width div $number-of-menu-items)"/>
      <xsl:variable name="rest" select="$container-max-width - ($number-of-menu-items * $width-per-menu-item)"/>
      <ul class="menu horizontal">
        <xsl:apply-templates select="menuitem" mode="horizontal">
          <xsl:with-param name="width-per-menu-item" select="$width-per-menu-item"/>
          <xsl:with-param name="rest" select="$rest"/>
        </xsl:apply-templates>
      </ul>
    </xsl:if>
  </xsl:template>

  <xsl:template match="menuitem" mode="horizontal">
    <xsl:param name="width-per-menu-item"/>
    <xsl:param name="rest"/>
    <xsl:variable name="href">
      <xsl:choose>
        <xsl:when test="@type = 'url'">
          <xsl:value-of select="url"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="portal:createPageUrl(@key, ())"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="width">
      <xsl:choose>
        <xsl:when test="position() &lt;= $rest">
          <xsl:value-of select="$width-per-menu-item + 1"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$width-per-menu-item"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <li>
      <xsl:attribute name="style">
        <xsl:value-of select="concat('width: ', $width, 'px;')"/>
      </xsl:attribute>
      <xsl:attribute name="class">
        <xsl:if test="position() = 1">
          <xsl:text> first</xsl:text>
        </xsl:if>
        <xsl:if test="@path = 'true'">
          <xsl:text> path</xsl:text>
          <!--xsl:if test="position() = 1">
            <xsl:text> first</xsl:text>
          </xsl:if-->
        </xsl:if>
      </xsl:attribute>
      <a href="{$href}">
        <xsl:if test="@active = 'true'">
          <xsl:attribute name="class">active</xsl:attribute>
        </xsl:if>
        <xsl:value-of select="name"/>
      </a>
    </li>
  </xsl:template>

  <xsl:template match="menuitems" mode="vertical">
    <!--xsl:variable name="path-top-menu-item" select="/verticaldata/menuitems/menuitem[@path = 'true']"/-->
    <xsl:if test="count(menuitem) &gt; 0">
      <div id="sub-menu" class="append-bottom">
        <ul class="menu vertical">
          <xsl:apply-templates select="menuitem" mode="vertical"/>
        </ul>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="menuitem" mode="vertical">
    <xsl:variable name="href">
      <xsl:choose>
        <xsl:when test="@type = 'url'">
          <xsl:value-of select="url"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="portal:createPageUrl(@key, ())"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <li>
      <xsl:if test="@path = 'true'">
        <xsl:attribute name="class">
          <xsl:text>path</xsl:text>
        </xsl:attribute>
      </xsl:if>
      <a href="{$href}">
        <xsl:if test="@active = 'true'">
          <xsl:attribute name="class">active</xsl:attribute>
        </xsl:if>
        <xsl:value-of select="name"/>
      </a>
      <xsl:if test="@path = 'true' and menuitems/menuitem">
        <ul>
          <xsl:apply-templates select="menuitems/menuitem" mode="vertical"/>
        </ul>
      </xsl:if>
    </li>
  </xsl:template>

  <xsl:template name="breadcrumb-trail">
    <span>You are here:</span>
    <xsl:if test="/verticaldata/menus/menu/firstpage/@key">
      <a href="{portal:createPageUrl(/verticaldata/menus/menu/firstpage/@key, ())}">
        <xsl:value-of select="/verticaldata/menus/menu/name"/>
      </a>
    </xsl:if>
    <xsl:call-template name="breadcrumb-trail-path">
      <xsl:with-param name="current-item" select="/verticaldata/menuitems/menuitem[@path = 'true']"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="breadcrumb-trail-path">
    <xsl:param name="current-item"/>
    <xsl:if test="$current-item or $context-page-title != '' or $content or $current-item/@key != $site-first-page-key">
      <xsl:text> » </xsl:text>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="$current-item/@visible != 'no'">
        <a href="{portal:createPageUrl($current-item/@key, ())}">
          <xsl:value-of select="$current-item/name"/>
        </a>
        <xsl:call-template name="breadcrumb-trail-path">
          <xsl:with-param name="current-item" select="$current-item/menuitems/menuitem[@path = 'true']"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$context-page-title != ''">
            <xsl:value-of select="$context-page-title"/>
          </xsl:when>
          <xsl:when test="$content">
            <xsl:value-of select="$content/title"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:if test="$current-item/@key != $site-first-page-key">
              <xsl:value-of select="$current-item/name"/>
            </xsl:if>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>