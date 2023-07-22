function paru-clean -d 'Clean paru/pacman cache and any unused packages'
  argparse -n paru-clean 'u/unused' -- $argv
    or return

  if set -q _flag_u
    echo 'Searching for unused packages...'
    paru -Qqdt 2>/tmp/outputbuffer

    if test $status -eq 0
      paru -Rns $(paru -Qqdt)
    else
      echo 'No orphaned packages to remove'
    end
  end

  read -l CPC -P 'Do you want to clean the pacman cache? [Y/n] '
  switch $CPC
    case Y y
      paru -Scc
  end

  read -l CFP -P 'Do you want to remove unused flatpaks [y/N] '
  switch $CFP
    case Y y
      flatpak uninstall --unused --noninteractive
  end
end
