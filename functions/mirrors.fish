function mirrors -d 'Update pacman mirrorlist'
  set -l MPATH /etc/pacman.d/mirrorlist

  read -l MOVE -P 'Backup current mirrorlist? [Y/n] '
  switch $MOVE
    case Y y
      sudo cp $MPATH $MPATH.bak
  end

  sudo reflector -c US -f 10 -l 20 --sort score --save $MPATH --verbose

  if test $status -eq 0
    read -l UP -P 'Completed. Would you like to update now? [y/N] '
    switch $UP
      case Y y
        update
    end
  else
    echo 'An error occurred whilst doing this. Restoring backup'
    sudo rm $MPATH
    sudo cp $MPATH.bak $MPATH
  end
end
