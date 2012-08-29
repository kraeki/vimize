#!/bin/bash

plugins="
	https://github.com/vim-scripts/taglist.vim.git
"
  #https://github.com/hotoo/calendar-vim.git
  #https://github.com/scrooloose/nerdtree.git
  #https://github.com/vim-scripts/ActionScript-3-Omnicomplete.git
  #https://github.com/tpope/vim-fugitive.git
  #https://github.com/MarcWeber/vim-addon-local-vimrc.git
  #https://github.com/vim-scripts/DoxygenToolkit.vim.git
  #https://github.com/vim-scripts/The-NERD-Commenter.git

  #https://github.com/vim-scripts/indentpython.vim.git

cd ~/.vim

# public variables

case $1 in

# git clone repo and setup config
install)
	for a in $plugins; do
		plugin=`basename $a | sed 's/.\{4\}$//'`
		if [ ! -d bundle/$plugin ]; then
			# clone repo	
			echo clone $a
			cd bundle
			git clone $a
			cd -

			# create config folder
			mkdir -p config/$plugin	
		fi
	done
;;

# remove plugin
remove)
	for a in $plugins; do
		plugin=`basename $a | sed 's/.\{4\}$//'`
		#if [ -d bundle/$plugin ]; then
			echo remove "bundle/$plugin"
			rm -rf bundle/$plugin 
		#fi
	done
;;

# remove plugin inclusive config
purge)
	for a in $plugins; do
		plugin=`basename $a | sed 's/.\{4\}$//'`
 	#if [ -d bundle/$plugin ]; then
			rm -rf bundle/$plugin 
			echo removed "bundle/$plugin"
			rm -rf config/$plugin
			echo removed config "config/$plugin"
 	#fi
	done
;;

*)
	echo "That option is not recognized"
;;

esac

