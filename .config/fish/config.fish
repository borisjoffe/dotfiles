#!/bin/fish

setenv SOLARIZED 1
setenv SSH_ENV $HOME/.ssh/environment
setenv PATH $PATH $HOME/bin /data/android/android-sdk-linux/tools/ /data/android/android-sdk-linux/platform-tools/
setenv ANDROID_HOME /data/android/sdk
setenv HTML_TIDY "$HOME/.tidyrc"
setenv pacman_program pacaur # make pacmatic use pacaur so you can get news and update AUR at the same time

# Set universal vars here to prevent being overwritten
# due to hostname bug: https://github.com/fish-shell/fish-shell/issues/183
set -U fish_greeting ""

# Use below to re-import abbreviations:
# source ~/code/dotfiles/.config/fish/fish-abbr.fish

ssh_agent_start

# OPAM Configuration - doesn't work - TODO: fix
. /home/boris/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true
