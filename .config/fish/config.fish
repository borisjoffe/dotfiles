#!/bin/fish

setenv SOLARIZED 1
setenv SSH_ENV $HOME/.ssh/environment
setenv PATH $PATH $HOME/bin /data/android/android-sdk-linux/tools/ /data/android/android-sdk-linux/platform-tools/
setenv ANDROID_HOME /data/android/sdk
setenv HTML_TIDY "$HOME/.tidyrc"
setenv pacman_program pacaur # make pacmatic use pacaur so you can get news and update AUR at the same time

ssh_agent_start

# OPAM Configuration - doesn't work - TODO: fix
#. /home/boris/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true
