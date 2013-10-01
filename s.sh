#!/bin/bash

plugins="
https://github.com/vim-scripts/taglist.vim.git
https://github.com/vim-scripts/ActionScript-3-Omnicomplete.git
https://github.com/tpope/vim-fugitive.git
https://github.com/vim-scripts/The-NERD-Commenter.git
https://github.com/vim-scripts/Align.git
https://github.com/kien/ctrlp.vim.git
https://github.com/vim-scripts/a.vim.git
https://github.com/vim-scripts/DoxygenToolkit.vim.git
https://github.com/vim-scripts/AutoComplPop.git
https://github.com/nvie/vim-flake8.git
https://github.com/vim-scripts/errormarker.vim.git
https://github.com/Lokaltog/vim-powerline.git
https://github.com/tsaleh/vim-matchit.git
https://github.com/tpope/vim-surround.git

https://github.com/msanders/snipmate.vim.git
https://github.com/altercation/vim-colors-solarized.git
"
#https://github.com/tomtom/tlib_vim.git
#https://github.com/MarcWeber/vim-addon-mw-utils.git
#https://github.com/garbas/vim-snipmate.git

#https://github.com/hotoo/calendar-vim.git
#https://github.com/scrooloose/nerdtree.git
#https://github.com/vim-scripts/ActionScript-3-Omnicomplete.git
#https://github.com/MarcWeber/vim-addon-local-vimrc.git
#https://github.com/vim-scripts/DoxygenToolkit.vim.git

#https://github.com/vim-scripts/indentpython.vim.git

user=`whoami`

cd ~/.vim

# public variables

case $1 in

  # git clone repo and setup config
  install)
  if [ ! -e ~/.vimrc ]; then
    ln -s ~/.vim/vimrc ~/.vimrc
  fi
  for a in $plugins; do
    plugin=`basename $a | sed 's/.\{4\}$//'`
    if [ ! -d "bundle/$plugin" ]; then
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

  # update plugins
  update)
  echo "Updating plugins.."
  for a in bundle/*; do
    printf "%-30s: " $a
    cd "$a"
    git pull
    cd ../..
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

  # clone to other computer
  # ./s.sh clone user@192.168.123.114
  clone)
  shift
  if [ -z "$1"  ]; then
    echo Usage: `basename $0` clone user@host "(e.g. andreasschmid@192.168.123.114)"
    exit 1
  fi
  ssh $1 'if [ -d ~/.vim ]; then mv ~/.vim ~/.vim.$(date +%Y%m%d%H%M%S); fi; git clone https://github.com/kraeki/vimize.git ~/.vim && ~/.vim/s.sh install'
  ;;

  # pull from remote computer
  # ./s.sh pull user@192.168.123.114
  pull)
  shift
  if [ -z "$1"  ]; then
    echo Usage: `basename $0` pull user@host "(e.g. andreasschmid@192.168.123.114)"
    exit 1
  fi
  git clone ssh://$1/~/.vim ~/.vim
  ;;

*)
  echo "That option is not recognized"
  ;;

esac

