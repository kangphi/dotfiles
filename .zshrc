export PATH=/opt/homebrew/bin:$PATH
export PATH=/Users/philipp.kang/go/bin:$PATH
export PATH=/Users/philipp.kang/.local/bin:$PATH
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export PATH=/opt/homebrew/sbin:$PATH

alias vim=nvim

#alias git

alias gs="git status"
alias ga="git add --all"
alias gc="git commit -m"
alias gp="git pull"
alias gps="git push"

#alias general 
alias l="ls -lA --color "
alias cs="clear"

alias nix_rebuild='darwin-rebuild switch --flake ~/dotfiles/.config/nix#main'
alias nix_update='(cd ~/dotfiles/.config/nix && nix flake update)'
alias nix_edit='nvim ~/dotfiles/.config/nix/flake.nix'

eval "$(starship init zsh)"
