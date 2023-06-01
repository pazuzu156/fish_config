function vkmultiremove -d 'Recursively remove dxvk and vkd3d in a prefixes directory'
  argparse -n vkmultiremove 'p/prefixes=' -- $argv
    or return

  if set -q _flag_p
    set -l PREFIXES_PATH $_flag_p'/'

    for i in $PREFIXES_PATH/*
      if test -d $i'/drive_c'
        echo 'Removing dxvk and vkd3d in prefix: ' $i
        vkremove -p $i
      end
    end
  else
    echo 'No prefixes path was given!'
  end
end
