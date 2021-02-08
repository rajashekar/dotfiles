
### copy tmux conf to home directory
cp tmux.conf ~/.tmux.conf

### make dir .dotfiles
mkdir -p  ~/.dotfiles/tmux

### copy theme
cp theme.sh ~/.dotfiles/tmux

### copy below to copy and paste from clipboard
brew install reattach-to-user-namespace

### make sure tpm is installed
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


