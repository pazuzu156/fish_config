function !!! -d 'Append or strip sudo from last run command'
  # function derived from sudope: https://github.com/oh-my-fish/plugin-sudope

  # call the repeat function but with the sudo flag
  !! -s

  set -l command_buffer $return_command_buffer
  set -l cursor_position (commandline -C)

  # clear return_command_buffer
  set -ge return_command_buffer

  if test -z "$command_buffer"
    set command_buffer $history[1]
  end

  set -l command_parts (string match -ir '^(\s*)(sudo(\s+|$))?(.*)' $command_buffer[1])
  set -l command_lines_count (count $command_buffer)
  test $command_lines_count -gt 1
    and set -l command_rest $command_buffer[2..$command_lines_count]

  switch (count $command_parts)
    case 3
      # no sudo
      commandline -r (string join \n (string join '' $command_parts[2] 'sudo ' $command_parts[3]) $command_rest)
    case 5
      # sudo
      commandline -r (string join \n (string join '' $command_parts[2 5]) $command_rest)
  end
end