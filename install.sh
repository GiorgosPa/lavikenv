#!/bin/bash
set -e
set -u

mydir=`pwd`
backup="$HOME/.dotfiles-backup-`date +%s`"

# Backup the stuff and creates symlinks
for f in $mydir/rc/*; do

  file=`basename $f`
  dest="$HOME/.$file"
  source="$mydir/rc/$file"

  if [[ -f $dest || -d $dest ]]; then
    mkdir -p $backup
    echo "Making backup of $dest in $backup"
    cp -R $dest $backup/$file
  fi
  echo "Symlinking: .$file"
  ln -is $source $dest

done

cp -iR $mydir/config/* $HOME/.config/

echo "Done."
