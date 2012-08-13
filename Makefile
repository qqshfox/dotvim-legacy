.PHONY: all dirs submodules command-t update install clean

current_path=$(shell pwd)

all: dirs submodules command-t

dirs:
	mkdir -p vimundo vimbak vimswp

submodules:
	git submodule sync
	git submodule update --init --recursive

command-t: submodules
	cd bundle/Command-T/ruby/command-t && ruby extconf.rb && make

update: submodules command-t

install: all
	ln -sf ${current_path} ~/.vim
	ln -sf ~/.vim/vimrc ~/.vimrc
	ln -sf ~/.vim/bundle/vim-nerdtree-tabs/nerdtree_plugin/vim-nerdtree-tabs.vim ~/.vim/bundle/nerdtree/nerdtree_plugin/

clean:
	rm -rf vimundo vimbak vimswp viminfo vim_mru_files
	[ -h ~/.vim ] && rm -f ~/.vim
	[ -h ~/.vimrc ] && rm -f ~/.vimrc
