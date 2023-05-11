if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting ""

set -x EDITOR nvim
abbr -a ycu yay-clean -u
abbr -a neo neofetch
abbr -a yc yay-clean
abbr -a :q exit
abbr -a x startx
abbr -a w startw
abbr -a bt bpytop
abbr -a cls clear
abbr -a vs v -s $argv

# spotifyd
abbr -a enspot spot enable
abbr -a disspot spot disable

# baloo
abbr -a enbaloo balooctl enable
abbr -a disbaloo balooctl disable

# vksetup
abbr -a vks vksetup -p $argv
abbr -a vkr vkremove -p $argv
abbr -a vkms vkmultisetup -p $argv
abbr -a vkmr vkmultiremove -p $argv

# Get a plasma session going on TTY login
if test ! -n "$DISPLAY"
  read -l SPS -P 'Need to start plasma? [Y/n] '
  switch $SPS
    # Answered with a yes and no given session
    case Y y
      # ask which session to start with
      read -l SPS_TYPE -P 'Which one; X11[x] or Wayland[w]? '
      switch $SPS_TYPE
        case X x
          startx
        case W w
          startplasma-wayland
      end
    # Answered with a yes and a session, just go ahead and launch the requested one
    case YW yw Yw yW
      startplasma-wayland
    case YX yx Yx yX
      startx
  end
end
