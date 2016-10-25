/*
	twitranett.js
		
		- Requires jQuery 1.3.2 or higher
*/

var TN_pollTimer = 0;
var TN_countDownTimer = 0;
var TN_countDownCounter = -1;

var Twitranett = {
    submit: function( formElem )
    {
        var message = jQuery.trim(formElem['message'].value);

        if ( message === '' )
        {
            form['message'].focus();
            return false;
        }
		
        $.ajax({
            type: 'POST',
            url: TN_postURL,
            data: ({
                'message': message,
                'latitude': '',
                'longitude': ''
            }),

            beforeSend: function() 
			{
                formElem['twitranett-submit-button'].disabled = true;
            },

            success: function(msg) 
			{
                formElem['twitranett-submit-button'].disabled = false;
                Twitranett.load(TN_numberOfMessagesToShow, true);
            },

            error: function(XMLHttpRequest, textStatus, errorThrown)
            {
                /* HTTP error handling here */
            }
        });

        formElem['message'].value = '';
        formElem['message'].focus();

        return false;
    },

    load: function(count, fadeInNewesMessage)
    {
        TN_numberOfMessagesToShow = count;

        clearTimeout(TN_pollTimer);

        $.get(TN_urlToMessageList, {'count': count}, function( data )
        {
            alert(data);
            var messages = $(data).find('twitrs twitr');
            var messageCount = messages.size();
            var elementToAppendMessagesTo = $('#twitranett-messages');
            var t, message, owner, photoUrl, created, createdPrettyDate,  messageCssClass;

            elementToAppendMessagesTo.html('');

            messages.each(function( i )
            {
                t = $(this);
				
                message = t.find('message').text();
                alert(message);
				message = Twitranett.formatMessage(message);
                owner = t.attr('owner');
                photoUrl = t.find('photo-url').text();
                created = t.attr('created');
                createdPrettyDate = t.attr('created-pretty-date');
                messageCssClass = 'twitranett-message';

                if (i + 1 === messageCount) messageCssClass += ' last';

                var msgStr = '<div class="' + messageCssClass + '">';
                msgStr += '<div style="float:left;padding:0;margin:0 10px 0 0;width:28px">';
                msgStr += '<img src="' + photoUrl + '" alt="' + owner + '" title="' + owner + '" width="28"/>';
                msgStr += '</div>';
                msgStr += '<div style="margin:0;padding:0">';
                msgStr += '<strong>' + owner + ':</strong> ' + message + '<div class="twitranett-created-date">';
                msgStr += createdPrettyDate + '</div>';
                msgStr += '</div>';
                msgStr += '</div>';

                elementToAppendMessagesTo.append(msgStr);
            });

            if ( fadeInNewesMessage )
            {
                var newMessage = $('.twitranett-message:first');

                $(newMessage).hide();
                $(newMessage).fadeIn('slow');
            }

            TN_pollTimer = setTimeout(function() 
			{
                Twitranett.load(TN_numberOfMessagesToShow, false);
            }, TN_pollIntervalSec * 1000);
			
			// clearTimeout(TN_countDownTimer);
			//TN_countDownCounter = TN_pollIntervalSec;
			// Twitranett.countDown();
        });
    },

	countDown: function()
	{
		var countDownContainerElem = $('#twitranett-countdown-container');

		TN_countDownTimer = setTimeout(function() 
		{
			countDownContainerElem.html( TN_countDownCounter );
			TN_countDownCounter--; 
			Twitranett.countDown();
		}, 1000);
	},

	formatMessage: function( message )
	{
		// Very simple Markdown formating.
		var urlPattern 	= /(https?:\/\/([-\w\.]+)+(:\d+)?(\/([\w/_#:\(\)\.-]*(\?\S+)?)?)?)/gim;
        var urlResultPattern = '<a href="$1" title="$1" target="_blank">$1</a>';
		var boldPattern = /(__)([^_]+)(__)/gm;
		var boldPattern2 = /(\*\*)([^\*]+)(\*\*)/g;
		var boldResultPattern = '<span style="display:inline;font-size:108%;font-weight:bold;">$2</span>';
		var emphasisPattern = /(_)([^_]+)(_{1})/g;
		var emphasisPattern2 = /(\*)([^\*]+)(\*{1})/g;
		var emphasisResultPattern = '<span style="display:inline;font-style:italic">$2</span>';
		
		var m = message.replace(urlPattern, urlResultPattern);
		// Bold must be handled before emphasis.
		m = m.replace(boldPattern, boldResultPattern);
		m = m.replace(boldPattern2, boldResultPattern);
		m = m.replace(emphasisPattern, emphasisResultPattern);
		m = m.replace(emphasisPattern2, emphasisResultPattern);
		
		return m;
	}
}

/*
Tagger = {
    messageKey: null,

    openWindow: function(messageKey, target)
    {
        this.messageKey = messageKey;
        elementToTag = target;
        var position = $(target).position();
        $('#tagger-window').css({
            'display': 'block',
            'position': 'absolute',
            'top': position.top + 'px',
            'left': position.left
        });
        $('#tagger-window input[name=tag]').focus();
    },

    submit: function(form)
    {
        var t = this;
        var url = '';
        var tagStr = jQuery.trim(form['tag'].value);

        if (tagStr === '')
        {
            form['tag'].focus();
            return false;
        }

        $.ajax({
            type: 'POST',
            url: url,
            data: ({
                'tag': tagStr,
                'message_key': t.messageKey
            }),
            beforeSend: function() {
                form['tag-submit-button'].disabled = true;
                form['tag'].readOnly = true;
            },
            success: function(msg) {
                form['tag-submit-button'].disabled = false;
                t.closeWindow();
                form['tag'].readOnly = false;
            },
            error: function(XMLHttpRequest, textStatus, errorThrown)
            {
                form['tag-submit-button'].disabled = false;
                form['tag'].readOnly = false;
            }
        });

        form['tag'].value = '';
        return false;
    },

    closeWindow: function()
    {
        $('#tagger-window').fadeOut('fast');
    }
}
*/

$(document).ready(function() 
{
    Twitranett.load(TN_numberOfMessagesToShow, false);
});

$(window).unload(function() 
{
    clearTimeout(TN_pollTimer);
    clearTimeout(TN_countDownTimer);
    TN_pollTimer = null;
	TN_countDownTimer = null;
});

/*
$(document).click(function(event) {
    var target = $(event.target);
    if (target.attr('class').indexOf('tagger') != -1) return;

    Tagger.closeWindow();
});
*/