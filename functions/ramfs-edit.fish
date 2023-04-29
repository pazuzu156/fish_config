function ramfs-edit -d 'Edit and build ramfs'
  v -s /etc/mkinitcpio.conf
  sudo mkinitcpio -P
end