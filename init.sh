# create config directory
mkdir -p ~/.config

# create symbolic link
DIR="${PWD}/nvim"
ln -s -f ${DIR} ~/.config/nvim

DIR="${PWD}/starship.toml"
ln -s -f ${DIR} ~/.config/starship.toml

DIR="${PWD}/tmux/.tmux.conf"
ln -s -f ${DIR} ~/.tmux.conf

DIR="${PWD}/tmux/.tmux.conf.local"
ln -s -f ${DIR} ~/.tmux.conf.local

DIR="${PWD}/tmux/.tmux.remote.conf"
ln -s -f ${DIR} ~/.tmux.remote.conf
