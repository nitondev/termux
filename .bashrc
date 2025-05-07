export TERMUX=true
export EDITOR=nano
export GPG_TTY=$(tty)

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# aliases

alias update='apt update && apt upgrade -y'
alias install='apt install -y'
alias remove='apt remove -y'
alias search='apt search'
alias show='apt show'
alias clean='apt clean && apt autoclean && apt autoremove -y'

# git

alias gs='git status'
alias ga='git add .'
alias gc='git commit -S -m'
alias gp='git push'
alias gl='git pull'



alias bashrc="editor $HOME/.bashrc"

alias reload="source $HOME/.bashrc"

alias ssh-git="ssh -T git@github.com"

alias ll="ls -ag"

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

