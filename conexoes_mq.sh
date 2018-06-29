#!/bin/bash
# Script to monitor MQ
#tribeiros & doné

#variables
n=`netstat -an | grep 1414 | grep -i EST | wc -l`
date=`date +%H:%M:%S`
blue='\033[0;34m'
red='\033[1;31m'
yellow='\033[1;33m'
green='\033[0;32m'
nc='\033[0m'
port=1414
max=$1
ttl=$2

# validate arguments
if [ ! $ttl ]; then
  printf "${yellow}\n argumento faltando \n./conexoes_mq.sh <número de conexões máxima para alerta> <tempo de resposta do log>\n >>> ex: ./conexoes_mq.sh 1500 10${nc}\n"
  echo ""
  exit
fi

#exec
while (($n > 0 ))
do
  if [ $n -ge $max ]; then
    printf " ${red}!!!!!!! $date - Conexões em $n ATENTION${nc}\n"
    n=`netstat -an | grep $port | grep -i EST | wc -l`
  else
    printf "${green}$date${nc}${blue} - Conexões em${nc} ${yellow}$n${nc}\n"
    n=`netstat -an | grep $port | grep -i EST | wc -l`
  ficd
  sleep $ttl
done