#!/bin/bash
SCRIPT_DIR=`pwd`

cp -u -R ~/.{*aliases,shellrc,bashrc,screenrc,vimrc,zsh*,tmux*.conf,xbindkeysrc,Xresources*,xinitrc,tidyrc,editorconfig,jshintrc,eslintrc,gitconfig,gitignore.global,ackrc,npm_lazy.config.js,npmrc,mongorc.js,env,tmuxp} .
cd $HOME
cp -u --parents .config/openbox/rc.xml $SCRIPT_DIR
cp -u --parents .config/flake8 $SCRIPT_DIR
cp -u --parents .config/fish/{functions/,}*.fish $SCRIPT_DIR
fish -c 'abbr -s > .config/fish/fish-abbr.fish' &

#cp -R ~/.vim/ .
