# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH



# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

unset rc

lastcmd() { LASTCMD=$(history 1 | cut -c8-); echo -ne "\e]2;$LASTCMD\a\e]1;$LASTCMD\a"; }
PROMPT_COMMAND=lastcmd
eval "$(starship init bash)"
eval "$(zoxide init bash)"

# Aliases
alias vi=nvim
alias vim=nvim
alias cd=z
alias ls="eza --icons=always"


alias dnfin="sudo dnf install"
alias dnfse="sudo dnf search"

alias pacin="sudo pacman -S"
alias pacre="sudo pacman -Rs"
alias yain="yay -S"
alias yare="yay -Rs"

alias ta="tmux attach-session"

alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


source ~/.profile
