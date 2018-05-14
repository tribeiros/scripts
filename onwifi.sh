#!/bin/bash

#ethernet up
ethernet=`ifconfig enp0s25 | grep -Eo 'broadcast+'`

#wifi up
wifi=`ifconfig wlp2s0 | grep -Eo 'UP+'`

if [ "$ethernet" != "broadcast" ]; then
	nmcli radio wifi on ;
	sed -i -e 's/order += "ethernet enp0s25"/#order += "ethernet enp0s25"/g' ~/.i3status.conf ;
	sed -i -e 's/#order += "wireless wlp2s0"/order += "wireless wlp2s0"/g' ~/.i3status.conf ; 
	sleep 8 ;
	i3-msg restart ;
else
	nmcli radio wifi off ;
	sed -i -e 's/#order += "ethernet enp0s25"/order += "ethernet enp0s25"/g' ~/.i3status.conf ;
	sed -i -e 's/order += "wireless wlp2s0"/#order += "wireless wlp2s0"/g' ~/.i3status.conf ;
	i3-msg restart ;
fi