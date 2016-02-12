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
fpath=(~/.zsh $fpath)

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
#bindkey "e[3~" delete-char
bindkey "^[[3~" delete-char
bindkey "^[[7~" beginning-of-line
bindkey "^[[1~" beginning-of-line # tmux
bindkey "^[[8~" end-of-line
bindkey "^[[4~" end-of-line # tmux

source "$HOME/.ealias.zsh"

source "$HOME/.aliases"
ealias rr='source ~/.zshrc'
source "$HOME/.shellrc"

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

autoload -U colors && colors
autoload -U promptinit && promptinit
autoload -U select-word-style && select-word-style bash #TODO: change to bash-style for Alt-Bksp and zsh-style for Ctrl-W

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

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/bin/aws_zsh_completer.sh
