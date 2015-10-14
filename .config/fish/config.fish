#!/bin/fish

setenv SSH_ENV $HOME/.ssh/environment
set -gx PATH $PATH /data/anaconda3/bin /data/android/android-sdk-linux/tools/ /data/android/android-sdk-linux/platform-tools/
setenv ANDROID_HOME /data/android/sdk
setenv HTML_TIDY "$HOME/.tidyrc"
setenv pacman_program pacaur # make pacmatic use pacaur so you can get news and update AUR at the same time

ssh_agent_start
