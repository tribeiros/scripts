#!/bin/bash
#Natural Scrolling for Microsoft 800 wireless mouse
# Tiago Ribeiro , tribeiros@indracompany.com



# setting variables for ID
mid=$(xinput list | grep "Microsoft Microsoft® 2.4GHz Transceiver v8.0" | grep pointer | cut -f2 | awk -F= '{print $2}')
midf=${mid:0:2}
midl=${mid:3:6}

#setting variable for property
midlibf=$(xinput list-props $midf | grep "Natural Scrolling Enabled" | cut -f2 | sed 's/[^0-9$]//g')
midlibff=${midlibf:0:3}

#execute for both IDs
if [[ "$midf" -le 13 ]]; then
	xinput set-prop $midf $midlibff 1
else
	xinput set-prop $midl $midlibff 1
fi



