#!/bin/bash
SCRIPT_DIR=`pwd`

cp -u -R ~/.{*aliases,shellrc,bashrc,screenrc,vimrc,zsh*,tmux*.conf,xbindkeysrc,Xresources*,xinitrc,tidyrc,editorconfig,gitconfig,gitignore.global} .
cd $HOME
cp -u --parents .config/openbox/rc.xml $SCRIPT_DIR
cp -u --parents .config/fish/{functions/,}*.fish $SCRIPT_DIR
fish -c 'abbr -s > .config/fish/fish-abbr.fish' &

#cp -R ~/.vim/ .
