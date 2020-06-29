#!/bin/bash

#https://api.slack.com/docs/message-attachments#attachment_parameters
#https://www.flaticon.com/free-icon/

# usage example for server update: sendSlackNotification $VERSION 0 :no_mouth:
# usage example for server update failed: sendSlackNotification $VERSION 1 :no_mouth:
# usage example for server rollback: sendSlackNotification $VERSION 3 :no_mouth:
# usage example for server rollback failed: sendSlackNotification $VERSION 4 :no_mouth:

function sendSlackNotification(){
 
    #epoch time
    TIME=$(date "+%s")
    SERVER=$(cat /proc/sys/kernel/hostname)
    VERSION=${1}
    UPDATE_STATUS=${2}
    ICON=${3}

    if [ $UPDATE_STATUS -eq 0  ]; then 
 	    SHORT_MESSAGE="Server Update - Successfully "
        COLOR="#2eb886"
        STATUS="Updated"
        THUMB="http://eduardomioto.com/images/slack/updated.png"
    elif [ $UPDATE_STATUS -eq 1 ] ; then
        SHORT_MESSAGE="Server Update - Failed "
        COLOR="#ff5f02"
        STATUS="Update Failed"
        THUMB="http://eduardomioto.com/images/slack/cancel.png"
    elif [ $UPDATE_STATUS -eq 3 ] ; then
        SHORT_MESSAGE="Server Rollback - Successfully "
        COLOR="#ffe900"
        STATUS="Rolled Back Successfully"
        THUMB="http://eduardomioto.com/images/slack/solved.png"        
    elif [ $UPDATE_STATUS -eq 4 ] ; then
        SHORT_MESSAGE="Server Rollback - Failed "
        COLOR="#ff0000"
        STATUS="Roll Back Failed"
        THUMB="http://eduardomioto.com/images/slack/fire.png"    
    fi

    curl \
	  -X POST \
	  -H 'Content-type: application/json'  \
	  --data-binary @- https://hooks.slack.com/services/<your-hook-id> <<EOF
        {
           "channel": "#maintenance", 
           "icon_emoji": "$ICON",
           "attachments": [
                {
                    "fallback": "$SHORT_MESSAGE",
                    "color": "$COLOR",
                    "author_name": "Server Maintenance Update",
                    "title": "Target Server: $SERVER",
                    "text": "*Version:* $VERSION",
                    "fields": [
                        {
                            "title": "Status",
                            "value": '$STATUS',
                            "short": false
                        }
                    ],
                    "thumb_url": "$THUMB",
                    "footer": "System Chat Ops",
                    "footer_icon": "$THUMB",
                    "ts": $TIME
                }
            ]
        }'
EOF
}