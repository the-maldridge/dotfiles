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
	source ~/.bashrc
	;;

    *)
	echo "Usage: $0 <dfinstall | dfupdate>"
	;;
esac
