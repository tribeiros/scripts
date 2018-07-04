#!/bin/bash
#Script to message on telegram group
#tribeiros@indracompany.com

#Variables 
MSG=$2 #message
botToken='bot572938288:AAGFrgJIdj6dDiPgIgMDuCSNK5VtsBa7O4U' #xalmxbot
#chatId='-272973710' #indra group  
#chatId='-242284498' #xansiblex group  

#Validating user arguments
  if [ ! $2 ]; then
    echo "message is missing"
    exit
  fi

#validating groups
  if [ $1 -eq 'indra']; then
    export chatId='-272973710'
  else
     export chatId='-242284498'
  fi

#exec
curl -X POST "https://api.telegram.org/${botToken}/sendMessage" -d "chat_id=${chatId}&text=${MSG}" > /dev/null