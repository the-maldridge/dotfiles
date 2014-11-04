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
	exec bash
	;;

    dfupdate)
	echo "Updating dotfiles"
	git pull
	./dfm/dfm install
	exec bash
	;;

    base)
	echo "Installing base packages"
	sudo apt-get install -y tmux htop byobu curl wget emacs vim
	;;

    gui)
	echo "Installing gui packages"
	sudo apt-get install -y arandr
	;;

    fun)
	echo "Installing fun packages"
	sudo apt-get install -y cowsay fortune
	;;
  
    *)
	echo "Usage: $0 <dfinstall | dfupdate | base | gui | fun>"
	;;
esac
