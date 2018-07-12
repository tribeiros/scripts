#!/bin/bash
#Script to message on telegram group
#tribeiros@indracompany.com

#Variables 
URL=https://api.telegram.org/
botToken=bot535199740:AAGhxdpQz5XDW8oSD8JYdpE0aRdXdUZwRrU #xtgxbot
ansibleGroup=(-272973710 ansible)
indraGroup=(-242284498 indra)
testGroup=(-220750192 test)
GROUP=$1
MSG=$2 #message

#Validating user arguments
if [[ ! $2 ]]; then
  echo "missing arguments"
  exit
fi

#validating groups
sendMessage() {
if [[ "$GROUP" == *"${testGroup[1]}"* ]] ;then
  chatId=${testGroup[0]}
elif [[ "$GROUP" == *"${indraGroup[1]}"* ]] ;then
  chatId=${indraGroup[0]}
else
  chatId=${ansibleGroup[0]}
fi
curl -s -X POST "${URL}${botToken}/sendMessage" -d "chat_id=${chatId}&text=${MSG}" > /dev/null
}

#exec
sendMessage
