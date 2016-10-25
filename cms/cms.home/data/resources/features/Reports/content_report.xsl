<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp '&#160;'>
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:param name="_lang">no</xsl:param>

  <xsl:output method="html"/>


  	<xsl:template match="/">
		<style>
			td { font: 10px Verdana, Arial, Helvetica, sans-serif; color:  #000000;} 
		</style>


		<table border="0" width="100%">
		<tr>
			<td>
			     <b>Tittel</b>
			</td>
			<td>
			     <b>Kategori</b>
			</td>
			<td>
			     <b>Eier</b>
			</td>
			<td>
			     <b>Sist oppdatert</b>
			</td>
			<td>
			     <b>Oppdatert av</b>
			</td>
  		</tr>
		<xsl:apply-templates select="/result/contents/content">
			<xsl:sort order="descending" select="@publishfrom"/>
		</xsl:apply-templates>
		</table>

	</xsl:template>

	<xsl:template match="/result/contents/content">
		<tr>
			<td>
			     <xsl:value-of select="title"/>
			</td>
			<td nowrap="nowrap">
			     <xsl:value-of select="categoryname"/>
			</td>
			<td nowrap="nowrap">
			     <xsl:value-of select="owner/display-name"/>
			</td>
			<td nowrap="nowrap">
				<xsl:call-template name="formatdate">
			     		<xsl:with-param name="date" select="@timestamp"/>
				</xsl:call-template>
			</td>
			<td nowrap="nowrap">
			     <xsl:value-of select="modifier/display-name"/>
			</td>
  		</tr>
	</xsl:template>

	<!-- Standard date formatting template -->
	<xsl:template name="formatdate">
		<xsl:param name="date"/>

		<xsl:value-of select="substring($date, 6, 2)"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="substring($date, 9, 2)"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="substring($date, 1, 4)"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring($date, 12, 5)"/>

	</xsl:template>

</xsl:stylesheet>