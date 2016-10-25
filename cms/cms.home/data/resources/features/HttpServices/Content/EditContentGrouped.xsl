<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>

    <xsl:variable name="categorykey" select="30"/>

    <xsl:template match="/">
        <link href="{portal:createResourceUrl('/_public/features/features.css')}" media="screen"
            rel="stylesheet" type="text/css"/>
        <script src="{portal:createResourceUrl('/_public/features/scripts/contentOperations.js', ())}" type="text/javascript"><xsl:comment>//</xsl:comment></script>
   
   <xsl:apply-templates select="/result/contents/content"/>
    
    </xsl:template>

    <xsl:template match="content">
        
        
        <xsl:variable name="redirectKey" select="/result/context/querystring/parameter[@name='id']"/>
        <xsl:variable name="redirect"
            select="concat(portal:createPageUrl($redirectKey, ()),'?result=success')"/>
        
        <input type="hidden" id="updateAction" value="{portal:createServicesUrl('content','content_update', ())}"/>
        <input type="hidden" id="modifyAction" value="{portal:createServicesUrl('content','content_modify', ())}"/>
        
        <button id="setUpdate" onclick="return toggleFormMode('content_update', 'form');">Set update-mode</button>
        <button id="setModify" onclick="return toggleFormMode('content_modify', 'form');">Set modify-mode</button>
        <p> 
            <h3 id="formHeading">Update content:</h3>
            
            <xsl:if test="/result/context/querystring/parameter[@name = 'error_content_update']">
                
                <xsl:variable name="errorCode"
                    select="/result/context/querystring/parameter[@name = 'error_content_update']"/>
                
                <p class="formError"> An error occured: <xsl:value-of select="$errorCode"/>
                    <xsl:text> - </xsl:text>
                    <xsl:choose>
                        <xsl:when test="$errorCode='150'">Missing content key</xsl:when>
                        <xsl:when test="$errorCode='400'">Missing parameters</xsl:when>
                        <xsl:when test="$errorCode='401'">Illegal values in parameters </xsl:when>
                        <xsl:when test="$errorCode='402'">Failed sending e-mail </xsl:when>
                        <xsl:when test="$errorCode='405'">Invalid Captcha</xsl:when>
                        
                    </xsl:choose>
                </p>
                
            </xsl:if>
            
            
            <form action="{portal:createServicesUrl('content','update', $redirect, ())}" id="form"
                method="post" enctype="multipart/form-data">
                <input type="hidden" value="0" id="elementCounter" />
                <input name="key" type="hidden" value="{@key}"/>
                <input name="_redirect" type="hidden" value="{$redirect}"/>
                 <div class="form-content">
                    <input name="categorykey" type="hidden" value="{$categorykey}"/>
                     <table cellspacing="0" class="httpservices" id="myTable">
                        <tr>
                            <th class="left">Title <span class="required">*</span></th>
                            <td>
                                <input id="title" name="title" type="text" value="{contentdata/title}"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="left">Description <span class="required">*</span></th>
                            <td>
                                <input name="descr" id="descr" type="text" value="{contentdata/descr}"/>
                            </td>
                        </tr>
                   </table>     
                   
                     <table cellspacing="2" class="httpservices" id="group1_table">
                       <tr>    
                       <th colspan="2">
                           <center>
                           <h3>
                               Bikes
                           </h3>
                           </center>
                       </th>
                       </tr>
                        <xsl:for-each select="contentdata/entries/entry">
                         <tbody id="group1_tbody">
                             <tr><td colspan="2"><strong>Bike <xsl:value-of select="position()"/></strong></td></tr>
                             <tr>
                                <th class="left comfield">Bike name<span class="required">*</span></th>
                                <td>
                                    <xsl:variable name="sectionId" select="concat('groupedblock[',position(),'].entryname')"></xsl:variable>
                                    <div>
                                        <xsl:attribute name="id" select="concat('div',$sectionId)"/>
                                        <input type="text">
                                            <xsl:attribute name="name" select="$sectionId"></xsl:attribute>
                                            <xsl:attribute name="id" select="concat('input',$sectionId)"></xsl:attribute>
                                            <xsl:attribute name="value" select="name"></xsl:attribute></input>
                                        <button onclick="return removeElement('{concat('div',$sectionId)}','{concat('input',$sectionId)}');">
                                            Remove
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="left comfield">Bike color</th>
                                <td>
                                    <xsl:variable name="sectionId" select="concat('groupedblock[',position(),'].entryvalue')"></xsl:variable>
                                    <div>
                                        <xsl:attribute name="id" select="concat('div',$sectionId)"/>
                                        <input type="text">
                                            <xsl:attribute name="name" select="concat('groupedblock[',position(),'].entryvalue')"/>
                                            <xsl:attribute name="id" select="concat('input',$sectionId)"></xsl:attribute>
                                            <xsl:attribute name="value" select="value"></xsl:attribute></input>
                                        <button onclick="return removeElement('{concat('div',$sectionId)}','{concat('input',$sectionId)}');">
                                            Remove
                                        </button>
                                    </div>
                                </td>
                            </tr>
                         </tbody>
                        </xsl:for-each>
                      
                    </table>
                        
                     <table cellspacing="2" class="httpservices" id="group1table">
                        
                        <tr>    
                            <th colspan="2">
                                <center>
                                    <h3>
                                        Cars
                                    </h3>
                                </center>
                            </th>
                        </tr>
                        
                        <xsl:for-each select="contentdata/entries2/entry">
                            <tbody id="group2_tbody">
                                <tr><td colspan="2"><strong>Car <xsl:value-of select="position()"/></strong></td></tr>
                            <tr>
                                <th class="left comfield">Car Name<span class="required">*</span></th>
                                <td>
                                    <xsl:variable name="sectionId" select="concat('groupedblock2[',position(),'].entryname')"></xsl:variable>
                                    <div>
                                        <xsl:attribute name="id" select="concat('div',$sectionId)"/>
                                        <input type="text">
                                        <xsl:attribute name="name" select="concat('groupedblock2[',position(),'].entryname2')"></xsl:attribute>
                                            <xsl:attribute name="id" select="concat('input',$sectionId)"></xsl:attribute>
                                        <xsl:attribute name="value" select="name"></xsl:attribute></input>
                                        <button onclick="return removeElement('{concat('div',$sectionId)}','{concat('input',$sectionId)}');">
                                            Remove
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="left comfield">Car color</th>
                                <td>
                                    <xsl:variable name="sectionId" select="concat('groupedblock2[',position(),'].entryvalue')"></xsl:variable>
                                    <div>
                                        <xsl:attribute name="id" select="concat('div',$sectionId)"/>
                                        <input type="text">
                                        <xsl:attribute name="name" select="concat('groupedblock2[',position(),'].entryvalue2')"/>
                                            <xsl:attribute name="id" select="concat('input',$sectionId)"></xsl:attribute>
                                        <xsl:attribute name="value" select="value"></xsl:attribute></input>
                                        <button onclick="return removeElement('{concat('div',$sectionId)}','{concat('input',$sectionId)}');">
                                            Remove
                                        </button>
                                    </div>
                                </td>
                            </tr>
                                <tr>
                                    <th class="left comfield">Car brochure:</th>
                                    <td>
                                        <input type="file" size="30" onchange="javascript:getFilename('uploadfile_input', this.value, 'groupedblock2[{position()}]');">
                                            <xsl:attribute name="name" select="concat('groupedblock2[',position(),'].uploadfile_input')"/>
                                        </input>
                                        
                                        <xsl:if test="binary/binarydata/@key">
                                        <div id="groupedblock2[{position()}].uploadfile_input_key_div">
                                            Uploaded: <input size="5" type="text" id="groupedblock2[{position()}].uploadfile_input_key" readonly="true" value="{binary/binarydata/@key}">
                                                <xsl:attribute name="name" select="concat('groupedblock2[',position(),'].uploadfile_input_key')"/>
                                            </input>
                                                <xsl:variable name="thisKey" select="binary/binarydata/@key"/>
                                                <xsl:text> (</xsl:text><xsl:value-of select="//binaries/binary[@key=$thisKey]/@filename"/><xsl:text>) </xsl:text><BR/>
                                            <button name="removeBinary1" id="removeBinary1" onclick="return removeFromDiv('groupedblock2[{position()}].uploadfile_input_key_div','groupedblock2[{position()}].uploadfile_input_key');">Remove</button>
                                        </div>
                                        </xsl:if>
                                        <input type="hidden" id="groupedblock2[{position()}].filename_uploadfile_input" value="">
                                            <xsl:attribute name="name" select="concat('groupedblock2[',position(),'].filename_uploadfile_input')"/>
                                        </input>
                                        <a name="uploadfile_input_link"/>
                                    </td>
                                </tr>
                                <tr>
                                    <tr>
                                        <th class="left comfield">Car article:</th>
                                        <td>
                                            <input name="groupedblock2[{position()}].relatedcontent_input_single"
                                                id="groupedblock2[{position()}].relatedcontent_input_single" type="text" value="{relatedcontent_input_single/@key}"/>
                                        </td>
                                    </tr>  
 
                                </tr>
                                </tbody>
                        </xsl:for-each>
                    </table>

                    <p class="enter-button">
                        <input type="submit" id="formSubmit" value="content_update"/>
                        <input onclick="valid.reset(); return false" type="reset" value="Clear form"/>
                    </p>
                
                </div>
            </form>
        </p>    
        
    </xsl:template>
    

</xsl:stylesheet>
