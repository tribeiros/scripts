#!/bin/bash
# remove log from brtlvlts0408co
# tribeiros@indracompany.com - 07/2018

# Path to clean
directories=(/bloqspee/bloqueio_desbloqueio/resposta/ /bloqspee/bloqueio_desbloqueio/solicitacao/) #PROD
devDirectories=(/home/tribeiros/Projects/scripts/rmlogr/ /home/tribeiros/Projects/scripts/rmlogs/) #DEV

days=+7 # argument for `find -mtime`, plus sign indicate to verify files after a number of days, minus sign to before

# PROD function to verify directory and execute rm
rmlog(){
  for directory in ${directories[*]}
    do
      if [ -d $directory ];then
        oldFiles=`find $directory* -mtime $days`
        rm -f $oldFiles
      else
        echo $directory not found
      fi
    done
}

# DEV function to verify directory and execute rm
devrmlog(){
  for directory in ${devDirectories[*]}
  do
    if [ -d $directory ];then
      oldFiles=`find $directory* -mtime $days`
      rm -f $oldFiles
    else
      echo $directory not found
    fi
  done
}

#execute
#devrmlog
rmlog
