#!/bin/bash
# remove log from uspeedy
# tribeiros@indracompany.com - 07/2018

# Path
dirR='/home/tribeiros/Projects/scripts/rmlogr'
dirS='/home/tribeiros/Projects/scripts/rmlogs'

#argument for mtime
days='+7'

# verify directory and execute rm
if [ -d $dirR ] && [ -d $dirS ];then
  for filesR in `find $dirR/* -mtime $days`
  do
    rm -rf "$filesR"
  done
  for filesS in `find $dirS/* -mtime $days`
  do
    rm -rf "$filesS"
  done
else
  echo 'Directory not found'
fi
