function vkmultisetup -d 'Recursively setup dxvk and vkd3d in a prefixes directory'
  argparse -n vkmultisetup 'p/prefixes=' -- $argv
    or return

  if set -q _flag_p
    set -l PREFIXES_PATH $_flag_p'/'

    for i in $PREFIXES_PATH/*
      if test -d $i'/drive_c'
        echo 'Setting up dxvk and vkd3d in prefix: ' $i
        vksetup -p $i
      end
    end
  else
    echo 'No prefixes path was given!'
  end
end
