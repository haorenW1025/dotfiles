# create config directory
mkdir -p ~/.config

# create symbolic link
DIR="$PWD/nvim"
ln -s -f ~/dotfiles/nvim ~/.config/nvim

