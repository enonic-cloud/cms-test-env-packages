<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="portal" version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output indent="no" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>

  <xsl:template match="/">
    <xsl:choose>
      <xsl:when test="/result/categories/contents/content">
        <div id="forum">
          <table>
            <thead>
              <tr>
                <th class="icons">
                  <xsl:comment>//</xsl:comment>
                </th>
                <th>
                  <xsl:value-of select="portal:localize('Categories')"/>
                </th>
                <!--th>
                  <xsl:value-of select="portal:localize('Topics')"/>
                </th-->
                <th class="postings">
                  <xsl:value-of select="portal:localize('Postings')"/>
                </th>
                <!--th>
                  <xsl:value-of select="portal:localize('Latest-posting')"/>
                </th-->
              </tr>
            </thead>
            <tbody>
              <xsl:apply-templates select="/result/categories/contents/content"/>
            </tbody>
          </table>
        </div>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="portal:localize('forum-no-categories')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="content">
    <xsl:variable name="href" select="portal:createPageUrl(('categoryKey', @key))"/>
    <tr>
      <xsl:if test="position() mod 2 = 0">
        <xsl:attribute name="class">highlight</xsl:attribute>
      </xsl:if>
      <td>
        <a href="{$href}">
          <img class="icon" alt="{concat(portal:localize('Folder'), ' ', portal:localize('icon'))}" src="{portal:createResourceUrl('/_public/packages/commons/images/icon_folder.png')}"/>
        </a>
      </td>
      <td>
        <a href="{$href}">
          <h2>
            <xsl:value-of select="title"/>
          </h2>
        </a>
        <p>
          <xsl:value-of select="contentdata/description"/>
        </p>
      </td>
      <!--td>
        ant tråder<br/>
        <xsl:value-of select="relatedcontentkeys/count"/>
      </td-->
      <td class="postings">
        <xsl:value-of select="relatedcontentkeys/@count"/>
      </td>
      <!--td>
        siste innlegg
      </td-->
    </tr>
  </xsl:template>

</xsl:stylesheet>
