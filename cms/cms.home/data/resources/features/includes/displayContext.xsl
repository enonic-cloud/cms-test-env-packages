<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0"
                xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal"
                xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:variable name="id">
    <xsl:text>t</xsl:text>
    <xsl:choose>
      <xsl:when test="/result/context/window/@key">
        <xsl:value-of select="replace(/result/context/window/@key, ':', '-')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="/result/context/resource/@key"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:template name="displayContext">
    <script type="text/javascript">
      <xsl:comment>

        $(function() {

        $('#<xsl:value-of select="$id"/>').each(function() {
        $(this).find('ul').each(function() {
        $(this).children('li').not('li:first').hide();
        $(this).children('li:first:not(:only-child)').append(' &lt;a href=&quot;javascript:void(0);&quot; class=&quot;more&quot;&gt;more&lt;/a&gt;');
        });
        });

        $('#<xsl:value-of select="$id"/>').find('.more').click(function () {
        $(this).parent().nextAll().slideToggle('fast');
        if ($(this).text() == 'more') {
        $(this).text('less');
        }
        else
        {
        $(this).text('more');
        }
        });
        });

        //
      </xsl:comment>
    </script>
    <style>
      td, th {
      vertical-align: top;
      }

      th {
      width: 1px;
      }

      ul.display-context-ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
      }
    </style>
    <xsl:variable name="context" select="//context[1]"/>
    <fieldset class="clear">
      <legend>Context</legend>
      
      <table id="{$id}">
        <tr>
          <th nowrap="nowrap">Language code:</th>
          <td>
            <xsl:value-of select="$context/@languagecode"/>
          </td>
        </tr>
        <tr>
          <th>Locale:</th>
          <td>
            <xsl:value-of select="$context/locale"/>
          </td>
        </tr>
        <tr>
          <th>Site:</th>
          <td>
            <ul class="display-context-ul">
              <li class="main">@key:
                <xsl:value-of select="$context/site/@key"/>
              </li>
              <li>virtualhost:
                <xsl:value-of select="$context/site/virtualhost"/>
              </li>
              <li>contextpath:
                <xsl:value-of select="$context/site/contextpath"/>
              </li>
            </ul>
          </td>
        </tr>
        <tr>
          <th>Resource:</th>
          <td>
            <ul class="display-context-ul">
              <li class="main">@key:
                <xsl:value-of select="$context/resource/@key"/>
              </li>
              <li class="main">@type:
                <xsl:value-of select="$context/resource/@type"/>
              </li>
              <li>name:
                <xsl:value-of select="$context/resource/name"/>
              </li>
              <li>alternative-name:
                <xsl:value-of select="$context/resource/alternative-name"/>
              </li>
              <li>display-name:
                <xsl:value-of select="$context/resource/display-name"/>
              </li>
              <li>show-in-menu:
                <xsl:value-of select="$context/resource/show-in-menu"/>
              </li>
              <li>keywords:
                <xsl:value-of select="$context/resource/keywords"/>
              </li>
              <li>description:
                <xsl:value-of select="$context/resource/description"/>
              </li>
              <li>type:
                <xsl:value-of select="$context/resource/type"/>
              </li>
              <li>document:
                <xsl:value-of select="$context/resource/document"/>
              </li>
            </ul>
          </td>
        </tr>
        <xsl:if test="boolean($context/page)">
          <tr>
            <th>Page:</th>
            <td>
              <ul class="display-context-ul">
                <li>
                  Page Template:
                  <ul class="display-context-ul">
                    <li>name:
                      <xsl:value-of select="$context/page/page-template/name"/>
                    </li>
                  </ul>
                </li>
                <li>
                  Parameters:
                  <ul class="display-context-ul">
                    <xsl:for-each select="$context/page/parameters/parameter">
                      <li>
                        <xsl:value-of select="name"/> (override: <xsl:value-of select="overrideable"/>) = <xsl:value-of select="value"/>
                      </li>
                    </xsl:for-each>
                  </ul>
                </li>
                <li>
                  Regions:
                  <ul>
                    <xsl:for-each select="$context/page/regions/region">
                      <li>
                        <xsl:value-of select="name"/>:
                        <br/>
                        Windows in region:
                        <ul>
                          <xsl:for-each select="windows/window">
                            <li>key = <xsl:value-of select="@key"/>, name =
                              <xsl:value-of select="name"/>
                            </li>
                          </xsl:for-each>
                        </ul>
                      </li>
                    </xsl:for-each>
                  </ul>
                </li>
              </ul>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="$context/window/@key">
          <tr>
            <th>Window:</th>
            <td>
              <ul class="display-context-ul">
                <li>key:
                  <xsl:value-of select="$context/window/@key"/>
                </li>
                <li>name:
                  <xsl:value-of select="$context/window/name"/>
                </li>
                <li>is-rendered-inline:
                  <xsl:value-of select="$context/window/@is-rendered-inline"/>
                </li>
                 <li>region:
                    <xsl:value-of select="$context/window/@region"/>
                 </li>
                <li>Portlet:
                  <ul class="display-context-ul">
                    <li>key:
                      <xsl:value-of select="$context/window/portlet/@key"/>
                    </li>
                    <li>name:
                      <xsl:value-of select="$context/window/portlet/name"/>
                    </li>
                    <li>document:
                      <xsl:value-of select="$context/window/portlet/document"/>
                    </li>
                  </ul>
                </li>
              </ul>
            </td>
          </tr>
        </xsl:if>
        <tr>
          <th>Device class:</th>
          <td>
            <xsl:value-of select="$context/device-class"/>
          </td>
        </tr>
        <tr>
          <th>Profile:</th>
          <td>
            <xsl:value-of select="$context/profile"/>
          </td>
        </tr>
        <tr>
          <th>Querystring:</th>
          <td>
            <ul class="display-context-ul">
              <xsl:for-each select="$context/querystring/parameter">
                <li>
                  <xsl:value-of select="@name"/> =
                  <xsl:value-of select="."/>
                </li>
              </xsl:for-each>
            </ul>
          </td>
        </tr>
        <tr>
          <th>User:</th>
          <td>
            <ul class="display-context-ul">
              <li>name:
                <xsl:value-of select="$context/user/name"/>
              </li>
              <li>qualified-name:
                <xsl:value-of select="$context/user/@qualified-name"/>
              </li>
              <li>display-name:
                <xsl:value-of select="$context/user/display-name"/>
              </li>
              <li>key:
                <xsl:value-of select="$context/user/@key"/>
              </li>
              <li>built-in:
                <xsl:value-of
                    select="$context/user/@built-in"/>
              </li>
              <li>Groups:
                <ul class="display-context-ul">
                  <xsl:for-each select="$context/user/memberships/group">
                    <li>name:
                      <xsl:value-of select="@name"/>
                    </li>
                  </xsl:for-each>
                </ul>
              </li>
            </ul>
          </td>
        </tr>
        <tr>
          <th>HTTP:</th>
          <td>
            <ul class="display-context-ul">
              <li>action (method):
                <xsl:value-of select="$context/http/@action"/>
              </li>
              <li>user-agent:
                <xsl:value-of select="$context/http/user-agent"/>
              </li>
              <li>client-ip:
                <xsl:value-of select="$context/http/client-ip"/>
              </li>
              <li>referer:
                <xsl:value-of select="$context/http/referer"/>
              </li>
              <li>accept:
                <ul class="display-context-ul">
                  <xsl:for-each select="$context/http/accept/language">
                    <li>
                      <xsl:value-of select="."/> (q=<xsl:value-of select="@q"/>)
                    </li>
                  </xsl:for-each>
                </ul>
              </li>
            </ul>
          </td>
        </tr>
        <tr>
          <th>Cookies:</th>
          <td>
            <ul class="display-context-ul">
              <xsl:for-each select="$context/cookies/cookie">
                <li><xsl:value-of select="@name"/>:
                  <xsl:value-of select="."/>
                </li>
              </xsl:for-each>
            </ul>
          </td>
        </tr>

      </table>
    </fieldset>

  </xsl:template>


</xsl:stylesheet>
