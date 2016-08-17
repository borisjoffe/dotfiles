#!/bin/bash

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
HISTFILESIZE=10000000
HISTSIZE=10000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# cd into directory when typing it
shopt -s autocd

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#xterm-color)
 #  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
 #  ;;
#*)
 #  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
  # ;;
#esac

function source-if-exists () {
	local f=${1?source-if-exists requires an argument}
	[ -n "$DBG" ] && echo "source-if-exists: $f"
	[ -f "$f" ] && source "$f"
}

function parse_git_branch () {
	#git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
	echo " "`git rev-parse --symbolic-full-name --abbrev-ref HEAD`| grep -v fatal | grep -v master$
	#ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
	#echo "("${ref#refs/heads/}")"
}

#PS1='[\t \u@\H \W]\$ '

#TEAL="\033[0;36m\]"
#BOLD="\033[0;1m\]"
#NONE="\033[0m\]"
#TIME1="\t"
#TIME2=${TIME1:0:2}
export PS1="\[\033[0;96m\][\[\033[0m\]\[\033[0;1m\]\u:\w\[\033[0;96m\]]\$(parse_git_branch)\$\[\033[0m\] "

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
#	TODO  - what about screen term
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #ealias dir='ls --color=auto --format=vertical'
    #ealias vdir='ls --color=auto --format=long -h'
fi

source ~/.shellrc
ealias rr='source ~/.bashrc'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
complete -C '/usr/local/bin/aws_completer' aws
