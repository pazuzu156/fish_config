function grub-edit -d 'Edit grub config and rebuild it'
  v -s /etc/default/grub
  grub-build
end