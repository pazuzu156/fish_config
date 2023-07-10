function vkremove -d 'Remove vkd3d and dxvk from a wine prefix'
  argparse -n vksetup 'n/nvidia' 'p/prefix=' -- $argv
    or return

  set -l WINESYSDIR
  set -l WSD_ARCH
  set -l PREFIX

  if set -q _flag_p
    if test -d $_flag_p/drive_c
      set WINESYSDIR (WINEPREFIX=$_flag_p winepath -u c:\\windows\\system32 2> /dev/null)
      set PREFIX $_flag_p
    else
      echo 'Given path is not a valid wine prefix!'

      return
    end
  else if test -d (pwd)/drive_c
    set WINESYSDIR (WINEPREFIX=(pwd) winepath -u c:\\windows\\system32 2> /dev/null)
    set PREFIX (pwd)
  else
    echo 'Current path is not a valid wine prefix!'

    return
  end

  if set -q _flag_n
    # get wine system directory, and split it to get the architecture system directory
    set -l WSD_ARCH (string split '/' $WINESYSDIR)

    # 32 and 64 bit nvngx locations
    set -l NVNGX_32 '/usr/lib32/nvidia/wine'
    set -l NVNGX_64 '/usr/lib64/nvidia/wine'

    # echo 'Detecting prefix architecture and copying nvngx dlls'

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
  end

  echo 'Removing dxvk and vkd3d'
  WINEPREFIX=$PREFIX setup_dxvk uninstall --symlink
  WINEPREFIX=$PREFIX setup_vkd3d_proton uninstall --symlink

  # nvapi
  if set -q _flag_n
    WINEPREFIX=$PREFIX setup_dxvk_nvapi uninstall --symlink
  end
end