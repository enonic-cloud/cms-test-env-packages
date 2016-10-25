<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0"
                xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal"
                xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>
  <xsl:include href="common/general.xsl"/>
  <xsl:include href="common/form-input-types.xsl"/>
  <xsl:param name="category-key" select="108"/>
  <xsl:variable name="selected-content" select="/result/selected-content/contents/content"/>
  <xsl:variable name="menu-item-key" select="/result/context/resource/@key"/>
  <xsl:variable name="mode" select="/result/context/querystring/parameter[@name = 'mode']"/>
  <xsl:variable name="success" select="/result/context/querystring/parameter[@name = 'success']"/>
  <xsl:variable name="error-code" select="/result/context/querystring/parameter[@name = 'error_content_create'] | /result/context/querystring/parameter[@name = 'error_content_update'] | /result/context/querystring/parameter[@name = 'error_content_modify']"/>
  <xsl:variable name="form-action">
    <xsl:choose>
      <xsl:when test="$mode = 'update'">
        <xsl:value-of select="portal:createServicesUrl('content','update', portal:createPageUrl(portal:getPageKey(), ('success', 'true')), ())"/>
      </xsl:when>
      <xsl:when test="$mode = 'modify'">
        <xsl:value-of select="portal:createServicesUrl('content','modify', portal:createPageUrl(portal:getPageKey(), ('success', 'true')), ())"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="portal:createServicesUrl('content','create', portal:createPageUrl(portal:getPageKey(), ('success', 'true')), ())"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:template match="/">
    <div>
      <xsl:call-template name="script-css"/>
      <xsl:call-template name="display-error">
        <xsl:with-param name="success" select="$success"/>
        <xsl:with-param name="error-code" select="$error-code"/>
      </xsl:call-template>
      <xsl:call-template name="display-browse-list"/>
      <xsl:call-template name="display-operation-header">
        <xsl:with-param name="mode" select="$mode"/>
      </xsl:call-template>
      <form action="{$form-action}" method="post" class="cty-form">
        <div>
          <xsl:call-template name="view-xml">
            <xsl:with-param name="mode" select="$mode"/>
          </xsl:call-template>
          <input type="hidden" name="categorykey" value="{$category-key}"/>
          <xsl:if test="$mode = 'update' or $mode = 'modify'">
            <input type="hidden" name="key" value="{$selected-content/@key}"/>
          </xsl:if>
          <fieldset id="fieldset-1">
            <legend>Main</legend>
            <xsl:call-template name="text-input">
              <xsl:with-param name="name" select="'title'"/>
              <xsl:with-param name="value" select="$selected-content/contentdata/title"/>
              <xsl:with-param name="label" select="'Title'"/>
              <xsl:with-param name="required" select="true()"/>
            </xsl:call-template>
            <div id="required-files">
              <p class="add-block-group-button-container">
                [ <a href="javascript:;" onclick="addBlockGroup($('div#block-group-1-template'), $('#required-files'))">Add file</a> ]
              </p>
              <xsl:for-each select="$selected-content/contentdata/required/file">
                <xsl:call-template name="group-1-template">
                  <xsl:with-param name="position" select="position()"/>
                  <xsl:with-param name="select-node" select="@key"/>
                </xsl:call-template>
              </xsl:for-each>
            </div>
            <div id="unrequired-files">
              <p class="add-block-group-button-container">
                [ <a href="javascript:;" onclick="addBlockGroup($('div#block-group-2-template'), $('#unrequired-files'))">Add file</a> ]
              </p>
              <xsl:for-each select="$selected-content/contentdata/unrequired/file">
                <xsl:call-template name="group-2-template">
                  <xsl:with-param name="position" select="position()"/>
                  <xsl:with-param name="select-node" select="@key"/>
                </xsl:call-template>
              </xsl:for-each>
            </div>
          </fieldset>
          <xsl:call-template name="save-button">
            <xsl:with-param name="mode" select="$mode"/>
          </xsl:call-template>
        </div>
      </form>

      <!-- START: Template for addBlockGroup -->
      <div id="block-group-1-template" class="block-group-template">
        <xsl:call-template name="group-1-template">
          <xsl:with-param name="select-node" select="_"/>
          <xsl:with-param name="position" select="-1"/>
        </xsl:call-template>
      </div>
      
      <div id="block-group-2-template" class="block-group-template">
        <xsl:call-template name="group-2-template">
          <xsl:with-param name="select-node" select="_"/>
          <xsl:with-param name="position" select="-1"/>
        </xsl:call-template>
      </div>
      <!-- END: Template for addBlockGroup -->

    </div>
  </xsl:template>

  <xsl:template name="group-1-template">
    <xsl:param name="select-node"/>
    <xsl:param name="position"/>
    <div class="block-group no-border">
      <xsl:call-template name="files-input">
        <xsl:with-param name="name" select="'files_required'"/>
        <xsl:with-param name="value" select="$select-node"/>
        <xsl:with-param name="helper-content" select="/result/helper-content/contents/content"/>
        <xsl:with-param name="label" select="'Required'"/>
        <xsl:with-param name="required" select="true()"/>
      </xsl:call-template>
      <br style="clear:both"/>
    </div>
  </xsl:template>

  <xsl:template name="group-2-template">
    <xsl:param name="select-node"/>
    <xsl:param name="position"/>
    <div class="block-group no-border">
      <xsl:call-template name="files-input">
        <xsl:with-param name="name" select="'files_unrequired'"/>
        <xsl:with-param name="value" select="$select-node"/>
        <xsl:with-param name="helper-content" select="/result/helper-content/contents/content"/>
        <xsl:with-param name="label" select="'Unrequired'"/>
        <xsl:with-param name="required" select="false()"/>
      </xsl:call-template>
      <br style="clear:both"/>
    </div>
  </xsl:template>
</xsl:stylesheet>