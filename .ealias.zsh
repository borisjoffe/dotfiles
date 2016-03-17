#!/usr/bin/zsh

### Fish-style abbr - ealiases
# Based on https://wiki.math.cmu.edu/iki/wiki/tips/20140625-zsh-expand-alias.html
typeset -a ealiases
ealiases=()

function ealias()
{
	alias $@
	ealiases+=(${@%%\=*})
}

function expand-ealias()
{
	if [[ $LBUFFER =~ "(^|[;|&])\s*(${(j:|:)ealiases})\$" ]]; then
		zle _expand_alias
		zle expand-word
	fi
	zle magic-space
}

function force-expand-ealias()
{
	zle _expand_alias
	zle expand-word
	zle magic-space
}

zle -N expand-ealias
zle -N force-expand-ealias

bindkey -M emacs ' '     expand-ealias
bindkey -M emacs '^\034'  force-expand-ealias # Ctrl-\ forces expansion (regardless of preceding chars - useful for global aliases)
bindkey -M emacs '^ '    magic-space     # control-space to bypass completion
bindkey -M isearch " "   magic-space # normal space during searches

ealias rea="source $0"
