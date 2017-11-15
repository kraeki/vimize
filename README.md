vimize
======

Manage your `'.vim'` with ease.  In practical terms, vimize
makes it super easy to install plugins and runtime files in their own
private directories.

Installation
------------

```
git clone https://github.com/kraeki/vimize.git ~/.vim

cd ~/.vim

git submodule update --init --recursive

ln -s ~/.vim/vimrc ~/.vimrc
```

YouCompleteMe
--------------------------------
```
cd pack/programming/start/YouCompleteMe
python3 install.py --clang-completer
```

Add new plugin
--------------------------------

```
# add
git submodule add <url> pack/<catecory>/

# edit configuration
config/<category>/<plugin_name>.vimrc
```

License
-------

Copyright (c) kraeki.  Distributed under the same terms as Vim itself.
