function v -d 'Run NeoVim against a file or directory'
  argparse -n v 's/sudo' -- $argv
    or return

  if set -q _flag_s
    sudo nvim $argv
  else
    nvim $argv
  end
end
