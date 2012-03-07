Hanfei Shen's dotvim files
==========================

Installation
------------

```sh
git clone https://github.com/qqshfox/dotvim.git ~/.vim
cd ~/.vim
make install
```

Dependencies
------------

* Vim 7.3
* Ruby and Vim 7.3 with ruby (optinal): Command-T and Lusty need this

Some plugins need
-----------------

* ack for ack.vim
* clang for clang_complete
* Exuberant Ctags 5.8 for AutoTag and Tagbar
* Exuberant Ctags head for Tagbar with Objective-C
* Git for vim-fugitive, gundo.vim and git-grep-vim
* Patched font for vim-powerline
* Erlang and rebar for vim-rebar
* RVM for vim-rvm
* virtualenv for vim-virtualenv
* Erlang for vimerl

Notice
------

* You should check whether the current ruby matches the vim before ```make install```, or vim will crash when you use Command-T.


Screenshots
-----------

![screenshot_macvim](https://raw.github.com/qqshfox/dotvim/master/img/screenshot_macvim.png)
![screenshot_vim](https://raw.github.com/qqshfox/dotvim/master/img/screenshot_vim.png)
