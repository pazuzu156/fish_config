function ramfs-edit -d 'Edit and build ramfs'
  sudo nvim /etc/mkinitcpio.conf
  sudo mkinitcpio -P
end