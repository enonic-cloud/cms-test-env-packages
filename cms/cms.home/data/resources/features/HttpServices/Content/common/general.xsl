<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="#all"
                version="2.0"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:java="http://xml.apache.org/xalan/java"
                xmlns:portal="http://www.enonic.com/cms/xslt/portal"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="script-css">
    <link href="{portal:createResourceUrl('/_public/features/features.css')}" media="screen" rel="stylesheet" type="text/css"/>
    <link href="{portal:createResourceUrl('/_public/features/prettify/prettify.css')}" media="screen" rel="stylesheet" type="text/css"/>
    <script src="{portal:createResourceUrl('/_public/features/scripts/contentOperations.js', ())}" type="text/javascript"><xsl:comment>//</xsl:comment></script>
    <!--script src="{portal:createResourceUrl('/_public/features/prettify/prettify.js', ())}" type="text/javascript"><xsl:comment>//</xsl:comment></script-->
    <script src="{portal:createResourceUrl('/_public/features/scripts/punymce/js/punymce/puny_mce.js', ())}" type="text/javascript"><xsl:comment>//</xsl:comment></script>
  </xsl:template>

  <xsl:template name="display-browse-list">
    <p>
        [ <a href="{portal:createPageUrl($menu-item-key, ('mode', 'create'))}">Create</a> ]
    </p>

    <h2>Exsisting Content</h2>

    <fieldset style="-moz-border-radius:10px;">
      <!--legend>Exsisting Content</legend-->
      <xsl:choose>
        <xsl:when test="count(/result/list/contents/content) &gt; 0">
          <table style="width:100%;margin-bottom:0;" cellpadding="0" cellspacing="0">
            <tbody>
              <xsl:apply-templates select="/result/list/contents/content" mode="browse-list.table-row"/>
            </tbody>
          </table>
        </xsl:when>
        <xsl:otherwise>
          None
        </xsl:otherwise>
      </xsl:choose>
    </fieldset>
  </xsl:template>
  <xsl:template match="content" mode="browse-list.table-row">
    <xsl:variable name="menu-item-key" select="/result/context/resource/@key"/>
    <tr title="Timestamp: {@timestamp}">
      <xsl:if test="position() mod 2 = 1">
        <xsl:attribute name="style">background-color:#f1f1f1</xsl:attribute>
      </xsl:if>
      <td>
        <xsl:value-of select="@key"/>
      </td>
      <td>
        <xsl:value-of select="title"/>
      </td>
      <td style="text-align: right">
        [ <a href="{portal:createPageUrl($menu-item-key, ('mode', 'update', 'key', @key))}">Edit</a> ]
        [ <a href="{portal:createPageUrl($menu-item-key, ('mode', 'modify', 'key', @key))}">Modify</a> ]
        [ <a href="{portal:createServicesUrl( 'content', 'remove', ('key', @key) )}">Remove</a> ]
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="display-operation-header">
    <xsl:param name="mode"/>
    <h2>
      <xsl:text>op = </xsl:text>
      <xsl:choose>
        <xsl:when test="$mode = 'update'">update</xsl:when>
        <xsl:when test="$mode = 'modify'">modify</xsl:when>
        <xsl:otherwise>create</xsl:otherwise>
      </xsl:choose>
      
    </h2>
  </xsl:template>

  <xsl:template name="view-xml">
    <xsl:param name="mode"/>
    <xsl:param name="xml"/>
    <!--xsl:if test="$mode != 'create'">
      <p style="margin: 10px 0">
        [ <a href="javascript:;" onclick="toggleDisplayViewXML(this)">View XML</a> ]
      </p>
      <div style="display:none" id="xml-output">
        <textarea id="xml-view-store" rows="20" cols="60" style="width:94%; display: none">
          <xsl:copy-of select="/"/>
        </textarea>
        <pre id="prettify" class="prettyprint lang-xml" style="height:300px;overflow:scroll">//</pre>
      </div>
    </xsl:if>
    <script type="text/javascript">
      $(document).ready(function() {
        prettyPrint();
      });
    </script-->
  </xsl:template>

  <xsl:template name="save-button">
    <xsl:param name="mode"/>
    <xsl:variable name="button-text">
      <xsl:choose>
        <xsl:when test="not($mode)">Create</xsl:when>
        <xsl:otherwise><xsl:value-of select="$mode"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <p>
      <input type="submit" name="submit" value="{$button-text}" style="text-transform:capitalize"/>
    </p>
  </xsl:template>

  <xsl:template name="display-error">
    <xsl:param name="success"/>
    <xsl:param name="error-code"/>
    <xsl:choose>
      <xsl:when test="$success = 'true'">
        <p style="background-color: DeepSkyBlue; color: #fff; font-weight: bold; padding: 6px">
          Service operation succeeded!
        </p>
      </xsl:when>
      <xsl:when test="$error-code != ''">
        <p style="background-color: red; color: #fff; font-weight: bold; padding: 6px">
          Something went wrong! Error code:
          <xsl:value-of select="$error-code"/>
          <xsl:text> - </xsl:text>
          <xsl:choose>
            <xsl:when test="$error-code = 504">
              Backend operation failed
            </xsl:when>
            <xsl:when test="$error-code = 505">
              Service operation failed
            </xsl:when>
            <xsl:when test="$error-code = 506">
              Permission denied
            </xsl:when>
            <xsl:when test="$error-code = 400">
              Missing parameters
            </xsl:when>
            <xsl:when test="$error-code = 401">
              Illegal values in parameters 
            </xsl:when>
            <xsl:when test="$error-code = 402">
              Failed sending e-mail 
            </xsl:when>
            <xsl:when test="$error-code = 405">
              Invalid captcha 
            </xsl:when>
          </xsl:choose>
        </p>
      </xsl:when>
      <xsl:otherwise>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>