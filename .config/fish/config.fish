#!/bin/fish

setenv SSH_ENV $HOME/.ssh/environment
set -gx PATH $PATH /data/anaconda3/bin /data/android/android-sdk-linux/tools/ /data/android/android-sdk-linux/platform-tools/
setenv ANDROID_HOME /data/android/sdk
setenv HTML_TIDY "$HOME/.tidyrc"

ssh_agent_start
