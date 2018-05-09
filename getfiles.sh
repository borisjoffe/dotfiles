#!/usr/bin/zsh

set -ueo pipefail

DBG=${DBG:-}

SCRIPT_DIR=`pwd`

cd $HOME

typeset -a dotfiles
dotfiles=(
	.*aliases
	.shellrc
	.bashrc
	.screenrc
	.vimrc
	.zsh*
	.*.zsh
	.shell/
	.tmux*.conf
	.xbindkeysrc*
	.Xresources*
	.xinitrc
	.tidyrc
	.*editorconfig
	.jshintrc
	.eslintrc*
	.gitconfig
	.gitignore.global
	.ackrc
	.agignore
	.npm_lazy.config.js
	.npmrc
	.mongorc.js
	.env
	.tmuxp
	.noderc.js
	.gtkrc-2.0*
	.rsyncignore

	.config/fish/{functions/,}*.fish
	.config/openbox/rc.xml
	.config/flake8
	.config/redshift.conf
	.config/lxpanel/default/
	.config/zim/
	.config/i3/
	.config/youtube-dl/
	.i3status.conf
)

#echo $dotfiles
#cp -u -R "$HOME/$dotfiles" $SCRIPT_DIR

for dotfile in $dotfiles; do
	[ -n "$DBG" ] && echo "Copying $dotfile"
	cp -u --parents -R $dotfile $SCRIPT_DIR
done;

cp -u /etc/systemd/system/suspend@boris.service dev/dotfiles/systemd/

#cp -u --parents .config/openbox/rc.xml $SCRIPT_DIR
#cp -u --parents .config/flake8 $SCRIPT_DIR
#cp -u --parents .config/redshift.conf $SCRIPT_DIR
#cp -R -u --parents .config/lxpanel/default/ $SCRIPT_DIR
#cp -R -u --parents .config/zim/ $SCRIPT_DIR
#cp -R -u --parents .config/i3/ $SCRIPT_DIR

#cp -u --parents .config/fish/{functions/,}*.fish $SCRIPT_DIR
fish -c 'abbr -s > .config/fish/fish-abbr.fish' &

#cp -R ~/.vim/ .
