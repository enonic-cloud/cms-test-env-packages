<xsl:stylesheet
   exclude-result-prefixes="portal"
   version="2.0"
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:portal="http://www.enonic.com/cms/xslt/portal"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   
   <xsl:output
      indent="yes"
      media-type="text/html"
      method="xhtml"
      omit-xml-declaration="yes"/>
   
   <!-- 
   
   - foto-opplegg
   - teste
   
   -->
      
   <xsl:variable name="user" select="/result/context/user"/>
   <xsl:variable name="error" select="/result/context/querystring/parameter[contains(@name, 'error_')]"/>
   <xsl:variable name="success" select="/result/context/querystring/parameter[@name ='success']"/>
   <xsl:variable name="mode" select="/result/context/querystring/parameter[@name = 'mode']"/>
   <xsl:variable name="admin-name" select="'StaFly webmaster'"/>
   <xsl:variable name="admin-email" select="'webmaster@stafly.com'"/>
   <xsl:variable name="site-name" select="/result/context/site/name"/>
   <xsl:variable name="allGroupNames" select="'x-name,y-name,z-name'"/>
   <xsl:variable name="allGroupKeys" select="'x,y,z'"/>
   
   <xsl:template match="/">

      <div id="passport">
         <!-- Navigation -->
         <ul class="menu horizontal clearfix">
            <xsl:choose>
               <!-- User logged in -->
               <xsl:when test="$user">
                  <li>
                     <a href="{portal:createPageUrl()}" class="first {if (not($mode != '')) then ' active' else ''}">
                        <xsl:value-of select="portal:localize('Update-account')"/>
                     </a>
                  </li>
                  <li>
                     <a href="{portal:createPageUrl(portal:getPageKey(), ('mode', 'setgroups'))}">
                        <xsl:if test="$mode = 'setgroups'">
                           <xsl:attribute name="class">active</xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="portal:localize('Change-group-membership')"/>
                     </a>
                  </li>
                  <li>
                     <a href="{portal:createPageUrl(portal:getPageKey(), ('mode', 'changepwd'))}">
                        <xsl:if test="$mode = 'changepwd'">
                           <xsl:attribute name="class">active</xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="portal:localize('Change-password')"/>
                     </a>
                  </li>
                  <li>
                     <a href="{portal:createServicesUrl('user', 'logout', portal:createPageUrl(portal:getPageKey(), ()), ())}">
                        <xsl:value-of select="portal:localize('Logout')"/>
                     </a>
                  </li>
               </xsl:when>
               <!-- User not logged in -->
               <xsl:otherwise>
                  <li>
                     <a href="{portal:createPageUrl()}" class="first {if (not($mode != '')) then ' active' else ''}">
                        <xsl:value-of select="portal:localize('Login')"/>
                     </a>
                  </li>
                  <li>
                     <a href="{portal:createPageUrl(portal:getPageKey(), ('mode', 'resetpwd'))}">
                        <xsl:if test="$mode = 'resetpwd'">
                           <xsl:attribute name="class">active</xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="portal:localize('Forgotten-password')"/>
                     </a>
                  </li>
               </xsl:otherwise>
            </xsl:choose>
         </ul>
         <!-- User feedback -->
         <div>
            <xsl:choose>
               <xsl:when test="$error != ''">
                  <xsl:attribute name="class">error</xsl:attribute>
                  <xsl:value-of select="portal:localize(concat('user-error-', $error))"/>
               </xsl:when>
               <xsl:when test="$success != ''">
                  <xsl:attribute name="class">success</xsl:attribute>
                  <xsl:value-of select="portal:localize(concat('user-success-', $success))"/>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:attribute name="class">notice</xsl:attribute>
                  <xsl:choose>
                     <xsl:when test="$mode != ''">
                        <xsl:value-of select="portal:localize(concat('user-notice-', $mode))"/>
                     </xsl:when>
                     <xsl:when test="$user">
                        <xsl:value-of select="portal:localize(concat('user-notice-modify', $mode))"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="portal:localize(concat('user-notice-login', $mode))"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:otherwise>
            </xsl:choose>
         </div>
         <!-- Forms -->
         <xsl:choose>
            <!-- User logged in -->
            <xsl:when test="$user">
               <xsl:choose>
                  <!-- Update group membership -->
                  <xsl:when test="$mode = 'setgroups'">
                     <form action="{portal:createServicesUrl('user', 'setgroups', portal:createPageUrl(portal:getPageKey(), ('success', 'setgroups')), ())}" method="post">
                        <fieldset>
                           <legend>
                              <xsl:value-of select="portal:localize('Change-group-membership')"/>
                           </legend>
                           <input name="allgroupkeys" type="hidden" value="{$allGroupKeys}"/>
                           <xsl:for-each select="tokenize($allGroupKeys, ',')">
                              <xsl:variable name="pos" select="position()"/>
                              <label for="group{.}">
                                 <xsl:value-of select="tokenize($allGroupNames, ',')[$pos]"/>
                              </label>
                              <input name="joingroupkey" id="group{.}" type="checkbox" value="{.}">
                                 <xsl:if test="$user/memberships/group[@key = .]">
                                    <xsl:attribute name="checked">checked</xsl:attribute>
                                 </xsl:if>
                              </input>
                           </xsl:for-each>
                           <input type="submit" class="button" value="{portal:localize('Change')}"/>
                        </fieldset>
                     </form>
                  </xsl:when>
                  <!-- Change password -->
                  <xsl:when test="$mode = 'changepwd'">
                     <script type="text/javascript">
                        <xsl:comment>
                           $(function() {
                              $('#newpassword2').rules("add", {
                                 equalTo: '#newpassword1'
                              });
                           });
                        //</xsl:comment>
                     </script>
                     <form action="{portal:createServicesUrl('user', 'changepwd', portal:createPageUrl(portal:getPageKey(), ('success', 'changepwd')), ())}" method="post">
                        <fieldset>
                           <legend>
                              <xsl:value-of select="portal:localize('Change-password')"/>
                           </legend>
                           <label for="password">
                              <xsl:value-of select="portal:localize('Old-password')"/>
                           </label>
                           <input type="password" id="password" name="password" class="text required"/>
                           <label for="newpassword1">
                              <xsl:value-of select="portal:localize('New-password')"/>
                           </label>
                           <input type="password" id="newpassword1" name="newpassword1" class="text required"/>
                           <label for="newpassword2">
                              <xsl:value-of select="portal:localize('Repeat-new-password')"/>
                           </label>
                           <input type="password" id="newpassword2" name="newpassword2" class="text required"/>
                           <input type="submit" class="button" value="{portal:localize('Change')}"/>
                        </fieldset>
                     </form>
                  </xsl:when>
                  <!-- Update account -->
                  <xsl:otherwise>
                     <form action="{portal:createServicesUrl('user', 'modify', portal:createPageUrl(portal:getPageKey(), ('success', 'modify')), ())}" method="post">
                        <fieldset>
                           <legend>
                              <xsl:value-of select="portal:localize('Update-account')"/>
                           </legend>
                           <label for="first-name">
                              <xsl:value-of select="portal:localize('First-name')"/>
                           </label>
                           <input type="text" id="first-name" name="first-name" class="text required" value="{$user/first-name}"/>
                           <label for="middle-name">
                              <xsl:value-of select="portal:localize('Middle-name')"/>
                           </label>
                           <input type="text" id="middle-name" name="middle-name" class="text" value="{$user/middle-name}"/>
                           <label for="last-name">
                              <xsl:value-of select="portal:localize('Last-name')"/>
                           </label>
                           <input type="text" id="last-name" name="last-name" class="text required" value="{$user/last-name}"/>
                           <label>
                              <xsl:value-of select="portal:localize('Photo')"/>
                           </label>
                           <div class="temp-photo">
                             <xsl:choose>
                                <xsl:when test="$user/photo != ''">
                                   Vis bilde
                                </xsl:when>
                                <xsl:otherwise>
                                   Vis default-bilde
                                </xsl:otherwise>
                             </xsl:choose>
                           </div>
                           <label for="photo">
                              <xsl:value-of select="portal:localize('Replace-photo')"/>
                           </label>
                           <input type="file" id="photo" name="photo" class="text"/>
                           <label for="description">
                              <xsl:value-of select="portal:localize('Description')"/>
                           </label>
                           <textarea rows="5" cols="5" id="description" name="description">
                              <xsl:value-of select="$user/description"/>
                           </textarea>
                           <label for="nickname">
                              <xsl:value-of select="portal:localize('Nickname')"/>
                           </label>
                           <input type="text" id="nickname" name="nickname" class="text" value="{$user/nickname}"/>
                           <label for="title">
                              <xsl:value-of select="portal:localize('Title')"/>
                           </label>
                           <input type="text" id="title" name="title" class="text" value="{$user/title}"/>
                           <label for="html-email">
                              <xsl:value-of select="portal:localize('Html-email')"/>
                           </label>
                           <input type="checkbox" id="html-email" name="html-email">
                              <xsl:if test="$user/html-email = 'true'">
                                 <xsl:attribute name="checked">checked</xsl:attribute>
                              </xsl:if>
                           </input>
                           <input type="submit" class="button" value="{portal:localize('Update')}"/>
                        </fieldset>
                     </form>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:when>
            <!-- User not logged in -->
            <xsl:otherwise>
               <xsl:choose>
                  <!-- Forgotten password -->
                  <xsl:when test="$mode = 'resetpwd'">
                     <form action="{portal:createServicesUrl('user', 'resetpwd', portal:createPageUrl(portal:getPageKey(), ('success', 'resetpwd')), ())}" method="post">
                        <fieldset>
                           <legend>
                              <xsl:value-of select="portal:localize('Forgotten-password')"/>
                           </legend>
                           <input name="from_name" type="hidden" value="{$admin-name}"/>
                           <input name="from_email" type="hidden" value="{$admin-email}"/>
                           <input name="mail_subject" type="hidden" value="{portal:localize('Your-password')}"/>
                           <input name="mail_body" type="hidden" value="{portal:localize('resetpwd-mailbody', ($site-name))}"/>
                           <label for="id">
                              <xsl:value-of select="portal:localize('Email')"/>
                           </label>
                           <input type="text" id="id" name="id" class="text email required"/>
                           <input type="submit" class="button" value="{portal:localize('Send')}"/>
                        </fieldset>
                     </form>
                  </xsl:when>
                  <!-- Login -->
                  <xsl:otherwise>
                     <form action="{portal:createServicesUrl('user', 'login', 'http:/www.vg.no', ()), ())}" method="post">
                        <fieldset>
                           <legend>
                              <xsl:value-of select="portal:localize('Login')"/>
                           </legend>
                           <label for="uid">
                              <xsl:value-of select="portal:localize('Username')"/>
                           </label>
                           <input type="text" id="uid" name="uid" class="text required"/>
                           <label for="password">
                              <xsl:value-of select="portal:localize('Password')"/>
                           </label>
                           <input type="password" id="password" name="password" class="text required"/>
                           <label for="rememberme">
                              <xsl:value-of select="portal:localize('Remember-me')"/>
                           </label>
                           <input name="rememberme" id="rememberme" type="checkbox" value="true"/>
                           <input type="submit" class="button" value="{portal:localize('Login')}"/>
                        </fieldset>
                     </form>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:otherwise>
         </xsl:choose>
      </div>
      
   </xsl:template>
   
</xsl:stylesheet>