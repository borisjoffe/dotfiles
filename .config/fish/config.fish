#!/bin/fish

#setenv LANG en_US.UTF-8
#setenv LC_ALL en_US.UTF-8

set fish_function_path $fish_function_path $HOME/.config/fish/plugin-foreign-env/functions

bass source ~/.env > /dev/null

source ~/bin/solarized-switch.fish 1

# Set universal vars here to prevent being overwritten
# due to hostname bug: https://github.com/fish-shell/fish-shell/issues/183
set -U fish_greeting ""

# Use below to re-import abbreviations:
# source ~/code/dotfiles/.config/fish/fish-abbr.fish

ssh_agent_start

# OPAM Configuration - Manually fixed PATH and MANPATH in ~/.opam/opam-init/variables.fish
#source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true

# Path to Oh My Fish install.
#set -gx OMF_PATH $HOME/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG $HOME/.config/omf

# Load oh-my-fish configuration.
# Messes up PATH - TODO: fix
#source $OMF_PATH/init.fish

# These were set to '555 yellow' which is invisible in the terminal
#set -U fish_pager_color_description yellow
#set -U fish_color_autosuggestion yellow

if [ -f $HOME/.config/fish/login.fish ]
	# X login on tty1
	source $HOME/.config/fish/login.fish
end
