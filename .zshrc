HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e

zstyle :compinstall filename '/home/drvilepis/.zshrc'

autoload -Uz compinit
compinit
set -o promptsubst

# Set promt
export PS1='%B%1~ %(!.! .)%b '

# Set aliases
alias ls=exa
alias dots="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
