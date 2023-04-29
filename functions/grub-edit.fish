function grub-edit -d 'Edit grub config and rebuild it'
  sudo nvim /etc/default/grub
  grub-build
end