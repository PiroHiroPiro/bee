#!/bin/sh

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
  RESULT="Success!!!!";
  COLOR="#00ff00";
else
  RESULT="Failed....";
  COLOR="#ff0000";
fi

# import .env
. .env

# Message
MESSAGE="Command: ${COMMAND}\nStart time: ${start}\nEnd time: ${end}"

curl -X POST \
  -H "Authorization: Bearer ${BOT_TOKEN}" \
  -d "channel=${CHANNEL_ID}" \
  -d "text=<@${MENTION_USER}>" \
  -d "attachments=[ {\"title\": \"${RESULT}\", \"text\": \"${MESSAGE}\", \"color\": \"${COLOR}\"}]" \
  -d "icon_emoji=:beetle:" \
  https://slack.com/api/chat.postMessage > /dev/null

# Log file name
LOG_FILE_NAME=`ls -ltr ${LOG_DIR} | tail -1 | awk '{print $9}'`

curl -s -S \
  -H "Authorization: Bearer ${BOT_TOKEN}" \
  -F channels="${CHANNEL_ID}" \
  -F file=@"${LOG_DIR}""${LOG_FILE_NAME}" \
  -F filename="${LOG_FILE_NAME}" \
  -F filetype=text \
  https://slack.com/api/files.upload > /dev/null

exit 0
