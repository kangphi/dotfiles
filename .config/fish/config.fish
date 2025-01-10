if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

# ================================
# Exports and Paths
# ================================
set -gx PATH /opt/homebrew/bin /Users/philipp.kang/go/bin /Users/philipp.kang/.local/bin /opt/homebrew/sbin $PATH
set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml

# ================================
# History
# ================================
set -U fish_history_size 5000

# ================================
# Aliases
# ================================
alias vim "nvim"
alias gs "git status"
alias ga "git add --all"
alias gc "git commit -m"
alias gpl "git pull"
alias gps "git push"
alias ls "ls --color"
alias l "ls -lA --color"
alias c "clear"
alias cd "z"


zoxide init fish | source
starship init fish | source
enable_transience