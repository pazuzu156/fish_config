if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting ""
set -x EDITOR nvim

# source aliases file
source $HOME/.config/fish/aliases.fish

# Wine GE stuff
set -l GE_VERSION 8-8
fish_add_path --path $HOME/.config/heroic/tools/wine/Wine-GE-Proton$GE_VERSION/bin
set -e GE_VERSION

# Get a plasma session going on TTY login (not using ATM)
if test ! -n "$DISPLAY"
	#read -l SPS -P 'Need to start plasma? [Y/n] '
	#switch $SPS
    # Answered with a yes and no given session
    #case Y y
      # ask which session to start with
      # read -l SPS_TYPE -P 'Which one; X11[x] or Wayland[w]? '
      #switch $SPS_TYPE
      #case X x
      #          startx
	  #case W w
	  #   startplasma-wayland
	  #end
    # Answered with a yes and a session, just go ahead and launch the requested one
    #case YW yw Yw yW
    #      startplasma-wayland
      #case YX yx Yx yX
      #      startx
      #end
end
