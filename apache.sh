#!/bin/bash
#tribeiros@indracompany.com
#Number of connections on apache

DATE=`date +%Y-%m-%d-%H:%M:%S`

[ $# -eq 0 ] && { echo "Usage: $0 <refresh time>" ; exit 1; }

while true
do
        clear;
        echo "logging connections:";
        netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n > apache$DATE.log
        echo;
        sleep $1;
done
