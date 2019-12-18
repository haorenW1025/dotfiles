export LC_ALL=en_US.UTF-8
eval "$(starship init zsh)"
source /Users/wanghaoren/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /Users/wanghaoren/.zsh/completion.zsh
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/history.zsh 

ZSH_AUTOSUGGEST_STRATEGY=(history)

setopt auto_cd

zmodload -i zsh/complist

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

zstyle ':completion:*' menu select
_comp_options+=(globdots)

bindkey -v
bindkey "jk" vi-cmd-mode

# Highlight the current autocomplete option
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Better SSH/Rsync/SCP Autocomplete
zstyle ':completion:*:(scp|rsync):*' tag-order ' hosts:-ipaddr:ip\ address hosts:-host:host files'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

# Allow for autocomplete to be case insensitive
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
  '+l:|?=** r:|?=**'

# Initialize the autocompletion
autoload -Uz compinit && compinit -i

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[6 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.


export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:~/.cargo/bin/:/usr/local/share/dotnet/
alias g++="/usr/local/bin/g++-9"
alias gcc="/usr/local/bin/gcc-9"
set -o vi
export LSCOLORS="exfxcxdxbxexexabagacad"
alias tn='tmux new -s'
alias ta='tmux a -t'
alias td='tmux kill-session -t'
alias tl='tmux ls'
alias tar='tar zcvf'
alias untar='tar zxvf'
alias activate='source ~/env/bin/activate'
alias ls='ls -afG'
alias rm='rm -i'
alias l='colorls --group-directories-first --almost-all'
alias ll='colorls --group-directories-first --almost-all --long'
alias lt='colorls --tree'
alias vim='nvim'
alias code='cd ~/workplace'
alias tomofun='cd ~/tomofun'
alias verdigris='cd ~/Verdigris'
alias dot='cd ~/dotfiles'
eval "$(rbenv init -)"
source /usr/local/opt/nvm/nvm.sh
EDITOR='/usr/local/bin/nvim'
export EDITOR
