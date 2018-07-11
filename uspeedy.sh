#!/bin/bash
# remove log from uspeedy
# tribeiros@indracompany.com - 07/2018

# Path to clean
dirR='/home/tribeiros/Projects/scripts/rmlogr'
dirS='/home/tribeiros/Projects/scripts/rmlogs'

# argument for mtime
days=+7 
# plus sign indicate to verify files after a number of days, minus sign to before

# verify directory and execute rm
if [ -d $dirR ] && [ -d $dirS ];then
  for filesR in `find $dirR/* -mtime $days`
  do
    rm -rf $filesR
  done
  for filesS in `find $dirS/* -mtime $days`
  do
    rm -rf $filesS
  done
else
  echo 'Directory not found'
fi
