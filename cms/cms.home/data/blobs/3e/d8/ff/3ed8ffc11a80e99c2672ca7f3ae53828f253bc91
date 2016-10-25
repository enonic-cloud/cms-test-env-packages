<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal"
                version="2.0"
                xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal"
                xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
              doctype-system="http://www.w3.org/TR/xhtml1/xhtml1-strict.dtd" encoding="utf-8" indent="yes"
              method="xhtml" omit-xml-declaration="yes" media-type="text/html"/>

  <xsl:include href="/features/includes/displayContext.xsl"/>

  <xsl:param name="topBar">
    <type>object</type>
  </xsl:param>
  <xsl:param name="leftColumn">
    <type>object</type>
  </xsl:param>
  <xsl:param name="mainColumn">
    <type>object</type>
  </xsl:param>
  <xsl:param name="rightColumn">
    <type>object</type>
  </xsl:param>

  <xsl:variable name="loadPortletWindowsLazy"
                select="boolean(/result/context/querystring/parameter[@name = 'lazyLoadPortlets' and node() = 'true'])"/>

  <!-- Set some needed variables -->
  <xsl:variable name="currentPageId" select="/result/context/querystring/parameter[@name = 'id']"/>
  <xsl:variable name="content" select="/result/contents/content"/>
  <xsl:variable name="menuitem" select="/result/menus/menu/menuitems/menuitem[@key = $currentPageId]"/>

  <!-- set some variables needed for breadcrumbs -->
  <xsl:variable name="firstPageKey" select="/result/menus/menu/firstpage/@key"/>
  <xsl:variable name="pagetitle" select="/result/context/querystring/parameter[@name = 'pagetitle']"/>


  <xsl:template match="/">

    <html>
      <head>
        <!--link href="{portal:createResourceUrl('/_public/packages/site/screen.css')}" media="screen" rel="stylesheet" type="text/css"/-->
        <script src="{portal:createResourceUrl('/_public/features/scripts/jquery-1.3.2.min.js')}"
                type="text/javascript">
          <xsl:comment>//</xsl:comment>
        </script>
      </head>
      <body>

        <div>
          <div>
            <xsl:call-template name="breadcrumbs"/>

            
            <!-- Page content -->
            <div class="content">
              <div class="inner-content">

                <h1>Regions</h1>
                <p>
                  A page is divided into one or several regions. Regions for a page is defined in the
                  XSLT template for the page template.
                </p>
                <p>
                  In this page template we display the page's regions by using the new portal function named
                  createWindowPlaceholder.
                  This gives the developer more control over what is to be displayed between each portlet in a region.
                  You may wonder where the developer gets the region and portlet information from? Well, it is now
                  perfectly layed out
                  in the context of the page.
                </p>
                <p>
                  Here we display the portlet windows in the region named 'mainColumn':
                  <xsl:call-template name="displayRegion">
                    <xsl:with-param name="regionName" select="'mainColumn'"/>
                    <xsl:with-param name="lazyLoad" select="$loadPortletWindowsLazy"/>
                  </xsl:call-template>
                </p>
                <xsl:call-template name="displayContext"/>
              </div>
            </div>

          </div>
        </div>

      </body>
    </html>

  </xsl:template>

  <xsl:template name="displayRegion">
    <xsl:param name="regionName"/>
    <xsl:param name="lazyLoad" select="false()"/>

    <xsl:value-of disable-output-escaping="yes" select="$topBar"/>
    <br/>
    region skille
    <br/>
    <xsl:value-of disable-output-escaping="yes" select="$leftColumn"/>
    <br/>
    region skille
    <br/>
    <xsl:value-of disable-output-escaping="yes" select="$mainColumn"/>
    <br/>
    region skille
    <br/>
    <xsl:value-of disable-output-escaping="yes" select="$rightColumn"/>    

  </xsl:template>

  <!-- Breadcrumbs template -->
  <xsl:template name="breadcrumbs">
    <div id="breadcrumbs">
      <div>
        <span>You are here:</span>
        <xsl:text> </xsl:text>
        <a href="{portal:createPageUrl($firstPageKey, ())}">
          <xsl:value-of select="/result/menus/menu/name"/>
        </a>
        <xsl:choose>
          <xsl:when test="/result/menuitems/menuitem[@key = $firstPageKey]/menuitems/menuitem">
            <xsl:call-template name="navigationPath">
              <xsl:with-param name="currentItem" select="/result/menuitems/menuitem"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="$currentPageId != $firstPageKey">
            <xsl:call-template name="navigationPath">
              <xsl:with-param name="currentItem" select="/result/menuitems/menuitem[@path = 'true']"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="/result/menus/menu/name"/>
          </xsl:otherwise>
        </xsl:choose>
      </div>
    </div>
  </xsl:template>

  <!-- navigationpath or breadcrumbs -->
  <xsl:template name="navigationPath">
    <xsl:param name="currentItem"/>
    <xsl:if test="$currentItem or $pagetitle != '' or $content or $currentItem/@key != $firstPageKey">
      <xsl:text> » </xsl:text>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="$currentItem/@visible != 'no'">
        <a href="{portal:createPageUrl($currentItem/@key, ())}">
          <xsl:value-of select="$currentItem/name"/>
        </a>
        <xsl:call-template name="navigationPath">
          <xsl:with-param name="currentItem" select="$currentItem/menuitems/menuitem[@path = 'true']"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$pagetitle != ''">
            <xsl:value-of select="$pagetitle"/>
          </xsl:when>
          <xsl:when test="$content">
            <xsl:value-of select="$content/title"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:if test="$currentItem/@key != $firstPageKey">
              <xsl:value-of select="$currentItem/name"/>
            </xsl:if>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


</xsl:stylesheet>
