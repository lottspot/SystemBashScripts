#!/bin/bash
#Version 2.0

#Directory which contains AUR git folders
gitdir=/home/james-arch/aur-git/

cd $gitdir #cd 0
updatenum=0

for d in *; do
  if [ -d $d/src/ ];
    then
      cd $gitdir/$d/src/ #cd 1
	for subd in *; do
	  cd $subd # cd 2
	  gittest=$(ls -a | grep -x .git)
	  if [ -n $gittest ];
	    then
	      varname=$(echo $d | sed 's/-//g')
	      export gitfound_$varname=true
	      git fetch > /dev/null 2>&1
	      wc=`git diff master origin/master | wc -w`
	      if [ $wc -gt 0 ];
		then
		  (( updatenum++ ))
		  update[$updatenum]=$d
		  cd $gitdir/$d/src/ #cd 3
		else
		  cd $gitdir/$d/src #cd 4
	      fi
	    else
	      cd $gitdir/$d/src/ #cd 5
	  fi
	done
      cd $gitdir #cd 6
    else
      echo "No source directory for $d. Please download source with PKGBUILD script before attempting to update."
  fi
  gitfound=$(eval "echo \$gitfound_$varname")
  if [ "$gitfound" != "true" ];
    then
      echo "No git directory found for package $d. Cannot update non-git repositories"
  fi
done

tmpfile=$(mktemp)

for u in ${update[*]}; do
  echo $u >> $tmpfile
done

if [ -s $tmpfile ];
  then
    DISPLAY=:0 notify-send "Git package updates available" "The following git updates are available: \n\n $(cat $tmpfile)"
  else
    exit
fi
