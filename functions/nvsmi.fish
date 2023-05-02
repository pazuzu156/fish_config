function nvsmi
  # Number of seconds to wait for. Default to 1
  argparse -n nvsmi 'w/wait' -- $argv
  
  set -l wait_time 1

  if set -q _flag_w
    set wait_time $argv
  end

  while true
    # clear screen
    clear
    nvidia-smi -q --display=power
    sleep $wait_time
  end
end
