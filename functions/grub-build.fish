function grub-build -d 'Build grub config'
  sudo grub-mkconfig -o /boot/grub/grub.cfg
end