#!/bin/bash

apikey=<YOUR_TRELLO_API_KEY>
token=<YOUR_TRELLO_TOKEN>
listID=<LIST_ID>
##Make call to Trello API - The curl will get all the tasks of the specified list from the trello board, usign your API key and Token. The result is json output which is parsed by jq . Extract all the cards names from the list and extract the top three items.
##Format the output to remove quotation marks and place comma between strings except the last one.
declare -a tasks=$(curl -s 'https://api.trello.com/1/lists/'$listID'/cards?fields=name&key='$apikey'&token='$token| jq '.[].name' | head -n3 | sed -e 's/\"//g' | sed '$!s/$/,/' )
echo $tasks

#Check the size of top tasks array
echo "size of array"${#tasks[@]}

#Populate message based on the array size
if [ ${#tasks} -eq 0 ]; then
        msg='No pending tasks for today!'
else
        msg='Your top tasks are:'$tasks
fi

echo $msg
##Send sms using the Twilio API
curl -X POST 'https://api.twilio.com/2010-04-01/Accounts/AC5420ccc34e76152d5c665ef792e860d7/Messages.json' \
--data-urlencode 'To=+1<DESTINATION_NUMBER>' \
--data-urlencode 'From=<YOUR_TWILIO_NUMBER>' \
--data-urlencode 'Body='"$msg" \
-u <TWILIO_ACCOUNT_SID>:<TWILIO_AUTH_TOKEN>

echo "message sent!"