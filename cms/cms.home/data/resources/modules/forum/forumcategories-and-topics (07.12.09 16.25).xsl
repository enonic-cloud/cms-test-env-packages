<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:util="enonic:utilities" xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
 <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>
 <xsl:include href="/libraries/utilities.xsl"/>
 <xsl:include href="/libraries/navigation-menu.xsl"/>
 <!-- config.xml -->
 <!-- <xsl:param name="from_name" select="'Versiontest'"/>
 <xsl:param name="from_email" select="'ask@enonic.com'"/>
 <xsl:param name="standard_receiver" select="'ask@enonic.com'"/>
 <xsl:variable name="categoryInfo" select="document(/config/ask-test)"/>-->
 
 <xsl:variable name="forumconfig">
  <forum>
   <receivers>
    <receiver>ask@enonic.com</receiver>
    <receiver>anders@skifte.com</receiver>
   </receivers>
   <from-email>noreply@nytt-forum-versiontest.com</from-email>
   <from-name>Versiontest - nytt forum</from-name>
   <icons>
    <icon name="category">/_public/libraries/images/icon-folder.png</icon>
   </icons>
  </forum>
 </xsl:variable>
 
 
<!-- config end -->
 <xsl:variable name="region-width" select="/result/context/querystring/parameter[@name = '_config-region-width']"/>
 <xsl:variable name="skin" select="/result/context/querystring/parameter[@name = '_config-skin']"/>
 <xsl:variable name="device-class" select="/result/context/device-class"/>
 <xsl:variable name="config" select="document(concat(/result/context/site/path-to-home-resources, '/config.xml'))/config"/>
 <xsl:variable name="config-device-class" select="$config/skins/skin[@name = $skin]/device-classes/device-class[tokenize(@name, ',')[. = $device-class]]"/>
 <xsl:variable name="config-filter">
  <xsl:value-of select="string-join($config-device-class/image/filters/filter, ';')"/>
  <xsl:if test="$config-device-class/image/filters/filter != ''">;</xsl:if>
 </xsl:variable>
 <xsl:variable name="config-imagesize" select="$config-device-class/image/sizes/size"/>
 <xsl:variable name="url-parameters" select="/result/context/querystring/parameter[not(@name = 'index' or @name = 'id' or starts-with(@name, '_config-'))]"/>
 <xsl:variable name="index" select="xs:integer(/result/contents/@index)"/>
 <xsl:variable name="content-count" select="xs:integer(/result/contents/@resultcount)"/>
 <xsl:variable name="total-count" select="xs:integer(/result/contents/@totalcount)"/>
 <xsl:variable name="contents-per-page" select="xs:integer(/result/contents/@count)"/>
 <xsl:variable name="path" select="concat('/', string-join(/result/context/resource/path/resource/name, '/'))"/>
 <xsl:variable name="config-parameter" select="$config/parameters/parameter"/>
 <xsl:variable name="config-image" select="$config-device-class/images/image"/>
 <xsl:variable name="rss-page" select="util:get-scoped-parameter('rss', $path, $config-parameter)" as="element()?"/> 
 <!-- Test: -->
 <xsl:variable name="windwowKey" select="/result/context/window/@key"/>
 <xsl:variable name="portletKey" select="/result/context/window/portlet/@key"/>
 <xsl:variable name="portletUrl" select="portal:createWindowUrl($windwowKey,())"/>
 <xsl:variable name="cat" select="/result/context/querystring/parameter[@name = 'cat']"/>
 <xsl:variable name="countcat" select="/result/context/querystring/parameter[@name = 'countPostsIn']"/>
 <xsl:variable name="isRenderedInline" select="portal:isWindowInline()"/>
 <xsl:template match="/">
  <xsl:choose>
   <xsl:when test="$isRenderedInline = true() and /result/context/querystring/parameter[@name = 'topic']">
    <!-- Show topic-->
    <xsl:apply-templates select="/result/topic/contents/content" mode="show-topic"/>
   </xsl:when>   
   <xsl:when test="/result/categories/category/categories/category and $isRenderedInline = true() and not(/result/context/querystring/parameter[@name = 'topic'])">
    <!-- Categories list view 1: Show forum categories -->
    <script type="text/javascript">  
     <xsl:comment>
      $(document).ready(function(){
      var catid;
      $('table.categories tr').each(function() {
      catid = $(this).attr('id');
      var thisElement = $(this);      
      if (catid) { 
         $('td.replace', this).remove();
            $.get('<xsl:value-of select="$portletUrl"/>?countPostsIn=' + catid, function(data){
            $(data).appendTo(thisElement);
            }); 
      }       
      });
      });
      //</xsl:comment>
     <!-- Alternativ:
      function doSomethingWithData(data) {     
      $(data).appendTo(thisElement); }
      $.get('<xsl:value-of select="$portletUrl"/>?countPostsIn=' + catid, doSomethingWithData);-->
    </script>        
    <xsl:call-template name="list-categories"/>
   </xsl:when>   
   <xsl:when test="$isRenderedInline != true() and $countcat">
    <!--Categories list view 2: This HTML fragment is injected into the categories table (see script above) --> 
    <xsl:variable name="latest-post" select="/result/latestpost/contents/content[1]"/>
    <xsl:variable as="xs:integer" name="replies" select="if (/result/latestpost/contents/@searchcount) then /result/latestpost/contents/@searchcount else '0'"/>
    <xsl:variable name="topics" select="/result/categories/category/categories/category[@key = $countcat]/@contentcount - $replies"/>
    <td class="topics">
     <xsl:value-of select="$topics"/>
    </td>
    <td class="replies">
     <xsl:value-of select="$replies"/>
    </td>
    <td>
     <xsl:value-of select="$latest-post/owner/display-name"/>
     <xsl:if test="$latest-post/@publishfrom">
      <br/>
      <xsl:value-of select="util:format-date($latest-post/@publishfrom, /result/context/@languagecode, 'short', true())"/>
     </xsl:if>
    </td>
   </xsl:when>
     <xsl:otherwise>   
    <!-- Looking inside a category: Topics list -->
    <h2>
     <xsl:value-of select="/result/categories/category[1]/@name"/>
    </h2>
    <xsl:choose>
     <xsl:when test="/result/topics/contents/content">
      <xsl:call-template name="list-topics"/>
     </xsl:when>
     <xsl:otherwise>
      No topics
     </xsl:otherwise>
    </xsl:choose>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>
 <xsl:template name="list-topics">
   <table class="forum">
    <thead>
     <tr>
      <th class="icons">
       <xsl:comment>//</xsl:comment>
      </th>
      <th>
       <xsl:text>Topics</xsl:text>
       <!--<xsl:value-of select="portal:localize('Forum')"/>-->
      </th>
      <th>
       <xsl:text>Replies</xsl:text>
       <!--<xsl:value-of select="portal:localize('Topics')"/>-->
      </th>
      <th>
       <xsl:text>Latest post</xsl:text>
       <!--<xsl:value-of select="portal:localize('Latest-post')"/>-->
      </th>
     </tr>
    </thead>
    <tbody>
     <xsl:apply-templates select="/result/topics/contents/content" mode="topics"/>
    </tbody>
   </table>

 </xsl:template>
 <xsl:template match="content" mode="topics">
  <xsl:variable name="href" select="portal:createPageUrl(('topic', @key))"/>
  <xsl:variable name="latest-reply" select="/result/topics/contents/relatedcontents/content[@key = current()/relatedcontentkeys/relatedcontentkey[position() = last()]/@key]"/>
  <tr id="{@key}">
   <xsl:if test="position() mod 2 = 0">
    <xsl:attribute name="class">highlight</xsl:attribute>
   </xsl:if>
   <td>
    <a href="{$href}">
     <!-- Config.xml?-->
     <img class="icon" alt="{concat(portal:localize('Folder'), ' ', portal:localize('icon'))}" src="{portal:createResourceUrl('/_public/libraries/images/icon-folder.png')}"/>
    </a>
   </td>
   <td>
    <a href="{$href}" title="{title}">
     <xsl:value-of select="title"/>
    </a>
   </td>
   <td>
    <xsl:value-of select="relatedcontentkeys/@count"></xsl:value-of>
   </td>
   <td>
    <!--<xsl:variable name="latest-reply" select="/result/topics/contents/relatedcontents/content[@key = relatedcontentkeys/relatedcontentkey/@key]"/>-->
    <xsl:value-of select="$latest-reply/owner/display-name"/>
    <xsl:if test="$latest-reply/@publishfrom">
     <br/>
     <xsl:value-of select="util:format-date($latest-reply/@publishfrom, /result/context/@languagecode, 'short', true())"/>
    </xsl:if>
   </td>
   </tr>
 </xsl:template> 
 <xsl:template match="content" mode="show-topic">
  <h2>
   <xsl:value-of select="title"/>
  </h2>
  <table class="forum">
   <thead>
    <tr>
     <th style="width:30%">
      <xsl:text>Posted by</xsl:text>
     </th>
     <th>
      <xsl:text>Thread</xsl:text>
      <!--<xsl:value-of select="portal:localize('Forum')"/>-->
     </th>
    </tr>
   </thead>
   <tbody>
    <!-- Display topic: -->
    <xsl:call-template name="display-post">
     <xsl:with-param name="position" select="position()"/>
    </xsl:call-template>
    <!-- Display replies to topic-->
    <xsl:for-each select="/result/topic/contents/relatedcontents/content[@key = current()/relatedcontentkeys/relatedcontentkey[@level = '-1']/@key]">
    <xsl:sort select="@publishfrom"/>
     <xsl:call-template name="display-post">
      <xsl:with-param name="position" select="position() +1"/>
     </xsl:call-template>
     </xsl:for-each>
   </tbody>
  </table>
  <div style="border:1px solid red;">
   <xsl:call-template name="forum.post-reply"/>
  </div>
 </xsl:template> 
 <xsl:template name="display-post">
  <xsl:param as="xs:integer" name="position" select="0"/>
  <tr>
   <xsl:if test="$position mod 2 = 0">
    <xsl:attribute name="class">highlight</xsl:attribute>
   </xsl:if>
   <td>
    <xsl:value-of select="owner/display-name"/>
    <br/>
    <xsl:value-of select="util:format-date(@publishfrom, /result/context/@languagecode, 'short', true())"/>
   </td>
   <td>
    <xsl:if test="string-length(contentdata/text) > 0">
     <xsl:call-template name="formatForumOutput">
      <xsl:with-param name="inputString" select="contentdata/text"/>
     </xsl:call-template>
    </xsl:if>
   </td>
  </tr>
 </xsl:template>
 <xsl:template name="list-categories">
  <table class="forum categories">
   <!-- .categories is a jQuery selector. Do not remove. -->
   <thead>
    <tr>
     <th class="icons">
      <xsl:comment>//</xsl:comment>
     </th>
     <th>
      <xsl:text>Category</xsl:text>
      <!--<xsl:value-of select="portal:localize('Forum')"/>-->
     </th>
     <th>
      <xsl:text>Topics</xsl:text>
      <!--<xsl:value-of select="portal:localize('Topics')"/>-->
     </th>
     <th>
      <xsl:text>Posts</xsl:text>
      <!--<xsl:value-of select="portal:localize('Posts')"/>-->
     </th>
     <th>
      <xsl:text>Latest post</xsl:text>
      <!--<xsl:value-of select="portal:localize('Latest-post')"/>-->
     </th>
    </tr>
   </thead>
   <tbody>
    <xsl:apply-templates select="/result/categories/category/categories/category"/>
   </tbody>
  </table>
 </xsl:template> 
 <xsl:template match="category">
  <xsl:variable name="href" select="portal:createPageUrl(('cat', @key))"/>
  <tr id="{@key}">
   <xsl:if test="position() mod 2 = 0">
    <xsl:attribute name="class">highlight</xsl:attribute>
   </xsl:if>
   <td>
    <a href="{$href}">
     <!-- Config.xml?-->
     <img class="icon" alt="{concat(portal:localize('Folder'), ' ', portal:localize('icon'))}" src="{portal:createResourceUrl('/_public/libraries/images/icon-folder.png')}"/>
    </a>
   </td>
   <td class="inject">
    <a href="{$href}">
     <xsl:value-of select="@name"/>
    </a>
   </td>
   <td class="replace">
    Loading..
   </td>
   <td class="replace">
    Loading..
   </td>
   <td class="replace">
    Loading..
   </td>
  </tr>
 </xsl:template>
 
 <!-- INCLUDE -->
 <xsl:template name="forum.post-topic">
  <h1>
   <xsl:value-of select="portal:localize('Forum-new-post')"/>
  </h1>
  <xsl:variable name="redirect" select="portal:createPageUrl(('cat', @key))"/>    
  <form action="{portal:createServicesUrl('content_sendmail', 'send', $redirect, ())}" method="post" name="forum">
   <div>
    <input name="categorykey" type="hidden" value="{$cat}"/>
    <input name="top" type="hidden" value="true"/>
    <input name="email" type="hidden" value="{/result/context/user/email}"/>
   <!-- <xsl:call-template name="forum.post-content"/>-->
   </div>
  </form>
 </xsl:template>
 
 
 <!--############# REPLY ################# -->
 <xsl:template name="forum.post-reply">
  <h1>    
   <xsl:value-of select="concat(portal:localize('Forum-reply-to'), ' &quot;', /result/contents/content/contentdata/title, '&quot;')"/>
  </h1>
  <xsl:variable name="redirect" select="portal:createPageUrl(('cat',//parameter[@name='cat']))"/>
  <form action="{portal:createServicesUrl('content_sendmail', 'send', $redirect, ())}" id="formPosting" method="post" name="formPosting">
   <fieldset>
    <input name="categoryname" type="hidden" value="{/result/topic/contents/content[1]/category/@name}"/>
    <input name="categorykey" type="hidden" value="{/result/topic/contents/content[1]/category/@key}"/>
    <!-- Stores the reply in the same folder as the topic-->    
    <input name="topic" type="hidden" value="{/result/topic/contents/content[1]/@key}"/>
    <!-- The reply must be related to the topic -->
    <input name="posting" type="hidden" value="{/result/context/querystring/parameter[@name = 'reply-to']}"/>
    <!-- reply-to is the key of another posting, not topic (used if threaded view)-->    
    <input name="email" type="hidden" value="{/result/context/user/email}"/>
   <xsl:for-each select="$forumconfig/forum/receivers/receiver">
    <input name="to" type="hidden" value="{.}"/>
    <!-- add creator? -->
   </xsl:for-each>
    <input name="from_email" type="hidden" value="{$forumconfig/forum/from-email}"/>
    <input name="from_name" type="hidden" value="{$forumconfig/forum/from-name}"/>
    <input name="subject" type="hidden" value="{portal:localize('Forum-mail-subject')}"/>    
    <input name="sort_order" type="hidden" value="author,category,title,body"/>
   
   <!--#### post content #### -->
    <label for="author" class="forum">        
     <xsl:value-of select="portal:localize('Name')"/>
    </label>       
    <input type="text" class="text required" name="author" id="author" value="{/result/context/user/display-name}"/>
    <label for="title" class="forum">
     <xsl:value-of select="portal:localize('Forum-subject')"/>
    </label>
    <input id="title" name="title" class="text required" type="text">
     <xsl:attribute name="value">
      <xsl:if test="string-length(/result/topic/contents/content[1]/title) > 0">
       <xsl:text>Re: </xsl:text>
       <xsl:choose>
        <xsl:when test="substring(/result/topic/contents/content[1]/title, 1, 3) = 'Re: '">
         <xsl:value-of select="substring(/result/topic/contents/content[1]/title, 4)"/>
        </xsl:when>
        <xsl:otherwise>
         <xsl:value-of select="/result/topic/contents/content[1]/title"/>
        </xsl:otherwise>
       </xsl:choose>
      </xsl:if>
     </xsl:attribute>
    </input>
    <div class="inputwrapper">
     
     <label for="body" class="forum">
      <xsl:text>Content</xsl:text>
     </label>
     
     <div class="new-post-wrapper">
      <div class="clear clearfix">
       <xsl:call-template name="forum.editor-buttons"/>
      </div>
      <textarea name="body" id="body" class="required">
       <xsl:if test="/result/context/querystring/parameter[@name = 'quote'] = 'yes'">
        <xsl:value-of select="'&#xa;&#xa;&#xa;&#xa;[cite]'"/>
        <xsl:value-of disable-output-escaping="yes" select="/result/contents[1]/content/contentdata/body"/>
        <xsl:value-of select="'&#xa;[/cite]'"/>
       </xsl:if>
      </textarea>          
     </div>
    </div>
    <div class="clearfix clear">
     <input class="button" type="submit" value="{portal:localize('Submit')}"/>
    </div>
   
   
   
   </fieldset>
  </form>
 </xsl:template>
 
 <!--############# FORM CONTENT ################# -->
 <!--<xsl:template name="forum.post-content">
  <input name="to" type="hidden" value="{$standard_receiver}"/>
  <input name="from_email" type="hidden" value="{$from_email}"/>
  <input name="from_name" type="hidden" value="{$from_name}"/>
  <input name="subject" type="hidden" value="{portal:localize('Forum-mail-subject')}"/>
  <input name="category" type="hidden" value="{/result/categories/category/@name}"/>
  <input name="sort_order" type="hidden" value="author,category,title,body"/>
  <label for="author" class="forum">        
   <xsl:value-of select="portal:localize('Name')"/>
  </label>       
  <input type="text" class="text required" name="author" id="author" value="{/result/context/user/display-name}" readonly="readonly"/>
  <label for="title" class="forum">
   <xsl:value-of select="portal:localize('Forum-subject')"/>
  </label>
  <input id="title" name="title" class="text required" type="text">
   <xsl:attribute name="value">
    <xsl:if test="string-length(/result/topic/contents/content[1]/title) > 0">
     <xsl:text>Re: </xsl:text>
     <xsl:choose>
      <xsl:when test="substring(/result/topic/contents/content[1]/title, 1, 3) = 'Re: '">
       <xsl:value-of select="substring(/result/topic/contents/content[1]/title, 4)"/>
      </xsl:when>
      <xsl:otherwise>
       <xsl:value-of select="/result/topic/contents/content[1]/title"/>
      </xsl:otherwise>
     </xsl:choose>
    </xsl:if>
   </xsl:attribute>
  </input>
  <div class="inputwrapper">
   
   <label for="body" class="forum">
    <xsl:text>Content</xsl:text>
   </label>
   
   <div class="new-post-wrapper">
    <div class="clear clearfix">
     <xsl:call-template name="forum.editor-buttons"/>
    </div>
    <textarea name="body" id="body" class="required">
     <xsl:if test="/result/context/querystring/parameter[@name = 'quote'] = 'yes'">
      <xsl:value-of select="'&#xa;&#xa;&#xa;&#xa;[cite]'"/>
      <xsl:value-of disable-output-escaping="yes" select="/result/contents[1]/content/contentdata/body"/>
      <xsl:value-of select="'&#xa;[/cite]'"/>
     </xsl:if>
    </textarea>          
   </div>
  </div>
  <div class="clearfix clear">
   <input class="button" type="submit" value="{portal:localize('Submit')}"/>
  </div>
 </xsl:template>-->
 <xsl:template name="forum.editor-buttons">
  <ul class="taglist">
   <li>
    <a href="javascript:addTag('[b]','[/b]');" title="Bold">
     <img alt="Bold" class="smiley" src="{portal:createResourceUrl('/_public/libraries/forum/images/icon_bold.png')}"/>
    </a>
   </li>
   <li>
    <a href="javascript:addTag('[i]','[/i]');" title="Italic">
     <img alt="Italic" class="smiley" src="{portal:createResourceUrl('/_public/libraries/forum/images/icon_italic.png')}"/>
    </a>
   </li>
   <li>
    <a href="javascript:addTag('[u]','[/u]');" title="Underlined">
     <img alt="Underlined" class="smiley" src="{portal:createResourceUrl('/_public/libraries/forum/images/icon_underline.png')}"/>
    </a>
   </li>
   <li>
    <a href="javascript:addTag('[strike]','[/strike]');" title="Strikethrough">
     <img alt="Strikethrough" class="smiley" src="{portal:createResourceUrl('/_public/libraries/forum/images/icon_strikethrough.png')}"/>
    </a>
   </li>
   <li>
    <a href="javascript:addTag('[sub]','[/sub]');" title="Subscript">
     <img alt="Subscript" class="smiley" src="{portal:createResourceUrl('/_public/libraries/forum/images/icon_subscript.png')}"/>
    </a>
   </li>
   <li style="margin-right: 20px;">
    <a href="javascript:addTag('[sup]','[/sup]');" title="Superscript">
     <img alt="Superscript" class="smiley" src="{portal:createResourceUrl('/_public/libraries/forum/images/icon_superscript.png')}"/>
    </a>
   </li>
   <li>
    <a href="javascript:addTag('',':)');" title="Smiley face">
     <img alt=":)" class="smiley" src="{portal:createResourceUrl('/_public/libraries/forum/images/smile.png')}"/>
    </a>
   </li>
   <li>
    <a href="javascript:addTag('',':(');" title="Sad face">
     <img alt=":)(" class="smiley" src="{portal:createResourceUrl('/_public/libraries/forum/images/unhappy.png')}"/>
    </a>
   </li>
   <li>
    <a href="javascript:addTag('',':D');" title="Happy face">
     <img alt=":D" class="smiley" src="{portal:createResourceUrl('/_public/libraries/forum/images/happy.png')}"/>
    </a>
   </li>
   <li>
    <a href="javascript:addTag('',':p');" title="Tongue face">
     <img alt=":p" class="smiley" src="{portal:createResourceUrl('/_public/libraries/forum/images/tongue.png')}"/>
    </a>
   </li>
   <li style="margin-right: 20px;">
    <a href="javascript:addTag('',':o');" title="Surprised face">
     <img alt=":o" class="smiley" src="{portal:createResourceUrl('/_public/libraries/forum/images/surprised.png')}"/>
    </a>
   </li>
   <li class="select">
    <select name="codes" onchange="openFunction(this);">
     <option value="#">- Insert program code -</option>
     <option value="addTag('[code]','[/code]');">Unformatted code</option>
     <option value="addTag('[code=c]','[/code]');">C++</option>
     <option value="addTag('[code=csharp]','[/code]');">C#</option>
     <option value="addTag('[code=css]','[/code]');">CSS</option>
     <option value="addTag('[code=delphi]','[/code]');">Delphi</option>
     <option value="addTag('[code=html]','[/code]');">HTML</option>
     <option value="addTag('[code=java]','[/code]');">Java</option>
     <option value="addTag('[code=js]','[/code]');">JavaScript</option>
     <option value="addTag('[code=py]','[/code]');">Python</option>
     <option value="addTag('[code=ruby]','[/code]');">Ruby</option>
     <option value="addTag('[code=sql]','[/code]');">SQL</option>
     <option value="addTag('[code=vb]','[/code]');">VB, VB.NET</option>
     <option value="addTag('[code=xml]','[/code]');">XML</option>
     <option value="addTag('[code=xslt]','[/code]');">XSLT</option>
    </select>
   </li>
  </ul>
 </xsl:template>
 <xsl:template name="formatForumOutput">
  <xsl:param name="inputString"/>
  <!-- Konfigurering av replacements i forumet -->
  <xsl:variable name="replacements">
   <replacements smileypath="/_public/modules/forum/images/" xmlns="">
    <replace input="&#xa;" output="&lt;br/>" xmlns=""/>
    <replace input=":)" output="smile.png" smiley="true"/>
    <replace input=":(" output="unhappy.png" smiley="true"/>
    <replace input=":o" output="surprised.png" smiley="true"/>
    <replace input=":p" output="tongue.png" smiley="true"/>
    <replace input=":D" output="happy.png" smiley="true"/>
    <replace input=":-)" output="smile.png" smiley="true"/>
    <replace input=":-(" output="unhappy.png" smiley="true"/>
    <replace input=":-o" output="surprised.png" smiley="true"/>
    <replace input=":-p" output="tongue.png" smiley="true"/>
    <replace input=":-D" output="happy.png" smiley="true"/>
    <replace input="[cite]" output="&lt;blockquote>"/>
    <replace input="[/cite]" output="&lt;/blockquote>"/>    
    <!-- Tags som ikke kan ha innhold -->        
    <replace close="[/code]" closeoutput="&lt;/code>&lt;/pre>" input="[code]" output="&lt;pre>&lt;code>"/>
    <replace close="[/code]" closeoutput="&lt;/pre>" input="[code=c]" output="&lt;pre class=&quot;brush: c;&quot;>"/>
    <replace close="[/code]" closeoutput="&lt;/pre>" input="[code=csharp]" output="&lt;pre class=&quot;brush: csharp;&quot;>"/>
    <replace close="[/code]" closeoutput="&lt;/pre>" input="[code=css]" output="&lt;pre class=&quot;brush: css;&quot;>"/>
    <replace close="[/code]" closeoutput="&lt;/pre>" input="[code=delphi]" output="&lt;pre class=&quot;brush: delphi;&quot;>"/>
    <replace close="[/code]" closeoutput="&lt;/pre>" input="[code=html]" output="&lt;pre class=&quot;brush: html;&quot;>"/>
    <replace close="[/code]" closeoutput="&lt;/pre>" input="[code=java]" output="&lt;pre class=&quot;brush: java;&quot;>"/>
    <replace close="[/code]" closeoutput="&lt;/pre>" input="[code=js]" output="&lt;pre class=&quot;brush: js;&quot;>"/>
    <replace close="[/code]" closeoutput="&lt;/pre>" input="[code=py]" output="&lt;pre class=&quot;brush: py;&quot;>"/>
    <replace close="[/code]" closeoutput="&lt;/pre>" input="[code=ruby]" output="&lt;pre class=&quot;brush: ruby;&quot;>"/>
    <replace close="[/code]" closeoutput="&lt;/pre>" input="[code=sql]" output="&lt;pre class=&quot;brush: sql;&quot;>"/>
    <replace close="[/code]" closeoutput="&lt;/pre>" input="[code=vb]" output="&lt;pre class=&quot;brush: vb;&quot;>"/>
    <replace close="[/code]" closeoutput="&lt;/pre>" input="[code=xml]" output="&lt;pre class=&quot;brush: xml;&quot;>"/>
    <replace close="[/code]" closeoutput="&lt;/pre>" input="[code=xslt]" output="&lt;pre class=&quot;brush: xslt;&quot;>"/>
    <replace close="[/b]" closeoutput="&lt;/strong>" input="[b]" output="&lt;strong>"/>
    <replace close="[/i]" closeoutput="&lt;/i>" input="[i]" output="&lt;i>"/>
    <replace close="[/u]" closeoutput="&lt;/u>" input="[u]" output="&lt;u>"/>
    <replace close="[/strike]" closeoutput="&lt;/span>" input="[strike]" output="&lt;span style=&quot;text-decoration:line-through;&quot;>"/>
    <replace close="[/sub]" closeoutput="&lt;/sub>" input="[sub]" output="&lt;sub>"/>
    <replace close="[/sup]" closeoutput="&lt;/sup>" input="[sup]" output="&lt;sup>"/>
   </replacements>
  </xsl:variable>
  <!-- Kjør replacement -->
  <xsl:call-template name="replace">
   <xsl:with-param name="inputString" select="$inputString"/>
   <xsl:with-param name="replaceNode" select="$replacements"/>
  </xsl:call-template>
 </xsl:template> 
 <xsl:template name="replace">
  <xsl:param name="inputString"/>
  <xsl:param name="replaceNode"/>
  <!-- Genererer sortert tre over første forekomstene av replacement-streng -->
  <xsl:variable name="positionNode">
   <replacements smileypath="{$replaceNode/replacements/@smileypath}" xmlns="">
    <xsl:for-each select="$replaceNode/replacements/replace">
     <xsl:sort data-type="number" select="string-length(substring-before($inputString, @input))"/>
     <xsl:if test="contains($inputString, @input)">
      <replace as="{@as}" close="{@close}" closeoutput="{@closeoutput}" input="{@input}" output="{@output}" position="{string-length(substring-before($inputString, @input))}" smiley="{@smiley}"/>
     </xsl:if>
    </xsl:for-each>
   </replacements>
  </xsl:variable>
  <!-- Kjør ut den første strengen -->
  <xsl:choose>
   <xsl:when test="count($positionNode/replacements/replace) > 0">
    <xsl:value-of select="substring-before($inputString, $positionNode/replacements/replace[1]/@input)"/>
    <xsl:choose>
     <!-- Skal hele innholdet i taggen skrives ut uten å ta hensyn til innhold? -->
     <xsl:when test="string-length($positionNode/replacements/replace[1]/@close) > 0 and contains($inputString, $positionNode/replacements/replace[1]/@close)">
      <xsl:choose>
       <!-- Skal nodetre skrives ut? -->
       <xsl:when test="$positionNode/replacements/replace[1]/@as = 'xml'">
        <xsl:value-of disable-output-escaping="yes" select="concat($positionNode/replacements/replace[1]/@output, substring-after(substring-before($inputString, $positionNode/replacements/replace[1]/@close), $positionNode/replacements/replace[1]/@input), $positionNode/replacements/replace[1]/@closeoutput)"/>
       </xsl:when>
       <xsl:otherwise>
        <xsl:value-of disable-output-escaping="yes" select="$positionNode/replacements/replace[1]/@output"/>
        <xsl:value-of select="substring-after(substring-before($inputString, $positionNode/replacements/replace[1]/@close), $positionNode/replacements/replace[1]/@input)"/>
        <xsl:value-of disable-output-escaping="yes" select="$positionNode/replacements/replace[1]/@closeoutput"/>
       </xsl:otherwise>
      </xsl:choose>
     </xsl:when>
     <xsl:otherwise>
      <xsl:choose>
       <xsl:when test="$positionNode/replacements/replace[1]/@smiley='true'">
        <xsl:variable name="pathToImg" select="concat($positionNode/replacements/@smileypath,$positionNode/replacements/replace[1]/@output)"/>
        <img class="smiley" src="{portal:createResourceUrl($pathToImg)}"/>
       </xsl:when>
       <xsl:otherwise>
        <xsl:value-of disable-output-escaping="yes" select="$positionNode/replacements/replace[1]/@output"/>
       </xsl:otherwise>
      </xsl:choose>     
     </xsl:otherwise>
    </xsl:choose>   
    <xsl:variable name="newInput">
     <xsl:choose>
      <xsl:when test="string-length($positionNode/replacements/replace[1]/@close) > 0 and contains($inputString, $positionNode/replacements/replace[1]/@close)">
       <xsl:value-of select="substring-after($inputString, $positionNode/replacements/replace[1]/@close)"/>
      </xsl:when>
      <xsl:otherwise>
       <xsl:value-of select="substring-after($inputString, $positionNode/replacements/replace[1]/@input)"/>
      </xsl:otherwise>
     </xsl:choose>
    </xsl:variable>    
    <!-- Kjør rekursivt og se om det fins flere forekomster -->
    <xsl:call-template name="replace">
     <xsl:with-param name="inputString" select="$newInput"/>
     <xsl:with-param name="replaceNode" select="$positionNode"/>
    </xsl:call-template>
   </xsl:when>
   <xsl:otherwise>
    <xsl:value-of select="$inputString"/>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>
</xsl:stylesheet>