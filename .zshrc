################################################################################
# Runs only when you start an interactive shell.                               #
# Keep aliases, prompt setup, functions, completions, keybindings here.        #
# Environment variables only if they’re interactive-only                       #
################################################################################

autoload -U compinit && compinit
setopt prompt_subst
source /usr/local/opt/git/etc/bash_completion.d/git-prompt.sh
PROMPT=$'\n%F{magenta}╭─%f %F{cyan}%~%f%F{green}$(__git_ps1)%f\n%F{magenta}╰─>%f '

autoload -Uz compinit
compinit -C

# Optional: auto-compile the dump to speed future shells
if [[ -s ~/.zcompdump && (! -s ~/.zcompdump.zwc || ~/.zcompdump -nt ~/.zcompdump.zwc) ]]; then
    zcompile ~/.zcompdump
fi

export NVM_DIR="$HOME/.nvm"
nvm() {
    unset -f nvm
    # Load nvm only when first used
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
    nvm "$@"
}
# Load completion after first nvm load (optional)
_nvm_completion() {
    unset -f _nvm_completion
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] &&
        . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
}
# Hook: when completion system asks for nvm, load it once
compdef _nvm_completion nvm 2>/dev/null

# aliases
alias zshrc='nvim ~/.zshrc'
alias zshenv='nvim ~/.zshenv'
alias zprofile='nvim ~/.zprofile'
alias src='source ~/.zshrc && source ~/.zshenv && source ~/.zprofile'
alias ll='ls -lah'
alias config='cd ~/.config'
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
