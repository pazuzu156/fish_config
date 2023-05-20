function winege -d 'Run a wine GE tool on a given prefix'
  argparse -n winege 'v/version=' 'p/prefix=' -- $argv
    or return

  set -l WINE_BASE $HOME/.config/heroic/tools/wine
  set -l WINE
  set -l PREFIX

  # get prefix, else assume current directory is prefix
  if set -q _flag_p
    if test -d "$_flag_p/drive_c"
      set PREFIX "$_flag_p"
    else
      echo "$_flag_p is not a valid wine prefix!"

      return
    end
  else
    set PREFIX (pwd)
  end

  if set -q _flag_v
    if test -d "$WINE_BASE/$_flag_v"
      set WINE "$WINE_BASE/$_flag_v"
    else if test -d "$WINE_BASE/Wine-GE-Proton$_flag_v"
      set WINE "$WINE_BASE/Wine-GE-Proton$_flag_v"

      PROTON_ENABLE_NVAPI=1 DXVK_ENABLE_NVAPI=1 PROTON_HIDE_NVIDIA_GPU=0 VKD3D_CONFIG=dxr11 WINEPREFIX=$PREFIX $WINE/bin/$argv
    else
      echo "That version of wine couldn't be found!"

      return
    end
  else
    printf "%s\n\n" "List of wine versions:"

    for i in $WINE_BASE/*
      if test -d $i
        set -l V (string split '/' $i)
        echo $V[-1]
      end
    end
  end
end
