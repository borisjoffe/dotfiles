#!/bin/fish

# identify fish shell when running in bass
set -gx FISH true

set fish_function_path $fish_function_path $HOME/.config/fish/plugin-foreign-env/functions
bass source ~/.env > /dev/null
source ~/bin/solarized-switch.fish 1

# Set universal vars here to prevent being overwritten
# due to hostname bug: https://github.com/fish-shell/fish-shell/issues/183
set -U fish_greeting ""

#set -U LANG en-US.UTF-8
#set -U LC_ALL en-US.UTF-8

# Use below to re-import abbreviations:
# source ~/code/dotfiles/.config/fish/fish-abbr.fish

ssh_agent_start

# OPAM Configuration - Manually fixed PATH and MANPATH in ~/.opam/opam-init/variables.fish
#source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true

# Path to Oh My Fish install.
set -gx OMF_PATH $HOME/.local/share/omf

# Customize Oh My Fish configuration path.
set -gx OMF_CONFIG $HOME/.config/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish
