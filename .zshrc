# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory autocd complete_aliases
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit && compinit
# End of lines added by compinstall

# http://superuser.com/questions/2127/what-zsh-features-do-you-use
# turn on spelling correction
setopt correct
# don't save duplicates in command history
setopt histignoredups
# don't allow accidental file over-writes
setopt noclobber
# Always pushd when changing directory
setopt auto_pushd
# Have pushd with no arguments act like `pushd $HOME'.
setopt PUSHD_TO_HOME

# The following lines were added by boris
bindkey "5D" backward-word
bindkey "5C" forward-word

# TODO: consolidate duplicate lines with bashrc

# ALIASES
alias c='clear'
alias r='reset'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias lsg='ll | grep -i'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias po='popd'

alias rm='rm -iv'
alias mv='mv -iv'
alias ln='ln -iv'
alias cp='cp -iv'
alias cppreserve='cp -r -i --preserve=mode,ownership,timestamps,links'
alias cppreservebackup='cp -r -i --backup=numbered --preserve=mode,ownership,timestamps,links'
alias cppreservebackupsrc='cp -r -i --backup=numbered -f --preserve=mode,ownership,timestamps,links'

alias grep='grep --color'
alias grepi='grep --color -i'
alias grep2='grep --color -d skip'

# http://zsh.sourceforge.net/Intro/intro_8.html
alias -g G='| grep'
alias -g Gi='| grep -i'
alias -g L='| less'

alias df='df -h'
alias free='free -h'
alias psg='ps aux| grep -i'
alias -g FDATE='date +%F' # date in the format YYYY-MM-DD

alias e='vim'
alias vi='vim'
alias g='git'

alias wifi='sudo iw dev wlan0'
alias wifiup='sudo ip link set wlan0 up'

alias pacman='pacmatic'
alias pacmann='pacmatic --needed'
alias pacaurn='pacaur --needed'
alias rh='rehash'

# download this page and all pages one level down including all resources (do not make host directories)
alias downloadPageOneLevel='wget -nH -k -p -r -l 1'

alias lm='lastmod.sh'
alias rr='. ~/.zshrc'
alias plates='python2.7 ~/bin/plates'	# update code for python3 later

# GUI programs
#alias bitcoin-qt='bitcoin-qt -datadir=/data/bitcoin'
alias term='runsilent urxvt'
alias fm='runsilent pcmanfm'
alias ff='runsilent firefox -no-remote'
alias chrome='runsilent chromium'
alias opera='runsilent opera'
alias rss='runsilent rssowl'
alias panel='runsilent lxpanel'

alias runxlock='nohup xautolock -detectsleep -nowlocker slock -time 10 -locker slock -notify 5 -notifier "xset dpms force off" -killtime 20 -killer "systemctl suspend" &'
alias lock='xautolock -locknow'

# Haskell flags
alias ghc='ghc -fwarn-incomplete-patterns -fwarn-name-shadowing'

git_prompt() {
 ref=$(git symbolic-ref HEAD | cut -d'/' -f3)
 echo \[$ref\]
}

function __prompt_git() {
        local git_dir ref br top;
        git_dir=$(git rev-parse --git-dir 2> /dev/null) || return
        ref=$(git symbolic-ref HEAD 2> /dev/null) || return
        br=${ref#refs/heads/}
        top=$(cat $git_dir/patches/$br/current 2>/dev/null) \
                  && top="/$top"
                  echo "[$br$top]"
}

export PATH="$PATH:$HOME/bin:$HOME/.gem/ruby/2.2.0/bin"
export EDITOR=vim
# add android tools later: /data/android/android-sdk-linux/tools:/data/android/android-sdk-linux/platform-tools
# don't use tizen or heroku anymore: /usr/local/heroku/bin:$HOME/code/tizen-sdk/tools
# export TIZEN_SDK_HOME=~/code/tizen-sdk

autoload -U colors && colors
autoload -U promptinit && promptinit

#PROMPT='%~ %M%% '
setopt prompt_subst
#\$(parse_git_branch)
#export PS1=$'\e[0;96m[\e[0m\e[0;1m'$(pwd)$':'$(uname -n)$'\e[0m '
BLUE="%{$(tput setaf 166)%}"
RESET="%{$(tput sgr0)%}"
export PS1="%{$fg_bold[cyan]%}%~ %M%%%{$reset_color%} "
export RPS1='%{$fg[yellow]%}$(__prompt_git) %{$reset_color%}%*'

#export PS1=$'\e[0;96m%~ %M%%\e[0m '
#export PS1=$'\e[0;31m$ \e[0m'

# cd and ls
cdl() {
	cd $1;
	shift;
	ls $@
}


# A shortcut function that simplifies usage of xclip.
# - Accepts input from either stdin (pipe), or params.
# From: http://madebynathan.com/2011/10/04/a-nicer-way-to-use-xclip/
# ------------------------------------------------
cb() {
  local _scs_col="\e[0;32m"; local _wrn_col='\e[1;31m'; local _trn_col='\e[0;33m'
  # Check that xclip is installed.
  if ! type xclip > /dev/null 2>&1; then
    echo -e "$_wrn_col""You must have the 'xclip' program installed.\e[0m"
  # Check user is not root (root doesn't have access to user xorg server)
  elif [[ "$USER" == "root" ]]; then
    echo -e "$_wrn_col""Must be regular user (not root) to copy a file to the clipboard.\e[0m"
  else
    # If no tty, data should be available on stdin
    if ! [[ "$( tty )" == /dev/* ]]; then
      input="$(< /dev/stdin)"
    # Else, fetch input from params
    else
      input="$*"
    fi
    if [ -z "$input" ]; then  # If no input, print usage message.
      echo "Copies a string to the clipboard."
      echo "Usage: cb <string>"
      echo "       echo <string> | cb"
    else
      # Copy input to clipboard
      echo -n "$input" | xclip -selection c
      # Truncate text for status
      if [ ${#input} -gt 80 ]; then input="$(echo $input | cut -c1-80)$_trn_col...\e[0m"; fi
      # Print status.
      echo -e "$_scs_col""Copied to clipboard:\e[0m $input"
    fi
  fi
}
# Aliases / functions leveraging the cb() function
# ------------------------------------------------
# Copy contents of a file
function cbf() { cat "$1" | cb; }
# Copy current working directory
alias cbwd="pwd | cb"
# Copy most recent command in bash history
alias cbhs="cat $HISTFILE | tail -n 1 | cb"


export LESS=-R

# turn off bold/blink/standout
export LESS_TERMCAP_me=$(printf '\e[0m')
# stop standout
export LESS_TERMCAP_se=$(printf '\e[0m')
# stop underline
export LESS_TERMCAP_ue=$(printf '\e[0m')
# blink
export LESS_TERMCAP_mb=$(printf '\e[1;32m')
# bold
#export LESS_TERMCAP_md=$(printf '\e[1;34m')
export LESS_TERMCAP_md=$(printf '\e[1;36m')
# underline
#export LESS_TERMCAP_us=$(printf '\e[1;32m')
# standout
export LESS_TERMCAP_so=$(printf '\e[1;44;1m')


#eval $(ssh-agent)
#ssh-add ~/.ssh/id_rsa
#ssh-add ~/.ssh/*
#source $HOME/run-gpg

#eval $(keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa)

# OPAM configuration
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
