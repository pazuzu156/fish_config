function !! -d 'Get last run command'
  # function derived from sudope: https://github.com/oh-my-fish/plugin-sudope

  set -l opts 's/sudo'
  argparse -n !! $opts -- $argv
    or return

  set -l command_buffer (commandline)
  set -l cursor_position (commandline -C)

  if test -z "$command_buffer"
    set command_buffer $history[1]
  end

  if set -q _flag_s
    # set $return_command_buffer globally for use outside of this function (used with !!!)
    set -g return_command_buffer $command_buffer
  else
    commandline -r $command_buffer
  end
end