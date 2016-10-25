
function toggleFormInput(toggleButton) {

    var inputElement = toggleButton.previousSibling;
    
    inputElement.disabled = !inputElement.disabled;
    
    if (inputElement.disabled == false) {
        toggleButton.value = "disable";
    } else {
        toggleButton.value = "enable";
    }

    return false;
}

function toggleFormInput(toggleButton, disabledValue, enabledValue) {

    var inputElement = toggleButton.previousSibling;
    
    inputElement.disabled = !inputElement.disabled;
    
    if (inputElement.disabled == false) {
        toggleButton.value = enabledValue;
    } else {
        toggleButton.value = disabledValue;
    }

    return false;
}



function hidediv(divToHide) {
    if (document.getElementById) {
        document.getElementById(divToHide).style.display = 'none';
    }
}

function showdiv(divToShow) {
    if (document.getElementById) {
        document.getElementById(divToShow).style.display = 'block';
    }
}

function addHiddenValue(newValue, addToDiv, hiddenFieldName) {
    if (newValue.indexOf(',') != - 1) {
        var arrayValues = newValue.split(',');
        var contentValue;
        
        for (value in arrayValues) {
            addHiddenInputField(hiddenFieldName, addToDiv, arrayValues[value]);
        }
    } else {
        addHiddenInputField(hiddenFieldName, addToDiv, newValue);
    }
    return false;
}

// -----------------------------------------------------------------------------------------------------------

/*
Method: addHiddenInputField
*/
function addHiddenInputField(hiddenFieldName, addToDiv, value) {
    
    var ni = document.getElementById(addToDiv);
    var mainDiv = document.createElement('div');
    var fieldId = eval(document.getElementById('elementCounter').value);
    mainDiv.setAttribute('id', fieldId);
    
    var field = document.createElement('input');
    
    field.setAttribute('type', 'hidden');
    field.setAttribute('name', hiddenFieldName);
    field.setAttribute('value', value);
    
    mainDiv.appendChild(field);
    
    if (hiddenFieldName.indexOf('image') != - 1) {
        
        textField = document.createElement('input');
        textField.setAttribute('type', 'hidden');
        textField.setAttribute('value', 'Image_' + value);
        textField.setAttribute('name', 'images_inputtext');
        textField.setAttribute('readonly', 'true');
        
        mainDiv.appendChild(textField);
    }
    
    displayElement = document.createElement('li');
    displayElement.innerHTML = value + '<a href="#" onclick="removeElement(\'' + addToDiv + '\',\'' + fieldId + '\')"> remove </a>';
    mainDiv.appendChild(displayElement);
    
    ni.appendChild(mainDiv);
    
    document.getElementById('elementCounter').value = eval(fieldId) + 1;
}

// -----------------------------------------------------------------------------------------------------------

/*
Method: removeElement
*/
function removeElement(divToRemoveFrom, elementId) {
    var d = document.getElementById(divToRemoveFrom);
    var olddiv = document.getElementById(elementId);
    d.removeChild(olddiv);
    return false;
}

// -----------------------------------------------------------------------------------------------------------

/*
Method: getFilename
*/
function getFilename(inputName, fileName, groupName) {
    
    var divId = null;
    var existingKeyId = null;
    
    if (groupName != null) {
        document.getElementById(groupName + '.' + 'filename_' + inputName).value = fileName;
        divId = groupName + '.' + inputName + '_key_div';
        existingKeyId = groupName + '.' + inputName + '_key';
    } else {
        document.getElementById('filename_' + inputName).value = fileName;
        divId = inputName + '_key_div';
        existingKeyId = inputName + '_key';
    }
    
    removeFromDiv(divId, existingKeyId);
}
// -----------------------------------------------------------------------------------------------------------

/*
Method: removeFromDiv
*/
function removeFromDiv(divId, existingKeyId) {
    var divToRemoveFrom = document.getElementById(divId);
    var existingKey = document.getElementById(existingKeyId);
    
    if (divToRemoveFrom.childNodes.length != 0) {
        divToRemoveFrom.removeChild(existingKey);
        divToRemoveFrom.innerHTML = '';
    }
    
    return false;
}

// -----------------------------------------------------------------------------------------------------------

/*
Method: toggleFormMode
*/
function toggleFormMode(mode, formId) {
    
    var form = document.getElementById(formId);
    var submitButton = document.getElementById(formId + 'Submit');
    var formHeading = document.getElementById(formId + 'Heading');
    
    if (mode == 'content_update') {
        var formAction = document.getElementById('updateAction').value;
        form.setAttribute('action', formAction);
        submitButton.setAttribute('value', 'content_update');
        formHeading.innerHTML = 'Update content:';
    } else if (mode == 'content_modify') {
        var formAction = document.getElementById('modifyAction').value;
        form.setAttribute('action', formAction);
        submitButton.setAttribute('value', 'content_modify');
        formHeading.innerHTML = 'Modify content:';
    }
    
    return false;
}

function getObjectIndex(obj) {
    var lNumRows = itemcount(document.getElementsByName(obj.name));
    if (lNumRows > 1) {
        for (var i = 0; i < lNumRows; i++) {
            if (document.getElementsByName(obj.name)[i] == obj) {
                return i;
            }
        }
    } else {
        return 0;
    }
}

function itemcount(elName) {
    var lItems;
    if (elName.length != null) {
        lItems = elName.length;
    } else {
        lItems = 1;
    }
    return lItems;
}

function activateButtonIfValue(elementId, buttonId) {
    
    var button = document.getElementById(buttonId);
    var element = document.getElementById(elementId);
    
    if (element.value == null || element.value == '') {
        button.disabled = true;
    } else {
        button.disabled = false;
    }
}

/**
 * disableEnableInputElement
 *
 *  Requires jQuery >= 1.3.2
 *
 * @param parentToInputElem
 * @param clickButton
 */
function disableEnableInputElement( parentToInputElem, clickButton )
{
    var enabled = false;
    parentToInputElem.find(':input').each( function(i) {
        enabled = !$(this).attr('disabled');

        if ( enabled )
        {
            $(this).attr('disabled', 'true');
        }
        else
        {
            $(this).removeAttr('disabled');
        }
    });

    if ( enabled )
    {
        clickButton.html('Enable');
        clickButton.addClass('disable-enable-button-disabled');
        clickButton.blur();
    }
    else
    {
        clickButton.html('Disable');
        clickButton.removeClass('disable-enable-button-disabled');
    }
}

/**
 * addBlockGroup
 *
 *  Requires jQuery >= 1.3.2
 *
 * @param groupTemplateElement
 * @param fieldsetElem
 */
function addBlockGroup( groupTemplateElement, fieldsetElem )
{
    var newGroupElement = groupTemplateElement.clone(true);
    var groupCounter = 1;
    var inputNamePattern = /(^.+?\[)-\d+(\]\..+$)/; // match: "abcef[-1]ghijk"
    
    newGroupElement.removeAttr('id');
    newGroupElement.removeAttr('class');
    newGroupElement.css('display', 'block');
    
    fieldsetElem.append(newGroupElement);

    fieldsetElem.find('.block-group').each( function(i) {

        $(this).find(':input').each( function() {

            if ( this.name && inputNamePattern.test(this.name) )
            {
                this.name = this.name.replace(inputNamePattern, '$1' + (groupCounter) + '$2');
            }
        });

        groupCounter++;
    });
}

function addRelatedContentKeyToTextField(key, clickButton)
{
    $(clickButton).parent().prev().prev().val(key);
}

function getDateToday( returnInvalidDate )
{
    var returnDate = '';

    var d = new Date();
    var day = d.getDate();
    var month = d.getMonth() + 1;
    var year = d.getFullYear();


    day = ( day < 10 ) ? '0' + day : day;
    month = ( month < 10 ) ? '0' + month : month;

    returnDate = day + '.' + month + '.' + year;

    if ( returnInvalidDate )
    {
        returnDate = year + '-' + month + '-' + day;
    }

    return returnDate;
}

function getRandomUrl( returnInvalidUrl )
{
    var urls, urlsSize, randomNumber, returnUrl = '';

    urls = ['http://www.enonic.com',
        'http://www.publisering.no',
        'http://reddit.com',
        'http://aftenposten.no',
        'http://www.ajaxian.com',
        'http://www.news.com',
        'http://www.vg.com',
        'http://www.dagbladet.com',
        'http://www.bbc.co.uk',
        'http://www.ost.no',
        'http://www.fisk.no',
        'http://agderposten.no'
    ];
    urlsSize = urls.length;
    randomNumber = Math.ceil(urlsSize * Math.random()) -1;
    returnUrl = urls[randomNumber];

    if ( returnInvalidUrl )
    {
      returnUrl = returnUrl.replace(/http:\/\/(.+?)/, '$1');
    }
    
    return returnUrl;
}

// TODO: Pretty print XML.
/**
 * toggleDisplayViewXML
 *  Requires jQuery >= 1.3.2
 *  
 * @param clickButton
 */
function toggleDisplayViewXML( clickButton )
{

    var viewXmlContainerElem = $('#xml-output')[0];
    var xmlStoreElem = $('#xml-view-store')[0];
    var prettifyElem = $('#prettify')[0];
    var parser, xmlDoc, serializer, xmlString, xmlStore;


    if ( viewXmlContainerElem.style.display === 'none' )
    {
        xmlStore = xmlStoreElem.innerHTML.replace(/&lt;/gim, '<');
        xmlStore = xmlStore.replace(/&gt;/gim, '>');

        parser = new DOMParser();
        xmlDoc = parser.parseFromString(xmlStore ,"text/xml");

        serializer = new XMLSerializer();
        xmlString = serializer.serializeToString(xmlDoc);

        viewXmlContainerElem.style.display = 'block';

        prettifyElem.innerHTML = xmlString.replace(/<(\/.+?)>/gm, '&lt;$1&gt;\n').replace(/</gm, '&lt;');

        clickButton.innerHTML = 'Hide XML';

    }
    else
    {
        viewXmlContainerElem.style.display = 'none';
        clickButton.innerHTML = 'Show XML';
    }



    /*
    var message1 = "<data><foo>123</foo></data>";

    var newWindow = window.open('http://versiontest/cms-bubble-unstable-packages/admin/site/0/en/rss','','toolbar=no,scrollbars=no,width=200,height=150');
    newWindow.document.open("text/xml");
    //newWindow.document.writeln(message1);
    newWindow.document.close();
    */

    /*
    var viewXmlContainerElem = $('#xml-output')[0];
    var viewXMLElemCssDisplay = viewXmlContainerElem.style.display;
    */
    /*
    var xmlStoreElem = $('#xml-view-store')[0];
    var prettifyElem = $('#prettify')[0];
    var iframeElem, iFrameDocument;
    var parser, xmlDoc;
    */

    /*
    if ( viewXMLElemCssDisplay === 'none' )
    {
          parser=new DOMParser();
          xmlDoc=parser.parseFromString(xmlStoreElem.innerHTML ,"text/xml");
        if ( !document.getElementById('view-xml-iframe') )
        {
            iframeElem = document.createElement("iframe");
            iframeElem.id = 'view-xml-iframe';
            iframeElem.style.width = 640+"px";
            iframeElem.style.height = 480+"px";

            xmlStoreElem.parentNode.appendChild(iframeElem);
            
            iFrameDocument = document.all ? iframeElem.contentWindow.document : iframeElem.contentDocument;

            iFrameDocument.open("text/xml");
            iFrameDocument.write(xmlStoreElem.innerHTML);
            iFrameDocument.close();
        }

        viewXmlContainerElem.style.display = 'block';
        clickButton.innerHTML = 'Hide XML';
    }
    else
    {
        viewXmlContainerElem.style.display = 'none';
        clickButton.innerHTML = 'View XML';
    }
    */
}

