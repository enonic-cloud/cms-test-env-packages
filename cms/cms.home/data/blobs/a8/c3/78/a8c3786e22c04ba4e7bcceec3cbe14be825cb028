<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0"
      xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal"
      xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>

      <xsl:variable name="days">
            <xsl:choose>
                  <xsl:when test="/result/preferences/preference[@basekey = 'weatherForecast.days'] != ''">
                        <xsl:value-of select="/result/preferences/preference[@basekey = 'weatherForecast.days']"/>
                  </xsl:when>
                  <xsl:otherwise>
                        <xsl:text>5</xsl:text>
                  </xsl:otherwise>
            </xsl:choose>
      </xsl:variable>

      <xsl:template match="/">
            <link href="{portal:createResourceUrl('/_public/features/features.css')}" media="screen"
                  rel="stylesheet" type="text/css"/>

            <script type="text/javascript">
            function setHiddenVarAndSubmit() {
                var key = document.getElementById("preferenceKey");
                var value = document.getElementById("preferenceValue");
                
                var preference = document.getElementById("preference");
                
                preference.name = key.value;
                preference.value = value.value;
                
                var form = document.getElementById("formSet");
                
                key.disabled = true;
                value.disabled = true;
                
                form.submit();
            }</script>


            <xsl:variable name="redirectKey"
                  select="/result/context/querystring/parameter[@name='id']"/>
            <xsl:variable name="redirect" select="portal:createPageUrl($redirectKey, ())"/>


            <p>
                  <xsl:if
                        test="/result/context/querystring/parameter[@name = 'error_user_setpreferences']">

                        <xsl:variable name="errorCode"
                              select="/result/context/querystring/parameter[@name = 'error_user_setpreferences']"/>

                        <p class="formError"> An error occured: <xsl:value-of select="$errorCode"/>
                              <xsl:text> - </xsl:text>
                              <xsl:choose>
                                    <xsl:when test="$errorCode='112'">Invalid preference params </xsl:when>
                                    <xsl:when test="$errorCode='113'">Not allowed to set preference
                                          for user</xsl:when>
                              </xsl:choose>
                        </p>

                  </xsl:if>
                  <form action="{portal:createServicesUrl('user','setpreferences', $redirect, ())}"
                        id="formSet" method="post" enctype="multipart/form-data">
                        <fieldset>
                              <legend>Set preference</legend>
                              <input type="hidden" value="" name="" id="preference"/>

                              <label for="preferenceKey">Key</label>
                              <input type="text" name="preferenceKey" id="preferenceKey"/>

                              <label for="preferenceValue">Value</label>
                              <input type="text" name="preferenceValue" id="preferenceValue"/>

                              <p class="clear">
                                    <input type="button" value="Set preference"
                                          onclick="javascript:setHiddenVarAndSubmit();"/>
                              </p>
                        </fieldset>
                  </form>
            </p>



            <p>
                  <xsl:if
                        test="/result/context/querystring/parameter[@name = 'error_user_deletepreferences']">

                        <xsl:variable name="errorCode"
                              select="/result/context/querystring/parameter[@name = 'error_user_deletepreferences']"/>

                        <p class="formError"> An error occured: <xsl:value-of select="$errorCode"/>
                              <xsl:text> - </xsl:text>
                              <xsl:choose>
                                    <xsl:when test="$errorCode='112'">Invalid preference params </xsl:when>
                                    <xsl:when test="$errorCode='113'">Not allowed to delete
                                          preference for user </xsl:when>
                              </xsl:choose>
                        </p>

                  </xsl:if>

                  <form
                        action="{portal:createServicesUrl('user','deletepreferences', $redirect, ())}"
                        id="formDelete" method="post" enctype="multipart/form-data">
                        <fieldset>
                              <legend>Delete preference</legend>
                              <label for="preferenceKey">Preference key to delete</label>
                              <input type="text" name="preferenceKey"/>
                              <p class="clear">
                                    <input type="submit" value="Delete preference"/>
                              </p>
                        </fieldset>
                  </form>
            </p>

            <p>
                  <xsl:variable name="scope"
                        select="/result/context/querystring/parameter[@name='scope']"/>
                  <xsl:variable name="wildcardKey"
                        select="/result/context/querystring/parameter[@name='wildCardkey']"/>

                  <xsl:variable name="uniqueMatch">
                        <xsl:choose>
                              <xsl:when
                                    test="/result/context/querystring/parameter[@name='uniqueMatch']">
                                    <xsl:value-of
                                          select="/result/context/querystring/parameter[@name='uniqueMatch']"
                                    />
                              </xsl:when>
                              <xsl:otherwise>true</xsl:otherwise>
                        </xsl:choose>
                  </xsl:variable>




                  <form action="./Preferences" id="formGet" method="GET">
                        <fieldset>
                              <legend>Get preferences</legend>

                              <label for="scope">Scope</label>
                              <input id="scope" type="text" name="scope" value="{$scope}"/>

                              <label for="wildcardkey">WildcardKey</label>
                              <input id="wildcardkey" type="text" name="wildCardkey"
                                    value="{$wildcardKey}"/>

                              <label for="uniqueMatch">uniqueMatch</label>
                              <input id="uniqueMatch" type="text" name="uniqueMatch"
                                    value="{$uniqueMatch}"/>

                              <p class="clear">
                                    <input type="submit" value="Get preferences"/>
                              </p>
                        </fieldset>
                  </form>
            </p>

            <xsl:apply-templates select="/result/preferences"/>

      </xsl:template>


      <xsl:template match="/result/preferences">

            <xsl:choose>
                  <xsl:when test="@message">
                        <p class="formError">
                              <xsl:value-of select="@message"/>
                        </p>
                  </xsl:when>
                  <xsl:otherwise>
                        <p>
                              <h3>List of preferences</h3> Count: <xsl:value-of select="@count"/>
                              <table class="httpservices">
                                    <tr> </tr>
                                    <tr>
                                          <th>Scope</th>
                                          <th>Key</th>
                                          <th>Basekey</th>
                                          <th>Value</th>
                                    </tr>

                                    <xsl:for-each select="preference">
                                          <tr>
                                                <td>
                                                  <xsl:value-of select="@scope"/>
                                                </td>
                                                <td>
                                                  <xsl:value-of select="@key"/>
                                                </td>
                                                <td>
                                                  <xsl:value-of select="@basekey"/>
                                                </td>
                                                <td>
                                                  <xsl:value-of select="."/>
                                                </td>
                                          </tr>
                                    </xsl:for-each>
                              </table>
                        </p>

                  </xsl:otherwise>
            </xsl:choose>


            <xsl:call-template name="weatherForecast"/>

      </xsl:template>


      <xsl:template name="weatherForecast">
            <xsl:variable name="selectedCity"
                  select="/result/preferences/preference[@basekey = 'weatherForecast.city']"/>
            <xsl:choose>
                  <xsl:when test="count(/result/weatherdata/forecast/tabular/time[@period = 2]) !=0">
                        <div>
                              <xsl:apply-templates
                                    select="/result/weatherdata/forecast/tabular/time[@period = 2]"
                              />
                        </div>
                        <div style="clear:both">
                              <a href="http://www.yr.no">yr.no</a>
                        </div>
                  </xsl:when>
                  <xsl:otherwise> No items found </xsl:otherwise>
            </xsl:choose>

      </xsl:template>

      <xsl:template match="time">
            <xsl:if test="position() &lt;= $days">

                  <div>
                        <xsl:variable name="from" select="substring-after(@from, 'T')"/>
                        <xsl:variable name="to" select="substring-after(@to, 'T')"/>
                        <xsl:variable name="period">
                              <xsl:choose>
                                    <xsl:when test="@period  = 0">
                                          <xsl:text>night</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="@period  = 1">
                                          <xsl:text>morning</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="@period  = 2">
                                          <xsl:text>day</xsl:text>
                                    </xsl:when>
                                    <xsl:when test="@period  = 3">
                                          <xsl:text>evening</xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise> </xsl:otherwise>
                              </xsl:choose>
                        </xsl:variable>

                        <xsl:variable name="date" select="xs:date(substring(@from, 1, 10))"
                              as="xs:date"/>
                        <xsl:variable name="day-of-week"
                              select="format-date($date, '[F1]', 'en', (), () )"/>

                        <strong>
                              <xsl:call-template name="formatDayOfWeek">
                                    <xsl:with-param name="day-of-week" select="number($day-of-week)"
                                    />
                              </xsl:call-template>
                              <xsl:text> kl </xsl:text>
                              <xsl:value-of select="substring($from, 1, 2)"/>
                              <xsl:text> - </xsl:text>
                              <xsl:text> kl </xsl:text>
                              <xsl:value-of select="substring($to, 1, 2)"/>
                        </strong>
                        <br/>
                        <p>
                              <xsl:value-of select="symbol/@name"/>.<xsl:value-of
                                    select="windSpeed/@name"/>, <xsl:value-of
                                    select="windSpeed/@mps"/> m/s fra<xsl:value-of
                                    select="windDirection/@name"/>. <xsl:value-of
                                    select="concat(precipitation/@value, ' mm precipitation.')"/>
                        </p>
                        <p style="float: left; margin: 0">
                              <xsl:variable name="icon">
                                    <xsl:choose>
                                          <xsl:when test="symbol/@number &lt; 10">
                                                <xsl:value-of select="concat('0', symbol/@number)"/>
                                          </xsl:when>
                                          <xsl:when test="symbol/@number &lt;= 3">
                                                <xsl:value-of select="concat('0', symbol/@number)"/>
                                          </xsl:when>
                                          <xsl:otherwise>
                                                <xsl:value-of select="symbol/@number"/>
                                          </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:if test="symbol/@number &lt; 9 and symbol/@number != 4">
                                          <xsl:choose>
                                                <xsl:when test="@period = 0">
                                                  <xsl:text>n</xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:text>d</xsl:text>
                                                </xsl:otherwise>
                                          </xsl:choose>
                                    </xsl:if>
                              </xsl:variable>
                              <img
                                    src="http://www12.nrk.no/nyheter/ver/symbol/Versymbol_100px/{$icon}.png"
                                    alt="{symbol/@name}" width="50" height="50"/>
                        </p>
                        <p
                              style="font-size: 2.2em; color: red; float: left; padding-top: 12px; font-weight: bold; margin: 0 0 0 12px">
                              <xsl:variable name="temprature">
                                    <xsl:value-of select="temperature/@value"/>
                              </xsl:variable>
                              <xsl:value-of select="concat($temprature, '°', 'C')"/>
                        </p>
                  </div>
            </xsl:if>
      </xsl:template>


      <xsl:template name="formatDayOfWeek">
            <xsl:param name="day-of-week"/>
            <xsl:choose>
                  <xsl:when test="$day-of-week = 1">Monday</xsl:when>
                  <xsl:when test="$day-of-week = 2">Tuesday</xsl:when>
                  <xsl:when test="$day-of-week = 3">Wedensday</xsl:when>
                  <xsl:when test="$day-of-week = 4">Thursday</xsl:when>
                  <xsl:when test="$day-of-week = 5">Friday</xsl:when>
                  <xsl:when test="$day-of-week = 6">Saturday</xsl:when>
                  <xsl:when test="$day-of-week = 7">Sunday</xsl:when>
            </xsl:choose>
      </xsl:template>





</xsl:stylesheet>
