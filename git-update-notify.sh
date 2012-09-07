#!/bin/bash

#Directory which contains AUR git folders
gitdir=/home/james-arch/aur-git/

cd $gitdir
updatenum=0

for d in *; do
  #Get name of git project w/o "-git" on the end. E.g., in folder libdrm-git, extract the name libdrm as a variable
  dname=`echo $d | sed 's/-git//g'`
  cd $d/src/$dname
  git fetch > /dev/null 2>&1
  wc=`git diff master origin/master | wc -w`
    if [ $wc -gt 0 ];
      then
	$[updatenum++]
	update[$updatenum]=$dname
      else
	cd $gitdir
    fi
  cd $gitdir
done

tmpfile=$(mktemp)

for u in ${update[*]}; do
  echo $u >> $tmpfile
done

if [ -s $tmpfile ];
  then
    notify-send "Git package updates available" "The following git updates are available: \n\n $(cat $tmpfile)"
  else
    exit
fi