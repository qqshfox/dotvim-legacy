all: dirs submodules command-t

dirs:
	mkdir -p vimundo vimbak vimswp

submodules:
	git submodule update --init --recursive

command-t: submodules
	cd bundle/Command-T && bundle install && rake make

install: all
	ln -sf ~/.vim/vimrc ../.vimrc

clean:
	rm -rf vimundo vimbak vimswp
