function update-full -d 'Perform a full system upgrade'
  # run update
  echo 'Performing a full system upgrade...'
  update

  # rebuild ramfs
  echo 'Building ramfs...'
  sudo mkinitcpio -P

  # reinstall grub
  echo 'Reinstalling GRUB...'
  grub-reinstall

  # reboot system
  read -l REB -P 'Do you need to reboot after this update? [Y/n] '
  switch $REB
    case Y y
      sudo reboot
  end
end