#!/bin/fish

set fish_function_path $fish_function_path $HOME/.config/fish/plugin-foreign-env/functions
fenv source $HOME/.env

# Set universal vars here to prevent being overwritten
# due to hostname bug: https://github.com/fish-shell/fish-shell/issues/183
set -U fish_greeting ""

# Use below to re-import abbreviations:
# source ~/code/dotfiles/.config/fish/fish-abbr.fish

ssh_agent_start

# OPAM Configuration - doesn't work - TODO: fix
source /home/boris/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true
