<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>
    
    <xsl:template name="userInfo">
        <xsl:param name="user"/>
        

        <fieldset>
            <legend>Basic info</legend>
            
            <label for="uid">uid</label>
            <input type="text" name="uid" id="uid" disabled="true" value="{$user/@qualified-name}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="enable"/>
            
            <label for="userstore">Userstore</label>
            <input type="text" name="userstore" id="userstore" disabled="true" value="{$user/userstore}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="enable"/>
            
            <label for="display_name">Display name</label>
            <input type="text" name="display_name" id="display_name" value="{$user/display-name}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
            <label for="email">Email</label>
            <input type="text" name="email" id="email" value="{$user/email}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
        </fieldset>
        
        <fieldset>
            <legend>Name</legend>
            
            <label for="prefix">Prefix</label>
            <input type="text" name="prefix" id="prefix" value="{$user/prefix}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
            <label for="first_name">First name</label>
            <input type="text" name="first_name" id="first_name" value="{$user/first-name}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
            <label for="middle_name">Middle name</label>
            <input type="text" name="middle_name" id="middle_name" value="{$user/middle-name}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
            <label for="last_name">Last name</label>
            <input type="text" name="last_name" id="last_name" value="{$user/last-name}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
            <label for="suffix">Suffix</label>
            <br/>
            <input type="text" name="suffix" id="suffix" value="{$user/suffix}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
            <label for="initials">Initials</label>
            <input type="text" name="initials" id="initials" value="{$user/initials}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
            <label for="nickname">Nickname</label>
            <input type="text" name="nick_name" id="nickname" value="{$user/nickname}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
        </fieldset>
        
        <fieldset>
            <legend>Photo</legend>
            
            <label> Current photo: </label>
            <xsl:choose>
                <xsl:when test="$user/photo/@exists = 'true'">
                    <img src="{portal:createImageUrl(concat('user/', $user/@key), 'rounded(4)')}"
                        alt="{concat(portal:localize('Image-of'), ' ', $user/@fullname)}"/>
                </xsl:when>
                <xsl:otherwise>
                    <img
                        src="{portal:createResourceUrl('/_public/packages/commons/images/dummy-user.png')}"
                        alt="{portal:localize('Dummy-image')}"/>
                </xsl:otherwise>
            </xsl:choose>
            <BR/>
            <label for="photo">Change:</label>
            <input type="file" name="photo" id="photo"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
        </fieldset>
        
        
        <fieldset>
            <legend>Personal details</legend>
            
            <label for="personal_id">Personal id</label>
            <input type="text" name="personal_id" id="personal_id" value="{$user/personal-id}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
            <label for="member_id">Member id</label>
            <input type="text" name="member_id" id="member_id" value="{$user/member-id}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
            <label for="birthday">Birthday</label>
            <input type="text" name="birthday" id="birthday" value="{$user/birthday}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
            <label for="gender">Gender</label>
            <br/>
            <input type="text" name="gender" id="gender" value="{$user/gender}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
            <label for="title">Title</label>
            <input type="text" name="title" id="title" value="{$user/title}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
            <label for="description">Description</label>
            <input type="text" name="description" id="description" value="{$user/description}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
            <label for="html_email">Html email</label>
            <input type="checkbox" name="html_email" id="html_email" value="{$user/html-email}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
            <label for="url">URL</label>
            <input type="text" name="url" id="url" value="{$user/url}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
        </fieldset>
        
        <fieldset>
            <legend>Communication</legend>
            
            <label for="phone">Phone</label>
            <input type="text" name="phone" id="phone" value="{$user/phone}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
            <label for="phone">Mobile</label>
            <input type="text" name="mobile" id="mobile" value="{$user/mobile}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
            <label for="phone">Fax</label>
            <input type="text" name="fax" id="fax" value="{$user/fax}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
        </fieldset>
        
        <fieldset>
            <legend>Location</legend>
            
            <label for="time_zone">Time zone</label>
            <select name="time_zone" id="time_zone">
                <xsl:variable name="userTimeZone" select="$user/time-zone"/>
                <option value="">-- Select --</option>
                <xsl:for-each select="/result/time-zones/time-zone">
                    <option value="{@ID}">
                        <xsl:if test="$userTimeZone = @ID">
                            <xsl:attribute name="selected">true</xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="display-name"/>
                    </option>
                </xsl:for-each>
            </select>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
            <label for="locale">Locale</label>
            <select name="locale" id="locale">
                <xsl:variable name="userLocale" select="$user/locale"/>
                <option value="">-- Select --</option>
                <xsl:for-each select="/result/locales/locale">
                    <option value="{name}">
                        <xsl:if test="$userLocale = name">
                            <xsl:attribute name="selected">true</xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="display-name"
                        />
                    </option>
                </xsl:for-each>
            </select>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
            <label for="global_position">Global position</label>
            <input type="text" name="global_position" id="global_position"
                value="{$user/global-position}"/>
            <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
            
        </fieldset>
        
        <fieldset>
            <legend>Address</legend>
            
            <xsl:if test="not($user/addresses/address)">
                <label for="address[0].name">Address name</label>
                <input type="text" name="address[0].name" id="address[0].name" value="{name}"/>
                <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
                
                <label for="address[0].street">Street</label>
                <input type="text" name="address[0].street" id="address[0].street" value="{street}"/>
                <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
                
                <label for="address[0].postal-code">Postal code</label>
                <input type="text" name="address[0].postal_code" id="address[0].postal_code"
                    value="{postal-code}"/>
                <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
                
                <label for="address[0].postal_address">Postal address</label>
                <input type="text" name="address[0].postal_address" id="address[0].postal_address"
                    value="{postal-address}"/>
                <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
                
                <label for="address[0].country">Country</label>
                <select name="address[0].country">
                    <xsl:variable name="addressCountry" select="$user/country"/>
                    <option value="">-- Select --</option>
                    <xsl:for-each select="/result/countries/country">
                        <option value="{@code}">
                            <xsl:if test="$addressCountry = @code">
                                <xsl:attribute name="selected">true</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="english-name"/>
                        </option>
                    </xsl:for-each>
                </select>
                <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
                
                <label for="address[0].region">Region</label>
                <input type="text" name="address[0].region" id="address[0].region" value="{region}"/>
                <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
                
            </xsl:if>
            
            <xsl:for-each select="$user/addresses/address">
                
                <label for="address[{position()-1}].name">Address name</label>
                <input type="text" name="address[{position()-1}].name"
                    id="address[{position()-1}].name" value="{name}"/>
                <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
                
                <label for="address[{position()-1}].street">Street</label>
                <input type="text" name="address[{position()-1}].street"
                    id="address[{position()-1}].street" value="{street}"/>
                <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
                
                <label for="address[{position()-1}].postal_code">Postal code</label>
                <input type="text" name="address[{position()-1}].postal_code"
                    id="address[{position()-1}].postal_code" value="{postal-code}"/>
                <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
                
                <label for="address[{position()-1}].postal_address">Postal address</label>
                <input type="text" name="address[{position()-1}].postal_address"
                    id="address[{position()-1}].postal_address" value="{postal-address}"/>
                <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
                
                <label for="address[0].country">Country</label>
                <select name="address[0].country">
                    <xsl:variable name="addressCountry" select="country"/>
                    <option value="">-- Select --</option>
                    <xsl:for-each select="/result/countries/country">
                        <option value="{@code}">
                            <xsl:if test="$addressCountry = @code">
                                <xsl:attribute name="selected">true</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="english-name"/>
                        </option>
                    </xsl:for-each>
                </select>
                <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"/>
                
                
                <label for="address[{position()-1}].region">Region</label>
                <input type="text" name="address[{position()-1}].region"
                    id="address[{position()-1}].region" value="{region}"/>
                <input type="button" class="button" onclick="toggleFormInput(this);" value="disable"
                />
            </xsl:for-each>
            
        </fieldset>
        
        
        <fieldset>
            <legend>Groups</legend>
            
            <label for="allgroupkeys">Group keys to consider:</label>
            <textarea name="allgroupkeys" id="allgroupkeys" style="height: 100px;"/>
            
            <label for="joingroupkey">Group keys to join or keep membership to:</label>
            <textarea name="joingroupkey" id="joingroupkey" style="height: 100px;"/>
            
        </fieldset>
        
        
    </xsl:template>
    
    <xsl:template name="groupInfo">
        <xsl:param name="user"/>
        
        <table class="httpservices">
            <tr>
                <td>
                    <table class="httpservices">
                        <th>Name</th>
                        <th>Key</th>
                        <th>Type</th>
                        <th>Operations</th>
                        
                        <xsl:for-each select="$user/memberships/group[@direct-membership='true']">
                            <tr>
                                <td class="shadowed">
                                    <xsl:choose>
                                        <xsl:when test="@restricted='false'">
                                            <xsl:attribute name="class">ok</xsl:attribute>
                                        </xsl:when>
                                    </xsl:choose>
                                    
                                    <xsl:value-of select="@name"/>
                                </td>
                                <td class="shadowed">
                                    <xsl:choose>
                                        <xsl:when test="@restricted='false'">
                                            <xsl:attribute name="class">ok</xsl:attribute>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:value-of select="@key"/>
                                </td>
                                <td class="shadowed">
                                    <xsl:if test="@restricted='false'">
                                        <xsl:attribute name="class">ok</xsl:attribute>
                                        Open<BR/>
                                    </xsl:if>
                                    <xsl:if test="@restricted='true'">Restricted
                                        <BR/></xsl:if>
                                    <xsl:if test="@built-in='true'">Built-in</xsl:if>
                                    
                                </td>
                                <td>
                                    <xsl:if test="@restricted='false'">
                                        <form
                                            action="{portal:createServicesUrl('user','leavegroup', ())}"
                                            id="form" method="post">
                                            <input type="hidden" name="key" value="{@key}"/>
                                            <input type="submit" value="leave"/>
                                        </form>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </td>
            </tr>
        </table>
        
    </xsl:template>
    
    

</xsl:stylesheet>
