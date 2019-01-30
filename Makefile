$(HOME)/.agignore:
	ln -sf `pwd`/agignore ~/.agignore

$(HOME)/.gitconfig:
	ln -sf `pwd`/gitconfig ~/.gitconfig

$(HOME)/.gitignore:
	ln -sf `pwd`/gitignore ~/.gitignore

$(HOME)/.tmux.conf:
	ln -sf `pwd`/tmux.conf ~/.tmux.conf

$(HOME)/.zshrc:
	ln -sf `pwd`/zshrc ~/.zshrc

$(HOME)/.config/nvim/: 
	mkdir -p ~/.config/nvim/
	ln -sf `pwd`/init.vim ~/.config/nvim/init.vim
	mkdir -p ~/.config/nvim/autoload
	ln -sf `pwd`/util.vim ~/.config/nvim/autoload/util.vim
