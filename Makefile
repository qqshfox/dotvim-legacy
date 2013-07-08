.PHONY: all dirs update_taghightlight update_submodules submodules command-t update install clean_taghighlight clean YouCompleteMe

current_path=$(shell pwd)

all: dirs submodules command-t YouCompleteMe

dirs:
	mkdir -p vimundo vimbak vimswp

bundle/TagHighlight:
	hg clone https://bitbucket.org/abudden/taghighlight $@

update_taghightlight: bundle/TagHighlight
	hg pull -u bundle/TagHighlight

update_submodules:
	git submodule sync
	git submodule update --init --recursive

submodules: update_submodules bundle/TagHighlight

command-t: update_submodules
	cd bundle/Command-T/ruby/command-t && ruby extconf.rb && make

YouCompleteMe:
	cd bundle/YouCompleteMe && ./install.sh --clang-completer

update: update_submodules command-t update_taghightlight YouCompleteMe

install: all
	ln -sf ${current_path} ~/.vim
	ln -sf ~/.vim/vimrc ~/.vimrc
	ln -sf ~/.vim/bundle/vim-nerdtree-tabs/nerdtree_plugin/vim-nerdtree-tabs.vim ~/.vim/bundle/nerdtree/nerdtree_plugin/

clean_taghighlight:
	rm -rf bundle/TagHighlight

clean: clean_taghighlight
	rm -rf vimundo vimbak vimswp viminfo vim_mru_files
	[ -h ~/.vim ] && rm -f ~/.vim
	[ -h ~/.vimrc ] && rm -f ~/.vimrc
