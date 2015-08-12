# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory autocd
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/boris/.zshrc'

autoload -Uz compinit && compinit
# End of lines added by compinstall

# The following lines were added by boris
bindkey "5D" backward-word
bindkey "5C" forward-word

# ALIASES
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'

alias rm='rm -i'
alias mv='mv -iv'
alias cp='cp -i'
alias cppreserve='cp -i --preserve=mode,ownership,timestamps,links'

alias grep='grep --color'
alias grep2='grep --color -d skip'

alias e='vim'
alias vi='vim'
alias g='git'

alias pacman='pacmatic'
alias pacmann='pacmatic --needed'

# download this page and all pages one level down including all resources (do not make host directories)
alias downloadPageOneLevel='wget -nH -k -p -r -l 1'

alias lm='lastmod.sh'
alias rr='. ~/.zshrc'

# GUI programs
#alias bitcoin-qt='bitcoin-qt -datadir=/data/bitcoin'
alias term='runsilent urxvt'
alias fm='runsilent pcmanfm'
alias ff='runsilent firefox'
alias chrome='runsilent chromium'
alias opera='runsilent opera'

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

export PATH="$PATH:/home/boris/bin"
# add android tools later: /data/android/android-sdk-linux/tools:/data/android/android-sdk-linux/platform-tools
# don't use tizen or heroku anymore: /usr/local/heroku/bin:/home/boris/code/tizen-sdk/tools
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
