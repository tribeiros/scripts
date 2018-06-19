#!/bin/bash

[ $# -eq 0 ] && { echo "Usage: $0 <refresh time>" ; exit 1; }

while true
do
        clear;
        echo "Number of Active Connections:";
        netstat -an | grep 443 | grep tcp | grep -v 0.0.0.0 | grep -v ::: | cut -d':' -f2 | cut -d' ' -f12 | sort | uniq | wc -l;
        echo;
        echo "Current Active IP's:";
        netstat -an | grep 443 | grep tcp | grep -v 0.0.0.0 | grep -v ::: | cut -d':' -f2 | cut -d' ' -f12 | sort | uniq;
        sleep $1;
done