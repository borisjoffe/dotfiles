#!/bin/bash
SCRIPT_DIR=`pwd`

# temporarily removed bashrc - restore from backup later
cp ~/.{aliases,shellrc,bashrc,screenrc,vimrc,zshrc,tmux*.conf,xbindkeysrc,Xresources*,xinitrc} .
cd $HOME
cp --parents .config/openbox/rc.xml $SCRIPT_DIR
cp --parents .config/fish/{functions/,}*.fish $SCRIPT_DIR
fish -c 'abbr -s > .config/fish/fish-abbr.fish'

#cp -R ~/.vim/ .
