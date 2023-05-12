function vkremove -d 'Remove vkd3d and dxvk from a wine prefix'
  argparse -n vkremove 'p/prefix' -- $argv

  if set -q _flag_p
    # get wine system directory, and split it to get the architecture system directory
    set -l WINESYSDIR (WINEPREFIX=$argv winepath -u c:\\windows\\system32 2> /dev/null)
    set -l WSD_ARCH (string split '/' $WINESYSDIR)

    # 32 and 64 bit nvngx locations
    set -l NVNGX_32 '/usr/lib/nvidia/wine'
    set -l NVNGX_64 '/usr/lib64/nvidia/wine'

    echo 'Detecting prefix architecture and copying nvngx dlls'

    if test "$WSD_ARCH[-1]" = "system32"
      ###
      # 32 bit prefix
      ###

      # Remove symlinks
      rm -v $WINESYSDIR/nvngx.dll
      rm -v $WINESYSDIR/_nvngx.dll
    else if test "$WSD_ARCH[-1]" = "syswow64"
      ###
      # 64 bit prefix
      ###

      set -l WINESYSDIR_32 (string replace 'syswow64' 'system32' "$WINESYSDIR")

      # Remove symlinks (32 bit)
      rm -v $WINESYSDIR_32/nvngx.dll
      rm -v $WINESYSDIR_32/_nvngx.dll

      # Remove symlinks (64 bit)
      rm -v $WINESYSDIR/nvngx.dll
      rm -v $WINESYSDIR/_nvngx.dll
    else
      echo 'Unknown prefix architecture. You might need to copy the files manually.'
    end

    echo 'Installing dxvk and vkd3d'
    WINEPREFIX=$argv setup_dxvk uninstall --symlink
    WINEPREFIX=$argv setup_dxvk_nvapi uninstall --symlink
    WINEPREFIX=$argv setup_vkd3d_proton uninstall --symlink
  else
    echo 'You need to set the wine prefix with -p'
  end
end
