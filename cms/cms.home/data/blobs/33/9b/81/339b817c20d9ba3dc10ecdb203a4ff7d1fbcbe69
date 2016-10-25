<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="xs portal" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:portal="http://www.enonic.com/cms/xslt/portal"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:javascript="myFunction">
    <xsl:output indent="yes" media-type="text/html" method="xhtml" omit-xml-declaration="yes"/>
    <xsl:variable name="categorykey" select="31"/>

    <xsl:template match="/">
        <link href="{portal:createResourceUrl('/_public/features/features.css')}" media="screen"
            rel="stylesheet" type="text/css"/>
        <script src="{portal:createResourceUrl('/_public/features/scripts/contentOperations.js', ())}" type="text/javascript"><xsl:comment>//</xsl:comment></script>
        

        <xsl:if test="/result/context/querystring/parameter[@name = 'error_content_update']">
           <p class="formError">An error was detected when submitting form</p>            
         </xsl:if>
        
        <xsl:apply-templates select="/result/contents/content"/>
    
    </xsl:template>

    <xsl:template match="content">
        
        <input type="hidden" id="updateAction" value="{portal:createServicesUrl('content','update', ())}"/>
        <input type="hidden" id="modifyAction" value="{portal:createServicesUrl('content','modify', ())}"/>
        
        <button id="setUpdate" onclick="return toggleFormMode('content_update', 'form');">Set update-mode</button>
        <button id="setModify" onclick="return toggleFormMode('content_modify', 'form');">Set modify-mode</button>
        
        <p> 
            <h3 id="formHeading">Update content:</h3>
            
            <h4><xsl:value-of select="concat(contentdata/title,' - ',contentdata/descr)"/></h4>
            <div class="form">
                <form action="{portal:createServicesUrl('content','update', ())}" id="form"
                    method="post" enctype="multipart/form-data">
                    <input type="hidden" value="0" id="elementCounter" />
                    <input name="key" type="hidden" value="{@key}"/>
                    <table cellspacing="0" class="httpservices">
                        <tr>                         
                            <th class="left">Title <span class="required">*</span></th>
                            <td>
                                <input class="text required disabled" id="heading"
                                    readonly="readonly" name="title" type="text"
                                    value="{contentdata/title}"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="left">Descr <span class="required">*</span></th>
                            <td>
                                <input name="descr" id="descr" type="text"
                                    value="{contentdata/descr}"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="left comfield">Comment <span class="required">*</span></th>
                            <td>
                                <xsl:element name="textarea">
                                    <xsl:attribute name="cols">10</xsl:attribute>
                                    <xsl:attribute name="rows">5</xsl:attribute>
                                    <xsl:attribute name="id">input_comment</xsl:attribute>
                                    <xsl:attribute name="name">comment</xsl:attribute>
                                    <xsl:attribute name="class">required</xsl:attribute>
                                    <xsl:attribute name="title">Write a comment</xsl:attribute>
                                    <xsl:value-of select="contentdata/comment"/>
                                </xsl:element>
                            </td>
                        </tr>
                        <tr>
                            <th class="left comfield">Selected: </th>
                            <td>
                                <xsl:variable name="selectedValue" select="contentdata/radiobutton1"/>
                                
                                <input name="radiobutton1" id="radiobutton1" type="radio" value="0"><xsl:if test="$selectedValue = 0">
                                    <xsl:attribute name="checked">1</xsl:attribute>
                                </xsl:if>
                                    0</input>
                                <input name="radiobutton1" id="radiobutton1" type="radio" value="5"><xsl:if test="$selectedValue = 5">
                                    <xsl:attribute name="checked">1</xsl:attribute>
                                </xsl:if>
                                    5</input>
                                <input name="radiobutton1" id="radiobutton1" type="radio" value="10"><xsl:if test="$selectedValue = 10">
                                    <xsl:attribute name="checked">1</xsl:attribute>
                                </xsl:if>
                                    10</input>
                                <input name="radiobutton1" id="radiobutton1" type="radio" value="20"><xsl:if test="$selectedValue = 20">
                                    <xsl:attribute name="checked">1</xsl:attribute>
                                </xsl:if>
                                    20</input>
                                <input name="radiobutton1" id="radiobutton1" type="radio" value="50"><xsl:if test="$selectedValue = 50">
                                    <xsl:attribute name="checked">1</xsl:attribute>
                                </xsl:if>
                                   50</input>
                            </td>
                            
                        </tr>             
                        <tr>
                            <th class="left comfield">Upload file 1:</th>
                            <td>
                                <input type="file" size="40" onchange="javascript:getFilename('uploadfile_input', this.value);" name="uploadfile_input"/>
                                <xsl:if test="contentdata/binary1/binarydata/@key">
                                <div id="uploadfile_input_key_div">
                                    Uploaded: <input type="text" name="uploadfile_input_key" id="uploadfile_input_key" readonly="true" value="{contentdata/binary1/binarydata/@key}" size="5"/>
                                    <xsl:variable name="thisKey" select="contentdata/binary1/binarydata/@key"/>
                                    <xsl:text> (</xsl:text><xsl:value-of select="binaries/binary[@key=$thisKey]/@filename"/><xsl:text>) </xsl:text><BR/>
                                    <button name="removeBinary1" id="removeBinary1" onclick="return removeFromDiv('uploadfile_input_key_div','uploadfile_input_key');">Remove</button>
                                </div>
                                </xsl:if>
                                <input type="hidden" id="filename_uploadfile_input" name="filename_uploadfile_input" value=""/>
                                <a name="uploadfile_input_link"/>
                            </td>
                        </tr>
                        <tr>
                            <th class="left comfield">Upload file 2:</th>
                            <td>
                                <input type="file" size="40" onchange="javascript:getFilename('uploadfile_input_2', this.value);" name="uploadfile_input_2"/>
                                <xsl:if test="contentdata/binary2/binarydata/@key">
                                <div id="uploadfile_input_2_key_div">
                                    Uploaded: <input type="text" name="uploadfile_input_2_key" id="uploadfile_input_2_key" readonly="true" value="{contentdata/binary2/binarydata/@key}" size="5"/>
                                    <xsl:variable name="thisKey" select="contentdata/binary2/binarydata/@key"/>
                                    <xsl:text> (</xsl:text><xsl:value-of select="binaries/binary[@key=$thisKey]/@filename"/><xsl:text>) </xsl:text><BR/>
                                    <button name="removeBinary1" onclick="return removeFromDiv('uploadfile_input_2_key_div','uploadfile_input_2_key');">Remove</button>
                                </div>
                                    </xsl:if>
                                <input type="hidden" id="filename_uploadfile_input_2" name="filename_uploadfile_input_2" value=""/>
                                <a name="uploadfile_input_link"/>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="form_labelcolumn" nowrap="true" width="">Files (key[,key...]) </td>
                            <td><input type="text" size="30" name="filesInputField"/><button name="add" onclick="return addHiddenValue(filesInputField.value, 'files', 'files')">do add</button>
                                <ul>
                                    <div class="left comfield" valign="top" id="files">
                                        <xsl:for-each select="contentdata/files/file">
                                            <div id="{generate-id(@key)}">
                                                <input type="hidden" name="files" value="{@key}"/>
                                                <li>
                                                    <xsl:value-of select="@key"/>
                                                    <a onclick="removeElement('files','{generate-id(@key)}')" href="#"> remove </a>
                                                </li>
                                            </div>
                                        </xsl:for-each>
                                    </div>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">Images (key[,key...]) </td>
                            <td>
                                <input name="imageContentInputField" id="imageContentInputField" type="text" size="30"/>
                                <button name="add" onclick="return addHiddenValue(imageContentInputField.value, 'images', 'images_input')">do add</button>
                                
                                <ul>
                                    <div class="left comfield" valign="top" id="images">
                                        <xsl:for-each select="contentdata/images/image">
                                            <div id="{generate-id(@key)}">
                                                <input type="hidden" name="images_input" value="{@key}"/>
                                                <input type="hidden" value="{text}" name="images_inputtext" readonly="true"/>
                                                <li>
                                                    <xsl:value-of select="@key"/>
                                                    <a onclick="removeElement('images','{generate-id(@key)}')" href="#"> remove </a>
                                                </li>
                                            </div>
                                        </xsl:for-each>
                                    </div>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <td>Related contents (key[,key...]) </td>
                            <td>
                                <input name="relatedContentInputField" id="relatedContentInputField" type="text"/><button name="add" onclick="return addHiddenValue(relatedContentInputField.value, 'relatedContents', 'relatedcontent_input')">do add</button>
                                <ul>
                                    <div id="relatedContents">
                                        <xsl:for-each select="contentdata/relatedcontent_input/content">
                                            <div id="{generate-id(@key)}">
                                                <input type="hidden" name="relatedcontent_input" value="{@key}"/>
                                                <li>
                                                    <xsl:value-of select="@key"/>
                                                    <a onclick="removeElement('relatedContents','{generate-id(@key)}')" href="#"> remove </a>
                                                </li>
                                            </div>
                                        </xsl:for-each>
                                    </div>
                                </ul>
                            </td>    
                        </tr>
                        <tr>
                            <td>Related content:</td>
                            <td>
                                <input name="relatedcontent_input_single"
                                    id="relatedcontent_input_single" type="text" value="{contentdata/relatedcontent_input_single/@key}" />
                            </td>
                        </tr>
                        <tr>
                            <td>Use ost? </td>
                            <td>
                                <input name="ost" id="ost" type="checkbox" onchange="this.value=this.checked">
                                    <xsl:if test="contentdata/ost = 'true'">
                                        <xsl:attribute name="checked">1</xsl:attribute>
                                        <xsl:attribute name="value">true</xsl:attribute>
                                    </xsl:if>
                                </input><BR/>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" class="form_labelcolumn" nowrap="true" width=""
                                >Dropdown:</td>
                            <td valign="baseline">
                                <xsl:variable name="optionValue" select="contentdata/dropdown"></xsl:variable>
                                <select name="dropdown_input">
                                    <option value="option1">
                                        <xsl:if test="$optionValue='option1'">
                                            <xsl:attribute name="selected">1</xsl:attribute>
                                        </xsl:if>
                                        Option1</option>
                                    <option value="option2">
                                        <xsl:if test="$optionValue='option2'">
                                            <xsl:attribute name="selected">1</xsl:attribute>
                                        </xsl:if>
                                        Option2</option>
                                    <option value="option3">
                                        <xsl:if test="$optionValue='option3'">
                                            <xsl:attribute name="selected">1</xsl:attribute>
                                        </xsl:if>
                                        Option3</option>
                                </select>
                            </td>
                        </tr>
                        <tr><td>XML:</td>
                            <td><textarea name="myXml" rows="5" cols="95"><xsl:value-of disable-output-escaping="yes" select="contentdata/myXml/."/></textarea></td>
                        </tr>
                    </table>
                    
                    <input type="submit" value="content_update" id="formSubmit" />
                    <input onclick="valid.reset(); return false" type="reset" value="Clear form"/>
                </form>
               
            </div>
        </p>
       
    </xsl:template>
   
</xsl:stylesheet>
