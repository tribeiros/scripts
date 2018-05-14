#!/bin/bash
# Set Natural Scrolling for microsoft mouse wireless 800
# Tiago Ribeiro - tribeiros@indracompany.com

#hidden cursor
unclutter -idle 0.10 -root &

#set array for specific property
property=( "302" "338" )

# counting id for execute command in both properties
for (( id = 10; id < 20; id++ )); do
	xinput set-prop $id ${property[0]} 1 2>/dev/null
	xinput set-prop $id ${property[1]} 1 2>/dev/null
done
