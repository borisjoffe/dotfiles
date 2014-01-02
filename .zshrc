# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=10000
setopt autocd
unsetopt beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/boris/.zshrc'

# The following lines were added by boris
bindkey "5D" backward-word
bindkey "5C" forward-word

alias rm='rm -i'
alias mv='mv -iv'
alias cp='cp -i'
alias bitcoin-qt='bitcoin-qt -datadir=/data/bitcoin'

bindkey -e

export PATH="$PATH:/home/boris/bin:/data/android-sdk-linux/tools:/data/android-sdk-linux/platform-tools:/usr/local/heroku/bin:/home/boris/code/tizen-sdk/tools"
#export TIZEN_SDK_HOME=~/code/tizen-sdk

autoload -Uz compinit
compinit
# End of lines added by compinstall

#PROMPT='%~ %M%% '
#autoload -U promptinit && promptinit
autoload -U colors && colors
#\$(parse_git_branch)
#export PS1=$'\e[0;96m[\e[0m\e[0;1m'$(pwd)$':'$(uname -n)$'\e[0m '
BLUE="%{$(tput setaf 166)%}"
RESET="%{$(tput sgr0)%}"
export PS1="%{$fg_bold[cyan]%}%~ %M%%%{$reset_color%} "
#export PS1=$'\e[0;96m%~ %M%%\e[0m '
#export PS1=$'\e[0;31m$ \e[0m'
