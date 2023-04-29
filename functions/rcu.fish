function rcu -d 'Run systemctl commands as user'
  systemctl --user $argv
end
