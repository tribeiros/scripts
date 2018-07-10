#!/bin/bash
#Script to message on telegram group
#tribeiros@indracompany.com

#Variables 
#chatid
MSG=$1 #message
botToken='bot572938288:AAGFrgJIdj6dDiPgIgMDuCSNK5VtsBa7O4U' #xalmxbot
#chatId='-272973710' #xansiblex group  
chatId='-242284498' #indra group  

#Validating user arguments
#if [ ! $1 ]; then
#  echo "missing"
#  exit
#fi

#validating groups
#  if [ "$CID" -eq "$INDRA" ]; then
#    export CID='-272973710'
#  else
#     export CID='-242284498'
#  fi

#exec
curl -s -X POST "https://api.telegram.org/${botToken}/sendMessage" -d "chat_id=${chatId}&text=${MSG}" > /dev/null