<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:portal="http://www.enonic.com/cms/xslt/portal">

  <xsl:template name="text-input">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:param name="required" select="false()"/>
    <xsl:param name="label"/>
    <div class="cty-input-row">
      <xsl:call-template name="form-input-types.label">
        <xsl:with-param name="label" select="$label"/>
        <xsl:with-param name="required" select="$required"/>
      </xsl:call-template>
      <input type="text" name="{$name}" value="{$value}"/>
      <xsl:call-template name="form-input-types.disable-enable-button"/>
    </div>
  </xsl:template>

  <xsl:template name="date-input">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:param name="required" select="false()"/>
    <xsl:param name="label"/>
    <xsl:variable name="formated-date">
      <xsl:if test="$value != ''">
        <xsl:variable name="year" select="substring($value, 1,4)"/>
        <xsl:variable name="month" select="substring($value, 6,2)"/>
        <xsl:variable name="day" select="substring($value, 9,2)"/>
        xx<xsl:value-of select="concat($day, '.', $month, '.', $year)"/>
      </xsl:if>
    </xsl:variable>
    <div class="cty-input-row">
      <xsl:call-template name="form-input-types.label">
        <xsl:with-param name="label" select="$label"/>
        <xsl:with-param name="required" select="$required"/>
      </xsl:call-template>
      <input type="text" name="{$name}" value="{$formated-date}"/>
      <xsl:call-template name="form-input-types.disable-enable-button"/>
      <div style="float:left;margin-left:3px">
        [ <a href="javascript:;" onclick="$(this).parent().parent().find('input[type=text]').val(getDateToday(false));">Insert valid date</a> ]
      </div>
      <div style="float:left;margin-left:3px">
        [ <a href="javascript:;" onclick="$(this).parent().parent().find('input[type=text]').val(getDateToday(true));">Insert invalid date</a> ]
      </div>
    </div>
  </xsl:template>
  
  <xsl:template name="url-input">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:param name="required" select="false()"/>
    <xsl:param name="label"/>
    <div class="cty-input-row">
      <xsl:call-template name="form-input-types.label">
        <xsl:with-param name="label" select="$label"/>
        <xsl:with-param name="required" select="$required"/>
      </xsl:call-template>
      <input type="text" name="{$name}" value="{$value}"/>
      <xsl:call-template name="form-input-types.disable-enable-button"/>
      <div style="float:left;margin-left:3px">
        [ <a href="javascript:;" onclick="$(this).parent().parent().find('input[type=text]').val(getRandomUrl(false));">Insert valid URL</a> ]
      </div>
      <div style="float:left;margin-left:3px">
        [ <a href="javascript:;" onclick="$(this).parent().parent().find('input[type=text]').val(getRandomUrl(true));">Insert invalid URL</a> ]
      </div>
    </div>
  </xsl:template>

  <xsl:template name="uploadfile-input">
    <xsl:param name="name"/>
    <xsl:param name="content-key"/>
    <xsl:param name="binary-key"/>
    <xsl:param name="required" select="false()"/>
    <xsl:param name="label"/>
    
    <div class="cty-input-row">
      <xsl:call-template name="form-input-types.label">
        <xsl:with-param name="label" select="$label"/>
        <xsl:with-param name="required" select="$required"/>
      </xsl:call-template>
      <xsl:if test="$binary-key">
        <div style="float:left;margin-left:3px">
          <xsl:variable name="attachment-url" select="portal:createBinaryUrl($binary-key)"/>
          [ <a href="{$attachment-url}" title="{$attachment-url}">Download file</a> ]
        </div>
        <input type="text" name="{$name}" value="{$binary-key}"/>
      </xsl:if>
      
      <input type="file" name="{concat($name, '_new')}"/>
      <xsl:call-template name="form-input-types.disable-enable-button"/>
      
    </div>
  </xsl:template>

  <xsl:template name="textarea-input">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:param name="required" select="false()"/>
    <xsl:param name="label"/>
    <div class="cty-input-row">
      <xsl:call-template name="form-input-types.label">
        <xsl:with-param name="label" select="$label"/>
        <xsl:with-param name="required" select="$required"/>
      </xsl:call-template>
      <textarea rows="3" cols="60" name="{$name}">
        <xsl:value-of select="$value"/>
      </textarea>
      <xsl:call-template name="form-input-types.disable-enable-button"/>
    </div>
  </xsl:template>

  <xsl:template name="xml-input">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:param name="required" select="false()"/>
    <xsl:param name="label"/>
    <div class="cty-input-row">
      <xsl:call-template name="form-input-types.label">
        <xsl:with-param name="label" select="$label"/>
        <xsl:with-param name="required" select="$required"/>
      </xsl:call-template>
      <xsl:element name="textarea" namespace="">
        <xsl:attribute name="name" select="$name"/>
        <xsl:attribute name="rows" select="6"/>
        <xsl:attribute name="cols" select="60"/>
        <xsl:copy-of select="$value/node()"/>
      </xsl:element>
      <xsl:call-template name="form-input-types.disable-enable-button"/>
    </div>
  </xsl:template>

  <xsl:template name="htmlarea-input">
    <xsl:param name="name"/>
    <xsl:param name="id"/>
    <xsl:param name="value"/>
    <xsl:param name="required" select="false()"/>
    <xsl:param name="label"/>
    <div class="cty-input-row">
      <xsl:call-template name="form-input-types.label">
        <xsl:with-param name="label" select="$label"/>
        <xsl:with-param name="required" select="$required"/>
      </xsl:call-template>
      <xsl:element name="textarea" namespace="">
        <xsl:if test="$id != ''">
          <xsl:attribute name="id">
            <xsl:value-of select="$id"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:attribute name="name" select="$name"/>
        <xsl:copy-of select="$value/node()"/>
      </xsl:element>
      <xsl:call-template name="form-input-types.disable-enable-button"/>
    </div>
  </xsl:template>

  <xsl:template name="checkbox-input">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:param name="required" select="false()"/>
    <xsl:param name="label"/>
    <xsl:param name="mode"/>
    <div class="cty-input-row">
      <xsl:call-template name="form-input-types.label">
        <xsl:with-param name="label" select="$label"/>
        <xsl:with-param name="required" select="$required"/>
      </xsl:call-template>
      <input type="checkbox" name="{$name}">
        <xsl:if test="$value = 'true'">
          <xsl:attribute name="checked">true</xsl:attribute>
        </xsl:if>
      </input>
      <xsl:call-template name="form-input-types.disable-enable-button"/>
      <xsl:if test="$mode = 'modify'">
        <input type="hidden" name="_included_checkbox" value="{$name}" readonly="true"/><input type="button" class="button" onclick="toggleFormInput(this, '_included_checkbox: No', '_included_checkbox: Yes');" value="_included_checkbox: Yes"/>
      </xsl:if>
    </div>
  </xsl:template>

  <xsl:template name="radiobutton-input">
    <xsl:param name="name"/>
    <xsl:param name="options"/> <!-- Format: 'name:value, name:value, name:value' -->
    <xsl:param name="value"/>
    <xsl:param name="required" select="false()"/>
    <xsl:param name="label"/>
    <div class="cty-input-row">
      <xsl:if test="$label != ''">
        <xsl:call-template name="form-input-types.label">
          <xsl:with-param name="label" select="$label"/>
          <xsl:with-param name="required" select="$required"/>
        </xsl:call-template>
      </xsl:if>
      <xsl:variable name="options-tokenized" select="tokenize($options, ',')"/>
      <div style="float:left; padding:4px 0">
        <xsl:for-each select="$options-tokenized">
          <div>
            <xsl:variable name="option-tokenized" select="tokenize(., ':')"/>
            <xsl:variable name="option-name" select="normalize-space($option-tokenized[1])"/>
            <xsl:variable name="option-value" select="normalize-space($option-tokenized[2])"/>
            <input type="radio" name="{$name}" value="{$option-value}">
              <xsl:if test="$option-value = $value">
                <xsl:attribute name="checked">true</xsl:attribute>
              </xsl:if>
            </input>
            <xsl:value-of select="$option-name"/>
          </div>
        </xsl:for-each>
      </div>
      <xsl:call-template name="form-input-types.disable-enable-button"/>
    </div>
  </xsl:template>
  
  <xsl:template name="dropdown-input">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:param name="helper-content"/>
    <xsl:param name="required" select="false()"/>
    <xsl:param name="label"/>
    <div class="cty-input-row">
      <xsl:call-template name="form-input-types.label">
        <xsl:with-param name="label" select="$label"/>
        <xsl:with-param name="required" select="$required"/>
      </xsl:call-template>
      <select name="{$name}">
        <option value="">-- Select --</option>
        <xsl:for-each select="$helper-content">
          <option value="{@key}">
            <xsl:if test="@key = $value">
              <xsl:attribute name="selected">true</xsl:attribute>
            </xsl:if>
            <xsl:value-of select="title"/>
          </option>
        </xsl:for-each>
      </select>
      <xsl:call-template name="form-input-types.disable-enable-button"/>
    </div>
  </xsl:template>

  <xsl:template name="related-content-input">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:param name="helper-content"/>
    <xsl:param name="required" select="false()"/>
    <xsl:param name="label"/>
    <div class="cty-input-row">
      <xsl:call-template name="form-input-types.label">
        <xsl:with-param name="label" select="$label"/>
        <xsl:with-param name="required" select="$required"/>
      </xsl:call-template>
      <input type="text" name="{$name}" value="{$value}"/>
      <xsl:call-template name="form-input-types.disable-enable-button"/>

      <xsl:if test="count($helper-content) &gt; 0">
        <div style="float: left; margin-left: 10px">
          <xsl:for-each select="$helper-content">
            <a href="javascript:;" onclick="addRelatedContentKeyToTextField('{@key}', this)" title="{concat('Content: ', title)}">
              <xsl:value-of select="@key"/>
            </a>
            <xsl:if test="position() != last()">
              <xsl:text>,</xsl:text>
            </xsl:if>
          </xsl:for-each>
        </div>
      </xsl:if>
    </div>
  </xsl:template>

  <xsl:template name="image-input">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:param name="helper-content"/>
    <xsl:param name="required" select="false()"/>
    <xsl:param name="label"/>
    <div class="cty-input-row">
      <xsl:call-template name="form-input-types.label">
        <xsl:with-param name="label" select="$label"/>
        <xsl:with-param name="required" select="$required"/>
      </xsl:call-template>
      <input type="text" name="{$name}" value="{$value}"/>
      <xsl:call-template name="form-input-types.disable-enable-button"/>

      <xsl:if test="count($helper-content) &gt; 0">
        <div style="float: left; margin-left: 10px">
          <xsl:for-each select="$helper-content">
            <a href="javascript:;" onclick="addRelatedContentKeyToTextField('{@key}', this)" title="{concat('Image content: ', title)}">
              <xsl:value-of select="@key"/>
            </a>
            <xsl:if test="position() != last()">
              <xsl:text>,</xsl:text>
            </xsl:if>
          </xsl:for-each>
        </div>
      </xsl:if>
    </div>
  </xsl:template>

  <xsl:template name="images-input">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:param name="helper-content"/>
    <xsl:param name="required" select="false()"/>
    <xsl:param name="label"/>
    <div class="cty-input-row">
      <xsl:call-template name="form-input-types.label">
        <xsl:with-param name="label" select="$label"/>
        <xsl:with-param name="required" select="$required"/>
      </xsl:call-template>
      <input type="text" name="{$name}" value="{$value}"/>
      <xsl:call-template name="form-input-types.disable-enable-button"/>

      <xsl:if test="count($helper-content) &gt; 0">
        <div style="float: left; margin-left: 10px">
          <xsl:for-each select="$helper-content">
            <a href="javascript:;" onclick="addRelatedContentKeyToTextField('{@key}', this)" title="{concat('Image content: ', title)}">
              <xsl:value-of select="@key"/>
            </a>
            <xsl:if test="position() != last()">
              <xsl:text>,</xsl:text>
            </xsl:if>
          </xsl:for-each>
        </div>
      </xsl:if>
    </div>
  </xsl:template>

  <xsl:template name="file-input">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:param name="helper-content"/>
    <xsl:param name="required" select="false()"/>
    <xsl:param name="label"/>
    <div class="cty-input-row">
      <xsl:call-template name="form-input-types.label">
        <xsl:with-param name="label" select="$label"/>
        <xsl:with-param name="required" select="$required"/>
      </xsl:call-template>
      <input type="text" name="{$name}" value="{$value}"/>
      <xsl:call-template name="form-input-types.disable-enable-button"/>

      <xsl:if test="count($helper-content) &gt; 0">
        <div style="float: left; margin-left: 10px">
          <xsl:for-each select="$helper-content">
            <a href="javascript:;" onclick="addRelatedContentKeyToTextField('{@key}', this)" title="{concat('File content: ', title)}">
              <xsl:value-of select="@key"/>
            </a>
            <xsl:if test="position() != last()">
              <xsl:text>,</xsl:text>
            </xsl:if>
          </xsl:for-each>
        </div>
      </xsl:if>
    </div>
  </xsl:template>

  <xsl:template name="files-input">
    <xsl:param name="name"/>
    <xsl:param name="value"/>
    <xsl:param name="helper-content"/>
    <xsl:param name="required" select="false()"/>
    <xsl:param name="label"/>
    <div class="cty-input-row">
      <xsl:call-template name="form-input-types.label">
        <xsl:with-param name="label" select="$label"/>
        <xsl:with-param name="required" select="$required"/>
      </xsl:call-template>
      <input type="text" name="{$name}" value="{$value}"/>
      <xsl:call-template name="form-input-types.disable-enable-button"/>

      <xsl:if test="count($helper-content) &gt; 0">
        <div style="float: left; margin-left: 10px">
          <xsl:for-each select="$helper-content">
            <a href="javascript:;" onclick="addRelatedContentKeyToTextField('{@key}', this)" title="{concat('File content: ', title)}">
              <xsl:value-of select="@key"/>
            </a>
            <xsl:if test="position() != last()">
              <xsl:text>,</xsl:text>
            </xsl:if>
          </xsl:for-each>
        </div>
      </xsl:if>
    </div>
  </xsl:template>

  <xsl:template name="form-input-types.label">
    <xsl:param name="label"/>
    <xsl:param name="required" select="false()"/>
    <label>
      <xsl:value-of select="$label"/>
      <xsl:if test="$required">
        <span class="required">*</span>
      </xsl:if>
    </label>
  </xsl:template>

  <xsl:template name="form-input-types.disable-enable-button">
    <div style="float:left; margin-left: 3px;">[ <a href="javascript:;" onclick="disableEnableInputElement($(this).parent().parent(), $(this))">Disable</a> ]</div>
  </xsl:template>
</xsl:stylesheet>