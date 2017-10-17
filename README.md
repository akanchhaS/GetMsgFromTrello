# GetMsgFromTrello
This script sends top three items from a specific Trello List (https://trello.com/) to the user via SMS.


Introduction: Trello is an oraganizing tool, which helps in tracking and managing different tasks. This small project is build with the idea of getting top three priority items from Trello list as SMS.

API(s) used:
a. Trello API 
b. Twilio API 

Steps:

1. Get the Trello API Key and Token from here: (https://trello.com/app-key)
2. Get the list ID which you want to populate. To get the List ID, go to the board in which the list is present, copy the link address and append it with json.
Example: https://trello.com/b/yxxxxxx7/task-tracker --> https://trello.com/b/yxxxxxx7/task-tracker.json
3. Now from the received json output, seach for the name of the List and find the id associated with it. This would be a 24 digit alphanumeric id.
4. Replace the values obtained in the above steps in the script.
5. The curl will then fetch all the cards from the specified list, extract the top three and format them.
6. The Twilio API will then send an sms to the verified Twilio number (can be any number but needs to be verified within your Twilio account) from your Twilio number (number you obtain while creating Twilio Account).
7. Replace <TWILIO_ACCOUNT_SID>:<TWILIO_AUTH_TOKEN> in teh script with your ACCOUNT_SID and AUTH_TOKEN


Details about Twilio Account set up.
1. Set up a Twilio Account (you can create a free trial account) here: https://www.twilio.com/try-twilio
2. Get the Account SiD and Auth token (refer: https://www.twilio.com/docs/api/messaging)
3. Create/choose your number.
4. If you want to send sms to multiple numbers add those numbers to the verified number list in your Twilio account. To verifiy the account an sms or call would be made to those numbers.
   Remember Twilio free account send sms to only verified/white listed numbers.
5. Add the verified phone numbers (to which messadge is to be sent) in the array 'phnum'
6. Replace the <ACCOUNT_SID> and <AUTH_TOKEN> with your account sid and auth token obtained in step 4.

P.S : To learn more about Twilio free trail account use: https://support.twilio.com/hc/en-us/articles/223136107-How-does-Twilio-s-Free-Trial-work-
 
