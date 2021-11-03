# Make sure you are in dotfiles folder

# Copy vim 
cp ~/.vimrc vim/vimrc
cp ~/.vundleplugins.vim vim/vundleplugins.vim

# Copy nvim
cp -R ~/.config/nvim/ nvim/

# Copy kitty
cp ~/.config/kitty/kitty.conf kitty/kitty.conf

# Copy Alacritty
cp -R ~/.config/alacritty/alacritty.yml alacritty/alacritty.yml
