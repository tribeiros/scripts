#!/bin/bash
DIR='/home/tribeiros/Projects/scripts/rmlog'

if [ -d $DIR ];then
  for files in `find $DIR/* -mtime -7`
  do
    rm -rf "$files"
  done
fi