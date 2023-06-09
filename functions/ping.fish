function ping -d 'Ping Arch site'
  argparse -n ping 'c/count' -- $argv
    or return

  set -l count 3
  set -l server archlinux.org

  if set -q _flag_c
    if test -n "$argv[1]"
      set count $argv[1]
    end

    if test -n "$argv[2]"
      set server $argv[2]
    end

    test $count -gt 1
      and set -l times times
      or set -l times time
    
    echo "Pinging $server $count $times..."
    eval command ping -c $count $server
  else
    if test -n "$argv"
      set server $argv
    end

    echo "Pinging $server..."
    eval command ping $server
  end
end
