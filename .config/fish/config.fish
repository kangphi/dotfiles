if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Clean up the fish Greeting
set fish_greeting


# ================================
# Custom Functions
# ================================

# Rebuild Nix-Darwin
function nix_rebuild
    darwin-rebuild switch --flake ~/dotfiles/.config/nix#main
end

# Update the nix flake
function nix_update
    cd ~/dotfiles/.config/nix && nix flake update
end

# Call this to edit the nix-darwin config
function nix_edit
    nvim ~/dotfiles/.config/nix/flake.nix
end

# ================================
# Exports and Paths
# ================================
set -gx PATH /opt/homebrew/bin /Users/pkang/go/bin /Users/pkang/.local/bin /opt/homebrew/sbin /Users/pkang/Library/Python/3.9/bin/ $PATH
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
alias bunup "brew bundle upgrade --file ~/dotfiles/.config/Brewfile --cleanup"
alias bucup "brew cu -af"
alias bup "brew update"
alias ytdown "yt-dlp -f bestaudio -x --audio-format mp3"

zoxide init fish | source
starship init fish | source
enable_transience
eval "$(/opt/homebrew/bin/brew shellenv)"

