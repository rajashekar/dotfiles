# Make sure you are in dotfiles folder

# Copy emacs
cp ~/.emacs.d/init.el emacs.d/init.el
cp ~/.emacs.d/config.org emacs.d/config.org
cp -R ~/.emacs.d/snippets emacs.d/
cp -R ~/.emacs.d/utils emacs.d/

# Copy vim 
cp ~/.vimrc vim/vimrc
cp ~/.vundleplugins.vim vim/vundleplugins.vim
cp -R ~/.vim/UltiSnips vim/

# Copy nvim
cp -R ~/.config/nvim/ nvim/

# Copy kitty
cp ~/.config/kitty/kitty.conf kitty/kitty.conf

# Copy Alacritty
cp -R ~/.config/alacritty/alacritty.yml alacritty/alacritty.yml

# Copy tmux
cp ~/.tmux.conf tmux/tmux.conf

# Copy zsh
cp ~/.zshrc zshrc
