# prompt
autoload -U compinit && compinit
source ~/.git-prompt.sh
setopt PROMPT_SUBST
PS1='%F{yellow}%1~%B%f%F{cyan}$(__git_ps1)%f %F{red}%#%f '
export PATH="$PATH:/usr/local/Cellar/openvpn/3.5.7/sbin:/usr/local/share/john:/usr/local/opt/openjdk/bin"


# alias
alias zrc='nvim ~/.zshrc'
alias src='source ~/.zshrc && source ~/.zshenv'
alias ll='ls -lah'
alias config='cd ~/.config'
alias rmp='vim ~/.config/nvim/lua/cgrace/remap.lua'
alias ovpn='sudo openvpn'
alias t0='tmux attach -t 0'
alias t1='tmux attach -t 1'
alias t2='tmux attach -t 2'
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cfgpush='cfg commit -m "update dotfiles" && cfg push'
alias gst='git status'

# updates
alias updateall='brew upgrade neovim alacritty && rustup update'
