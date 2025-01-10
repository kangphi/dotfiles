# Dotfiles

Repository for all the dotfiles and other configurations to setup a dev environment on MacOS.
Config is done with NixOS / Nix-Darwin to install all necessary packages, as well as brews and casks from homebrew.
Basic MacOS System Default will also be set, as well as the Apps that will appear in the dock.

### Caution
Its recommended to start with a new fresh installation of MacOS. Though it is possible to run this on an existing System,
Nix-Darwin will cleanup all Software and Packages that are not configured in the [flake.nix](https://github.com/kangphi/dotfiles/blob/main/.config/nix/flake.nix).

!! Path Configs in the ```.zshrc``` or ```config.fish``` must be updated if one wants to use everything !!

### Configs Included

Following configs are included: 

- basic ```.zshrc```
- Nix-Darwin Config
- Fish-Shell ```config.fish```
- Ghostty Terminal Emulator
- Starship for an awesome prompt
- Basic Neovim incl. LSPs etc


## Installation

Steps for installation

### Install MacOS Command Line tools 
```shell
xcode-select --install
```


### Check out Repo

Check out this repo into the $HOME Directory using Git
```shell
git clone git@github.com:kangphi/dotfiles.git
```

### Nix and Nix-Darwin

First make sure to install Nix on your System

```shell
$ sh <(curl -L https://nixos.org/nix/install)
```

Next step is to let Nix do its magic and execute the following command
```shell
darwin-rebuild switch --flake ~/dotfiles/.config/nix#main 
```
This will install all packages and also configure MacOS for you as per configuration in the flake.nix file.

### Stow And .Config

Now that all packages are installed we gotta use ```stow``` to create Symlinks from out dotfiles into out $HOME directory,
so that all our configs are actually applied to the installed software. 
```shell
cd ~/dotfiles && stow .
```

### Set default Shell to Fish (Optional)

I am using the fish-shell these days. In order to set it as default all that has to be done is to call these commands
```shell
which fish | sudo tee -a /etc/shells

chsh -s $(which fish)
```

### Add Stuff and Apply Changes
As well as in the ```.zshrc``` and the ```.config/fish/config.fish``` I provided command to easily update or extend the config.

```shell
# Rebuild and apply new config to system 
nix_rebuild

# Open the config file in Neovim
nix_edit

# Update the flake after changes
nix_update
```

## Quick References

- [NixOS](https://nixos.org/download/)
- [Nix-Darwin](https://github.com/LnL7/nix-darwin)
- [Nix Packages](https://search.nixos.org/packages)
- [Nix Option References](https://mynixos.com)
- [Nix Homebrew](https://github.com/zhaofengli/nix-homebrew)
- [GNU Stow](https://www.gnu.org/software/stow/)


## Upcoming Features
- Using the Nix-Homemanager to manage Dotfiles instead of Stow
- Extend config to be able to set up the same env on any Linux System