#!/bin/bash

case "$1" in
    df)
	echo "Moving dotfiles to .dotfiles"
	cd ~
	mv dotfiles .dotfiles
	cd .dotfiles
	
	echo "Fetching DFM"
	git submodule init --update
	
	echo "Installing dotfiles"
	./dfm/dfm install
	
	echo "Forcing bash to reload using current bashrc"
	source ../.bashrc
	;;
	
    dfupdate)
	echo "Updating dotfiles"
	git pull
	./dfm/dfm install
	;;

    *)
	echo "Usage: $0 <dfinstall | dfupdate>"
	;;
esac