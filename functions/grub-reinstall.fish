function grub-reinstall -d 'Full grub reinstall'
  # set efi_partition to the partition your EFI directory is located
  set -l efi_partition /dev/sde1

  sudo mount $efi_partition /boot/efi
  sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=ARCHLINUX
  grub-build
  sudo umount $efi_partition
end
