function winege
  argparse -n winege 'v/version' -- $argv
  set -l PROTON_ENABLE_NVAPI 1
  set -l DXVK_ENABLE_NVAPI 1
  set -l PROTON_HIDE_NVIDIA_GPU 1
  set -l VKD3D_CONFIG dxr11

  set -l WINE_BASE $HOME/.config/heroic/tools/wine
  set -l WINE null

  if set -q _flag_v
    test -d "$WINE_BASE/$argv"
      and set WINE "$WINE_BASE/$argv"
      or test -d "$WINE_BASE/Wine-GE-Proton$argv"
        and set WINE "$WINE_BASE/Wine-GE-Proton$argv"
        or echo "That version of wine couldn't be found!"

    echo $WINE
#     if test -d "$WINE_BASE/Wine-GE-Proton$argv"
#       set WINE "$WINE_BASE/Wine-GE-Proton$argv"
#     else
#       echo 'That version of wine couldn\'t be found!'
#     end
  else
    echo 'Please specify a wine version!'
  end
end
