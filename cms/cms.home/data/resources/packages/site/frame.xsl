<?xml version="1.0"?>
<xsl:stylesheet exclude-result-prefixes="saxon xs" version="2.0" xmlns:saxon="http://icl.com/saxon" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xsl:output indent="yes" method="xhtml" omit-xml-declaration="yes"/>
  <xsl:param name="header"/>
  	<xsl:param name="box" select="'true'"/>
    <xsl:param name="content">
        <type>content</type>
    </xsl:param>
    <xsl:template match="/">
		<div class="frame">
      <xsl:if test="$header !=''">
        <h4>
          <xsl:value-of select="$header"/>
        </h4>
      </xsl:if>
			<div>
				<xsl:if test="$box = 'true'">
					<xsl:attribute name="class">box</xsl:attribute>
				</xsl:if>
				<xsl:value-of disable-output-escaping="yes" select="$content"/>
			</div>
		</div>
    </xsl:template>
</xsl:stylesheet>