# prompt
autoload -U compinit && compinit
source ~/.git-prompt.sh
setopt PROMPT_SUBST
PS1='%F{blue}%1~%B%f%F{magenta}$(__git_ps1)%f %F{cyan}%#%f '
export PATH="$PATH:/usr/local/Cellar/openvpn/3.5.7/sbin:/usr/local/share/john:/usr/local/opt/openjdk/bin"


# alias
alias zrc='nvim ~/.zshrc'
alias src='source ~/.zshrc && source ~/.zshenv'
alias ll='ls -lah'
alias config='cd ~/.config'
alias rmp='vim ~/.config/nvim/lua/cgrace/remap.lua'
alias ovpn='sudo openvpn'
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cfgpush='cfg add -u && cfg commit -m "update dotfiles" && cfg push'
alias gst='git status'

# functions
function t {
    tmux a -t "$1"
}

# updates
alias updateall='brew upgrade neovim alacritty && rustup update'
