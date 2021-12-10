HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
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
alias nterm="nvim term://zsh"
alias nvimdiff="nvim -d"
alias discord="discord --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

