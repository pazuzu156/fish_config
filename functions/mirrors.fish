function mirrors -d 'Update pacman mirrorlist'
  argparse -n mirrors 'r/restore' 'n/noupdate' -- $argv
    or return

  set -l MPATH /etc/pacman.d/mirrorlist
  set -l NO_UPDATE 0

  if set -q _flag_n
    set NO_UPDATE 1
  end

  if set -q _flag_r
    if test -f $MPATH.bak
      sudo rm -rf $MPATH
      sudo mv $MPATH.bak $MPATH
      read -l REUP -P 'Mirrorlist backup restored. Run a system update now? [Y/n] '
      switch $REUP
        case Y y
          update
      end
    else
      echo 'There is no mirrorlist backup to restore from!'
    end
  else

    read -l MOVE -P 'Backup current mirrorlist? [Y/n] '
    switch $MOVE
      case Y y
        sudo cp $MPATH $MPATH.bak
    end

    sudo reflector -c US -f 10 -l 20 --sort score --save $MPATH --verbose

    if test $status -eq 0
      if [ $NO_UPDATE = 1 ]
        echo 'Mirrorlist update completed.'
      else
        read -l UP -P 'Mirrorlist update completed. Would you like to update now? [y/N] '
        switch $UP
          case Y y
            update
        end
      end
    else
      echo 'An error occurred whilst doing this. Restoring backup'
      sudo rm $MPATH
      sudo cp $MPATH.bak $MPATH
    end
  end
end
