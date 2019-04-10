#!/bin/sh

# ----- bee -----
if [ $# = 0 ]; then
  echo "need argument 'COMMAND'" 1>&2
  exit 0
else
  COMMAND=$*
fi
start="`date '+%y/%m/%d %H:%M:%S'`"

${COMMAND}
status=$?
end="`date '+%y/%m/%d %H:%M:%S'`"

if [ $status = 0 ]; then
  MESSAGE="Success!!!!";
  COLOR="#00ff00";
else
  MESSAGE="Failed....";
  COLOR="#ff0000";
fi

# Webhook URL
WEBHOOKURL="YOUR_SLACK_WEBHOOK_URL"
# Slack Channel
CHANNEL=${CHANNEL:-"#general"}
# BOT NAME
BOTNAME=${BOTNAME:-"Bee"}
# Slack BOT Icon
FACEICON=${FACEICON:-":bee:"}
# Message
WEBMESSAGE="Command: ${COMMAND}\nStart time: ${start}\nEnd time: ${end}"
# Mention User
MENTION_USER="@channel"

curl -s -S -X POST --data-urlencode "payload={\"channel\": \"${CHANNEL}\", \"username\": \"${BOTNAME}\", \"text\": \"${MENTION_USER}\", \"icon_emoji\": \"${FACEICON}\", \"attachments\": [ {\"title\": \"${MESSAGE}\", \"text\": \"${WEBMESSAGE}\", \"color\": \"${COLOR}\"}] }" ${WEBHOOKURL} > /dev/null
# ----- bee -----

# ----- beetle -----

# Log directory
LOG_DIR=YOUR_LOG_DIR
# Slack BOT Token
BEETLE_TOKEN="YOUR_SLACK_BOT_TOKEN"
# Slack Channel ID
CHANNEL_ID=YOUR_SLACK_CHANNEL_ID

LOG_FILE=`ls -ltr ${LOG_DIR} | tail -1 | awk '{print $9}'`
curl -s -S -F file=@"${LOG_DIR}""${LOG_FILE}" -F channels="${CHANNEL_ID}" -F filename="${LOG_FILE}" -F filetype=text -H "Authorization: Bearer ${BEETLE_TOKEN}" https://slack.com/api/files.upload > /dev/null

# ----- beetle -----

exit 0
