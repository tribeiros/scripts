#!/bin/bash
#Script to view city weather
#tribeiros@indracompany.com

#Variables 
CITY=$1 #city

#exec
curl wttr.in/"${CITY}"