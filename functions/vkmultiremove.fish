function vkmultiremove -d 'Recursively remove dxvk and vkd3d in a prefixes directory'
  argparse -n vkmultiremove 'n/nvidia' 'p/prefixes=' -- $argv
    or return

  set -l USE_NVIDIA 0

  if set -q _flag_n
    set USE_NVIDIA 1
  end

  if set -q _flag_p
    set -l PREFIXES_PATH $_flag_p'/'

    for i in $PREFIXES_PATH/*
      if test -d $i'/drive_c'
        echo 'Removing dxvk and vkd3d in prefix: ' $i
        if test $USE_NVIDIA -gt 0
          vkremove -n -p $i
        else
          vkremove -p $i
        end
      end
    end
  else
    echo 'No prefixes path was given!'
  end
end
