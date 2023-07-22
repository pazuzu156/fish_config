function update --description 'Perform a quick update'
  read -l MIRRORS -P 'Do you want to update the mirrorlist first? [Y/n] '
  switch $MIRRORS
    case Y y
      mirrors -n
  end

  sudo pacman -Syu --noconfirm

  read -l UPDAUR -P 'Update AUR packages? [y/N] '
  switch $UPDAUR
    case Y y
      paru -Sua
  end

  # read -P 'Press [ENTER] to quit'

  # update system
  # yay --answerdiff None --answerupgrade Repo --answeredit None --answerclean All --batchinstall -Syu
  # upgrade flatpaks
  # flatpak update --noninteractive
end