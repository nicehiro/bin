#! /bin/bash

if ! who | grep -wq $USER; then
	exit
fi

# Phone Numbers
MY_NUMBER='+16508351121'
HER_NUMBER='+8617826856902'

REASONS=(
	'Fucking code!'
	'Studying so hard'
	'Someone fucked my system again'
)

rand=$[ $RANDOM % ${#REASONS[@]} ]

RANDOM_REASON=${REASONS[$rand]}
MESSAGE="Late at work. "$RANDOM_REASON

# Send a message
RESPONSE=`curl 'https://api.twilio.com/2010-04-01/Accounts/AC49ba042e4548c161186e8cb5d6694f17/Messages.json' -X POST \
--data-urlencode 'To=+8617826856902' \
--data-urlencode 'From=+16508351121' \
--data-urlencode "Body=$MESSAGE" \
-u AC49ba042e4548c161186e8cb5d6694f17:c50ecd0e0c0d3c18b0dfbfa559431e99`
# Log errors
if [ $? -gt 0 ]; then
	echo "Failed to send SMS: $RESPONSE"
	exit 1
fi