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
alias nvimdiff="nvim -d"
alias tempdir='cd $(mktemp -d)'
alias clip="xclip -sel clip"
alias oclip="xclip -sel clip -o"
alias brute="s6-softlimit -m 10737418240"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(zoxide init zsh --cmd cd)"

PATH=$PATH:/home/drvilepis/.cabal/bin
export GPG_TTY=$(tty)
if [[ -n "$SSH_CONNECTION" ]] ;then
    export PINENTRY_USER_DATA="USE_CURSES=1"
fi
