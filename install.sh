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

    packages)
	echo "Installing base packages"
	sudo apt-get install tmux htop byobu curl wget emacs vim

	echo "Installing frivilous packages"
	sudo apt-get install cowsay fortune
	;;

    *)
	echo "Usage: $0 <dfinstall | dfupdate | packages>"
	;;
esac
