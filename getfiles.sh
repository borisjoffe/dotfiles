#!/bin/bash
SCRIPT_DIR=`pwd`

cp -R ~/.{aliases,shellrc,bashrc,screenrc,vimrc,zsh*,tmux*.conf,xbindkeysrc,Xresources*,xinitrc,tidyrc,editorconfig,gitconfig,gitignore.global} .
cd $HOME
cp --parents .config/openbox/rc.xml $SCRIPT_DIR
cp --parents .config/fish/{functions/,}*.fish $SCRIPT_DIR
fish -c 'abbr -s > .config/fish/fish-abbr.fish'

#cp -R ~/.vim/ .
