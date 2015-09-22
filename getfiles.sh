#!/bin/bash
SCRIPT_DIR=`pwd`

# temporarily removed bashrc - restore from backup later
cp ~/.{bashrc,screenrc,vimrc,zshrc,tmux*.conf,xbindkeysrc,Xresources,xinitrc} .
cd $HOME
cp --parents .config/openbox/rc.xml $SCRIPT_DIR
cp --parents .config/fish/{functions/,}*.fish $SCRIPT_DIR

#cp -R ~/.vim/ .
