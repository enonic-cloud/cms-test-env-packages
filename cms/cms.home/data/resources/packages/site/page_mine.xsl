<xsl:stylesheet
    exclude-result-prefixes="saxon xs portal"
    version="2.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:saxon="http://icl.com/saxon"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/xhtml1-strict.dtd" encoding="utf-8" indent="yes" method="xhtml" omit-xml-declaration="yes"/>
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

  <!-- Setup -->

  <!-- Set some needed variables -->
  <xsl:variable as="xs:integer" name="horizontalMenuFullWidth" select="980"/>
  <xsl:variable name="logoScreen" select="portal:createResourceUrl('/_public/packages/site/images/logo_screen.gif')"/>
  <xsl:variable name="language" select="/verticaldata/context/@languagecode"/>
  <xsl:variable name="siteName" select="/verticaldata/context/site/name"/>
  <xsl:variable name="currentPageId" select="/verticaldata/context/querystring/parameter[@name = 'id']"/>
  <xsl:variable name="content" select="/verticaldata/contents/content"/>
  <xsl:variable name="menuitem" select="/verticaldata/menus/menu/menuitems/menuitem[@key = $currentPageId]"/>
  <xsl:variable name="heading" select="/verticaldata/context/querystring/parameter[@name = 'heading']"/>

  <!-- set some variables needed for breadcrumbs -->
  <xsl:variable name="firstPageKey" select="/verticaldata/menus/menu/firstpage/@key"/>
  <xsl:variable name="pagetitle" select="/verticaldata/context/querystring/parameter[@name = 'pagetitle']"/>

  <!-- If you have any global javascript, put it here -->
  <xsl:template name="javascript">
    <script src="{portal:createResourceUrl('/_public/packages/commons/scripts/standard.js')}" type="text/javascript"><xsl:comment>//</xsl:comment></script>
    <script src="{portal:createResourceUrl('/_public/packages/commons/scripts/jquery-1.2.2.js')}" type="text/javascript"><xsl:comment>//</xsl:comment></script>
  </xsl:template>

  <!-- Prints the css link tag -->
  <xsl:template name="css">
    <link href="{portal:createResourceUrl('/_public/packages/site/screen.css')}" media="screen" rel="stylesheet" type="text/css"/>
  </xsl:template>

  <!-- error handling -->
  <xsl:param name="webmasterEmail" select="'admin@example.com'"/>
  <xsl:param name="webmasterEmail2" select="'admin@example.com'"/>
  <xsl:variable name="error" select="/verticaldata/context/querystring/parameter[@name = 'http_status_code']"/>
  <xsl:variable name="exception" select="/verticaldata/context/querystring/parameter[@name = 'exception_message']"/>
  
  <!-- End of setup -->
  
  <!-- Main page -->
  <xsl:template match="/">
    <html dir="ltr" xml:lang="{$language}" xmlns="http://www.w3.org/1999/xhtml">
      <xsl:call-template name="head"/>
      <xsl:call-template name="body"/>
    </html>
  </xsl:template>
  
  <!-- Head element -->
  <xsl:template name="head">
    <head>
      <xsl:call-template name="title"/>
      <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
      <meta content="none" name="robots"/>
      <link href="favicon.ico" rel="shortcut icon" type="image/x-icon"/>
      <link href="rss" rel="alternate" title="{$siteName} RSS feed" type="application/rss+xml"/>
      <xsl:call-template name="css"/>
      <xsl:call-template name="javascript"/>
    </head>
  </xsl:template>

  <!-- Page Title --> 
  <!-- dynamic header <title>-tag. Should be like this: content - menuitem(s) - site -->
  <xsl:template name="title">
    <title>
      <!-- Use menuitem's heading if set, else use name -->
      <xsl:choose>
        <xsl:when test="$currentPageId = $firstPageKey">
          <xsl:choose>
              <xsl:when test="/verticaldata/menuitems/menuitem[@path = 'true']/heading !=''">
                <xsl:value-of select="concat(/verticaldata/menuitems/menuitem[@path = 'true']/heading, ' - ', $siteName)"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="concat(/verticaldata/menuitems/menuitem[@path = 'true']/name, ' - ', $siteName)"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="$content">
            <xsl:value-of select="concat($content/title, ' - ')"/>
          </xsl:if>
          <xsl:call-template name="pageTitle">
            <xsl:with-param name="currentMenuitem" select="/verticaldata/menuitems/menuitem[@path = 'true']"/>
          </xsl:call-template>
          <xsl:value-of select="$siteName"/>
        </xsl:otherwise>
      </xsl:choose>
    </title>
  </xsl:template>

  <!-- Body element -->
  <xsl:template name="body">
    <body class="demokit" onload="externalLinks();">
      <div class="outer_framework">
        <a id="top" name="top"/>
        <div id="topbar">
          <xsl:if test="$topBar != ''">
            <xsl:value-of disable-output-escaping="yes" select="$topBar"/>
          </xsl:if>   
          <xsl:choose>
            <xsl:when test="/verticaldata/context/user">
              <xsl:call-template name="userinfo"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:if test="/verticaldata/menus/menu/loginpage/@key">
                You are not logged in
                <xsl:text> | </xsl:text>
                <a href="{portal:createPageUrl(/verticaldata/menus/menu/loginpage/@key,())}" title="Login">Login &gt;&gt;</a>
              </xsl:if>
            </xsl:otherwise>
          </xsl:choose>         
        </div>
        
        <!-- Logo and top menu -->
         <div id="header">
          <a class="screen" href="{portal:createPageUrl(/verticaldata/menus/menu/firstpage/@key, ())}">
            <img alt="{$siteName}" id="logoScreen" src="{$logoScreen}" title="{$siteName}"/>
          </a>
           <!-- If menuitems in menu - place these on top menu -->
          <xsl:choose>
            <xsl:when test="/verticaldata/menuitems/menuitem">
              <xsl:call-template name="topmenu"/>
            </xsl:when>
            <xsl:otherwise>
              <div style="height: 40px;">
                <xsl:comment> </xsl:comment>
              </div>
            </xsl:otherwise>
          </xsl:choose>
        </div>
        
        <!-- Class attribute (?) -->
        <div>
          <xsl:attribute name="class">
            <xsl:text>framework</xsl:text>
            <xsl:choose>
              <xsl:when test="not($rightColumn != '') and not($leftColumn != '' or /verticaldata/menuitems/menuitem/menuitems/menuitem)">
                <xsl:text> oneColumn</xsl:text>
              </xsl:when>
              <xsl:when test="not($leftColumn != '' or /verticaldata/menuitems/menuitem/menuitems/menuitem) or (not($rightColumn != ''))">
                <xsl:text> twoColumns</xsl:text>
              </xsl:when>
               <xsl:when test="($leftColumn != '' or /verticaldata/menuitems/menuitem/menuitems/menuitem) and ($rightColumn != '')">
                <xsl:text> threeColumns</xsl:text>
              </xsl:when>
            </xsl:choose>
          </xsl:attribute>
          
          <!-- Breadcrumbs -->
          <xsl:call-template name="breadcrumbs"/>
          
          <!-- Setup left column -->
          <xsl:if test="$leftColumn != '' or /verticaldata/menuitems/menuitem[@path='true']/menuitems/menuitem">
            <div id="leftColumn">
              <!-- Submenu for active menuitem -->
              <xsl:if test="/verticaldata/menuitems/menuitem[@path='true']/menuitems/menuitem">
                <xsl:call-template name="submenu"/>
              </xsl:if>
              <xsl:value-of disable-output-escaping="yes" select="$leftColumn"/>
              <br/>
            </div>
          </xsl:if>
          
          <!-- Page content -->
          <div class="content">
            <div class="inner-content">
              <!-- Check for errors -->
              <xsl:choose>
            		<xsl:when test="$error != ''">
            		  <div id="errorhandler">
            		    <h1><xsl:value-of select="concat('Error ', string($error))"/></h1>
            		    <p class="error"><xsl:value-of select="$exception"/></p>
            		    <p>Please try again. If the problem persists please contact
            		      <a href="mailto:{$webmasterEmail}"><xsl:value-of select="$webmasterEmail"/></a>
            		      <xsl:text>.</xsl:text>
            		    </p>
            		  </div>
            		  </xsl:when>
            		  <xsl:otherwise>
            		    <xsl:call-template name="heading"/>
            		  </xsl:otherwise>
            		</xsl:choose>
              <xsl:value-of disable-output-escaping="yes" select="$mainColumn"/>
            </div>
          </div>
          <xsl:if test="$rightColumn != ''">
            <div id="rightColumn">
              <xsl:value-of disable-output-escaping="yes" select="$rightColumn"/>
              <br/>
            </div>
          </xsl:if>
          <xsl:comment>stopindex</xsl:comment>
            <xsl:call-template name="footer"/>
          <xsl:comment>startindex</xsl:comment>
        </div>
      </div>
    </body>
  </xsl:template>
<!-- End of page body -->

  <!-- Prints the dynamically defined cascading stylesheet
  <xsl:template name="css">
    <link href="{portal:createResourceUrl(/verticaldata/context/framework/styles/style/@path)}" media="screen" rel="stylesheet" type="text/css"/>
  </xsl:template -->

  <!-- Breadcrumbs template -->  
  <xsl:template name="breadcrumbs">
    <div id="breadcrumbs">
      <div>
        <span>You are here:</span>
        <xsl:text> </xsl:text>
        <xsl:choose>
          <!-- If  firstpage and submenu-items-->
          <xsl:when test="/verticaldata/menuitems/menuitem[@key = $firstPageKey]/menuitems/menuitem">
            <xsl:call-template name="navigationPath">
              <!-- call navigationpath with currentItem = first (and only?) menuItem -->
              <xsl:with-param name="currentItem" select="/verticaldata/menuitems/menuitem"/>
            </xsl:call-template>
          </xsl:when>
          <!-- Else; if current page´s not first page -->
          <xsl:when test="$currentPageId != $firstPageKey">
            <a href="{portal:createPageUrl($firstPageKey, ())}">
              <xsl:value-of select="/verticaldata/menus/menu/name"/>
            </a>
            <!-- Call navigatiopath with currentItem = menuItems in path -->
            <xsl:call-template name="navigationPath">
              <xsl:with-param name="currentItem" select="/verticaldata/menuitems/menuitem[@path = 'true']"/>
            </xsl:call-template>
          </xsl:when>
          <!-- Else; display value of menu (site) -->
          <xsl:otherwise>
            <xsl:value-of select="/verticaldata/menus/menu/name"/>
          </xsl:otherwise>
        </xsl:choose>
      </div>
    </div>
  </xsl:template>

  <!-- navigationpath or breadcrumbs -->
  <xsl:template name="navigationPath">
    <xsl:param name="currentItem"/>
    <!-- if WTF?? This is very hard to read  -->
    <xsl:if test="($currentItem) or ($pagetitle != '') or ($content) or ($currentItem/@key != $firstPageKey)">
      <xsl:text> » </xsl:text>
    </xsl:if>
    <xsl:choose>
      <!-- if currentItem is visible, then create link itself -->
      <xsl:when test="$currentItem/@visible != 'no'">
        <a href="{portal:createPageUrl($currentItem/@key, ())}">
          <xsl:value-of select="$currentItem/name"/>
        </a>
        <!-- ...then call myself with currItem = my children whos in the path -->
        <!--  Why a link here? Should be link only if not leaf -->
        <xsl:call-template name="navigationPath">
          <xsl:with-param name="currentItem" select="$currentItem/menuitems/menuitem[@path = 'true']"/>
        </xsl:call-template>
      </xsl:when>
      <!-- if im NOT visible -->
      <xsl:otherwise>
        <xsl:choose>
          <!-- use either page title or contenttitle as endnode -->
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
  
<!-- Top menu template -->
  <xsl:template name="topmenu">
    <xsl:comment>stopindex</xsl:comment>
    <ul class="menu horizontal">
      <xsl:attribute name="style">
        <xsl:value-of select="concat('width: ', $horizontalMenuFullWidth, 'px;')"/>
      </xsl:attribute>
      <xsl:apply-templates select="/verticaldata/menuitems"/>
    </ul>
    <xsl:comment>startindex</xsl:comment>
  </xsl:template>

  <xsl:template match="menuitems">
    <xsl:variable name="numberOfMenuitems">
      <xsl:value-of select="count(menuitem)"/>
    </xsl:variable>
    <xsl:variable name="tempWidthPerMenuitem" select="floor($horizontalMenuFullWidth div $numberOfMenuitems)"/>
    <xsl:variable name="rest" select="$horizontalMenuFullWidth - ($numberOfMenuitems * $tempWidthPerMenuitem)"/>
    <xsl:apply-templates select="menuitem" mode="topmenu">
      <xsl:with-param name="tempWidthPerMenuitem" select="$tempWidthPerMenuitem"/>
      <xsl:with-param name="rest" select="$rest"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="menuitem" mode="topmenu">
    <xsl:param name="tempWidthPerMenuitem"/>
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
          <xsl:value-of select="$tempWidthPerMenuitem + 1"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$tempWidthPerMenuitem"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <li>
      <xsl:attribute name="style">
        <xsl:value-of select="concat('width: ', $width, 'px;')"/>
      </xsl:attribute>
      <xsl:if test="position() = 1">
        <xsl:attribute name="class"><xsl:text>first</xsl:text></xsl:attribute>
      </xsl:if>
      <xsl:if test="@path = 'true'">
        <xsl:attribute name="class">
          <xsl:text>path</xsl:text>
          <xsl:if test="position() = 1">
            <xsl:text> first</xsl:text>
          </xsl:if>
        </xsl:attribute>
      </xsl:if>
      <a href="{$href}">
        <xsl:if test="@active = 'true'">
          <xsl:attribute name="class">active</xsl:attribute>
        </xsl:if>
        <xsl:value-of select="name"/>
      </a>
    </li>
  </xsl:template>


<!-- Sub menu template -->
  <xsl:template name="submenu">
    <xsl:variable name="activeTopMenuitem" select="/verticaldata/menuitems/menuitem[@path = 'true']"/>
    <xsl:comment>stopindex</xsl:comment>
    <h4><xsl:value-of select="$activeTopMenuitem/name"/></h4>
    <ul class="menu vertical">
      <xsl:apply-templates select="/verticaldata/menuitems/menuitem/menuitems/menuitem" mode="submenu"/>
    </ul>
    <xsl:comment>startindex</xsl:comment>
  </xsl:template>

  <xsl:template match="menuitem" mode="submenu">
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
    </li>
  </xsl:template>

  <!-- Set H1 -->
  <!-- A page should always have ONE <h1>-tag. This template makes sure of that. If there exists any content, it prints the content title.
    If not, the current menuitems subtitle or title is displayed -->
  <xsl:template name="heading">
    <xsl:if test="not($heading = 'false') and not(/verticaldata/context/querystring/parameter[@name = 'key'] != '')">
      <h1>
        <xsl:choose>
          <xsl:when test="$heading = 'contentTitle' and $content">
            <xsl:value-of select="$content/title"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:choose>
              <xsl:when test="$menuitem/subtitle != ''">
                <xsl:value-of select="$menuitem/subtitle"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$menuitem/name"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
      </h1>
    </xsl:if>
  </xsl:template>

<!-- Footer template -->
  <xsl:template name="footer">
    <div id="footer">
      <span>
        Sample packages, all customers with a valid license are entitled to use these templates. Powered by <a href="http://www.enonic.com/" rel="external">Enonic Vertical Site</a>
        <xsl:text> | </xsl:text>
        <a href="{portal:createPageUrl(11, ())}">Sitemap</a>
      </span>
    </div>
  </xsl:template>
  
  <!-- User specific info -->
  <xsl:template name="userinfo">
    <xsl:apply-templates select="/verticaldata/context/user"/>
  </xsl:template>
  
  <xsl:template match="user">
    You are logged in as:
    <xsl:choose>
      <xsl:when test="/verticaldata/menus/menu/loginpage/@key">
        <a href="{portal:createPageUrl(/verticaldata/menus/menu/loginpage/@key,())}" title="Click to view/change your personal details"><xsl:value-of select="@fullname"/></a>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="@fullname"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text> | </xsl:text><a href="javascript:void(0);" onclick="document.location.href='{portal:createServicesUrl('user', 'logout')}'" title="Logout">Logout &gt;&gt;</a>
  </xsl:template>
  
  <!-- Help function, used in "title", recursive -->
  <xsl:template name="pageTitle">
    <xsl:param name="currentMenuitem"/>
    <!-- recurse to last item -->
    <xsl:if test="$currentMenuitem/menuitems/menuitem">
      <xsl:call-template name="pageTitle">
        <xsl:with-param name="currentMenuitem" select="$currentMenuitem/menuitems/menuitem[@path = 'true']"/>
      </xsl:call-template>
    </xsl:if>
    <!-- Add to title -->
    <xsl:if test="$currentMenuitem/@visible != 'no'">
      <xsl:value-of select="concat($currentMenuitem/name, ' - ')"/>
    </xsl:if>
  </xsl:template>
  
  
</xsl:stylesheet>
