all: dirs submodules command-t nerdtree-tabs

dirs:
	mkdir -p vimundo vimbak vimswp

submodules:
	git submodule update --init --recursive

command-t: submodules
	cd bundle/Command-T && bundle install && rake make

nerdtree-tabs: submodules
	ln -sf bundle/vim-nerdtree-tabs/nerdtree_plugin/vim-nerdtree-tabs.vim bundle/nerdtree/nerdtree_plugin/

install: all
	ln -sf ~/.vim/vimrc ../.vimrc

clean:
	rm -rf vimundo vimbak vimswp
