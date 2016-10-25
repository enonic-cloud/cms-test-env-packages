<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp '&#x00A0;'>
    ]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>

  <xsl:template match="/">

    <h1>
      <xsl:value-of select="/result/contents/content/contentdata/form/title"/>
    </h1>

    <table border="1" cellpadding="2" cellspacing="0">
      <tr>
        <th>Date</th>
        <th>Owner</th>
        <xsl:for-each select="/result/contents/content[1]/contentdata/form/item[@type != 'separator']">
          <th>
            <xsl:value-of select="@label"/>
          </th>
        </xsl:for-each>
        <!--xsl:for-each select="/result/contents/content[1]/contentdata/form/item[@type != 'separator']">
          <th>
            <xsl:value-of select="@label"/>
          </th>
        </xsl:for-each-->
      </tr>
      <xsl:apply-templates select="/result/contents/content"/>
    </table>
  </xsl:template>

  <xsl:template match="content">
    <tr>
      <td valign="top">
        <xsl:value-of select="@created"/>
      </td>
      <td valign="top">
        <xsl:value-of select="owner/display-name"/>
      </td>
      <xsl:apply-templates select="contentdata/form/item[@type != 'separator']"/>
    </tr>
  </xsl:template>

  <xsl:template match="item">



      <td valign="top">
        <xsl:choose>
          <xsl:when test="data != '' or data/option[@selected = 'true']/@value">

            <xsl:choose>

              <xsl:when test="@type = 'radiobuttons' or @type = 'dropdown'">
                <xsl:choose>
                  <xsl:when test="data/option[@selected = 'true']/@value != ''">
                    <xsl:value-of select="data/option[@selected = 'true']/@value"/> 
                  </xsl:when>
                  <xsl:otherwise>
                    <br/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>

              <xsl:when test="@type = 'checkbox'">
                <xsl:choose>
                  <xsl:when test="data = 0">False</xsl:when>
                  <xsl:otherwise>True</xsl:otherwise>
                </xsl:choose>
              </xsl:when>

              <xsl:when test="@type = 'checkboxes'">

                <xsl:choose>

                  <xsl:when test="data/option[@selected = 'true']/@value != ''">
                    <xsl:for-each select="data/option[@selected = 'true']">
                      <xsl:value-of select="@value"/>
                      <xsl:choose>
                        <xsl:when test="position() != last()">
                          <xsl:text>, </xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:for-each>
                  </xsl:when>

                  <xsl:otherwise>
                    <br/>
                  </xsl:otherwise>

                </xsl:choose>
              </xsl:when>

              <xsl:otherwise>
                <xsl:value-of select="data"/> 
              </xsl:otherwise>

            </xsl:choose>

          </xsl:when>

          <xsl:otherwise>
            <br/>
          </xsl:otherwise>

        </xsl:choose>
      </td>


  </xsl:template>

</xsl:stylesheet>