#!/bin/bash

plugins="
	https://github.com/vim-scripts/taglist.vim.git
  https://github.com/hotoo/calendar-vim.git
  https://github.com/scrooloose/nerdtree.git
  https://github.com/vim-scripts/ActionScript-3-Omnicomplete.git
  https://github.com/tpope/vim-fugitive.git
  https://github.com/MarcWeber/vim-addon-local-vimrc.git
  https://github.com/vim-scripts/DoxygenToolkit.vim.git
  https://github.com/vim-scripts/The-NERD-Commenter.git
"
  #https://github.com/vim-scripts/indentpython.vim.git

cd ~/.vim

# public variables
vimrc_bundle_path=".vimrc_bundle"

# functions
function configure 
{
	echo "" > $vimrc_bundle_path
	for a in $plugins; do
		if [ -d bundle/$plugin ]; then
			plugin=`basename $a | sed 's/.\{4\}$//'`
			if [ -f config/$plugin/vimrc ]; then
				echo found vimrc for plugin $plugin
				echo \" vimrc $plugin >> $vimrc_bundle_path
				echo "source ~/.vim/config/$plugin/vimrc" >> $vimrc_bundle_path
			fi
		fi
	done
}

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

			# setup config
			mkdir -p config/$plugin	
      if [ ! -f config/$plugin/vimrc ]; then
        touch config/$plugin/vimrc
      fi
		fi
	done
	configure
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
	configure
;;

# remove plugin inclusive config
#purge)
#	for a in $plugins; do
#		plugin=`basename $a | sed 's/.\{4\}$//'`
		#if [ -d bundle/$plugin ]; then
#			echo remove "bundle/$plugin"
#			rm -rf bundle/$plugin 
#			echo remove config "config/$plugin"
#			rm -rf config/$plugin
		#fi
#	done
#	configure
#;;

# source vimrc files
configure)
	configure
;;

*)
	echo "That option is not recognized"
;;

esac

