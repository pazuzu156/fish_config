function yay-clean -d 'Clean yay/pacman cache and any unused packages'
  argparse -n yay-clean 'u/unused' -- $argv
    or return

  if set -q _flag_u
    echo 'Searching for unused packages...'
    yay -Qqdt 2>/tmp/outputbuffer

    if test $status -eq 0
      yay -Rns $(yay -Qqdt)
    else
      echo 'No orphaned packages to remove'
    end
  end

  read -l CPC -P 'Do you want to clean the pacman cache? [Y/n] '
  switch $CPC
    case Y y
      yay -Scc --noconfirm
  end

  read -l CFP -P 'Do you want to remove unused flatpaks [y/N] '
  switch $CFP
    case Y y
      flatpak uninstall --unused --noninteractive
  end
end
