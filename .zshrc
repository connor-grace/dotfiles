export PATH="/usr/local/Cellar/openvpn/3.5.7/sbin:$PATH"
export PATH="/usr/local/share/john:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
#export PATH="/Users/cgrace/dev/tools/zig-macos-x86_64-0.14.0-dev:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export HOMEBREW_NO_AUTO_UPDATE=1

# prompt
autoload -U compinit && compinit
source ~/.git-prompt.sh
setopt PROMPT_SUBST
PS1='%F{cyan}%1~%B%f%F{magenta}$(__git_ps1)%f %F{yellow}>%f '

# aliases
alias zrc='nvim ~/.zshrc'
alias src='source ~/.zshrc && source ~/.zshenv && tmux source-file ~/.config/tmux/tmux.conf'
alias ll='ls -lah'
alias config='cd ~/.config'
alias rmp='vim ~/.config/nvim/lua/cgrace/remap.lua'
alias ovpn='sudo openvpn'
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cfgpush='cfg add -u && cfg commit -m "update dotfiles" && cfg push'
alias gst='git status'

# functions
function t() {
    tmux a -t "$1"
}

function push() {
    git add . && git commit -m "$1" && git push
}
