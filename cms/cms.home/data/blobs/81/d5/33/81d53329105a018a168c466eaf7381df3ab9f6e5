<?xml version="1.0"?>
<xsl:stylesheet exclude-result-prefixes="saxon xs portal" version="2.0"
                xmlns:portal="http://www.enonic.com/cms/xslt/portal"
                xmlns:saxon="http://saxon.sf.net" xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="borderStart">
    <xsl:param name="headerText"/>
    <xsl:param name="showPreferenceButton" select="false()"/>

    <xsl:text disable-output-escaping="yes">
      &lt;div class="frame"&gt;
    </xsl:text>
    <xsl:if test="$headerText !=''">
      <h4 style="position:relative">
        <xsl:value-of select="$headerText"/>
        <xsl:if test="$showPreferenceButton = true()">
          <div style="position:absolute;top:0;right:0">
            <a href="javascript:;" onclick="cms.pkg.preferences.togglePanel('{portal:getInstanceKey()}');">
              <img src="{portal:createResourceUrl('/_public/packages/site/images/cog_edit.png')}" alt="Set Preferences" title="Set Preferences"/>
            </a>
          </div>
        </xsl:if>
      </h4>
    </xsl:if>
    <xsl:text disable-output-escaping="yes">
        &lt;div class="box" style="clear:both"&gt;
    </xsl:text>
  </xsl:template>
  
  <xsl:template name="borderEnd">
    <xsl:text disable-output-escaping="yes">
        &lt;/div&gt;
      &lt;/div&gt;
    </xsl:text>
  </xsl:template>
</xsl:stylesheet>

