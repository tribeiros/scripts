#!/bin/bash

wifi=down
nmcli radio wifi off ; 
sed -i -e 's/#order += "ethernet enp0s25"/order += "ethernet enp0s25"/g' ~/.i3status.conf ;
sed -i -e 's/order += "wireless wlp2s0"/#order += "wireless wlp2s0"/g' ~/.i3status.conf ;
sleep 2 ;
i3-msg restart ;