#!/bin/bash

case "$1" in
    dfinstall)
	echo "Moving dotfiles to .dotfiles"
	cd ~
	mv dotfiles .dotfiles
	cd .dotfiles

	echo "Fetching DFM"
	git submodule update --init

	echo "Installing dotfiles"
	./dfm/dfm install

	echo "Forcing bash to reload using current bashrc"
	source ~/.bashrc
	;;

    dfupdate)
	echo "Updating dotfiles"
	git pull
	./dfm/dfm install
	source ~/.bashrc
	;;

    base)
	echo "Installing base packages"
	sudo apt-get install -y tmux htop byobu curl wget emacs vim
	;;

    gui)
	echo "Installing gui packages"
	sudo apt-get install -y arandr rxvt-unicode-256color ncurses-term fonts-inconsolata
	sudo cp urxvt/clipboard /usr/lib/urxvt/perl/clipboard
	;;

    fun)
	echo "Installing fun packages"
	sudo apt-get install -y cowsay fortune
	;;
  
    *)
	echo "Usage: $0 <dfinstall | dfupdate | base | gui | fun>"
	;;
esac
