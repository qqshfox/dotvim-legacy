.PHONY: all dirs submodules command-t nerdtree-tabs update install clean

all: dirs submodules command-t nerdtree-tabs

dirs:
	mkdir -p vimundo vimbak vimswp

submodules:
	git submodule sync
	git submodule update --init --recursive

command-t: submodules
	cd bundle/Command-T && bundle install && rake make

nerdtree-tabs: submodules
	ln -sf ~/.vim/bundle/vim-nerdtree-tabs/nerdtree_plugin/vim-nerdtree-tabs.vim ~/.vim/bundle/nerdtree/nerdtree_plugin/

update: submodules

current_path=$(shell pwd)
install: all
	ln -sf ${current_path} ~/.vim
	ln -sf ~/.vim/vimrc ~/.vimrc

clean:
	rm -rf vimundo vimbak vimswp
	rm -rf ~/.vim
	rm -rf ~/.vimrc
