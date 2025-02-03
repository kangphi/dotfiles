{
  description = "Nix Darwin MacOS Setup Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      nix-homebrew,
    }:
    let
      configuration =
        { pkgs, config, ... }:
        {

          nixpkgs.config.allowUnfree = true;

          # List packages installed in system profile.
          environment.systemPackages = [
            pkgs.git
            pkgs.stow
            pkgs.neovim
            pkgs.mkalias
            pkgs.jdk8
            pkgs.jdk17
            pkgs.jdk23
            pkgs.kotlin
            pkgs.python314
            pkgs.maven
            pkgs.gradle
            pkgs.nodejs_23
            pkgs.dotnet-sdk_9
            pkgs.sqlite
            pkgs.nixfmt-rfc-style
            pkgs.fish
          ];

          # Homebrew casks to install
          homebrew = {
            enable = true;
            brews = [
              "mas"
              "starship"
              "zoxide"
              "go"
            ];
            casks = [
              "ghostty"
              "firefox"
              "the-unarchiver"
              "docker"
              "visual-studio-code"
              "steam"
              "discord"
              "google-chrome"
              "intellij-idea"
              "rider"
              "raycast"
              "microsoft-teams"
              "microsoft-outlook"
              "microsoft-word"
              "microsoft-excel"
              "onedrive"
              "blender"
              "github"
              "unity"
              "unity-hub"
              "chatgpt"
              "omnissa-horizon-client"
              "displaylink"
              "whatsapp"
            ];
            masApps = {
              "Dashlane" = 517914548;
              "KakaoTalk" = 869223134;
              "DropOver" = 1355679052;
            };

            # Deletes all casks and brews that are not defined here
            onActivation.cleanup = "zap";
            onActivation.autoUpdate = true;
            onActivation.upgrade = true;
          };

          # Install Fonts here
          fonts.packages = [
            pkgs.nerd-fonts.jetbrains-mono
          ];


          # Appls installed by Nix wont appear in Spotlight search. Therefore this is needed to create Sytem Aliases for apps
          system.activationScripts.applications.text =
            let
              env = pkgs.buildEnv {
                name = "system-applications";
                paths = config.environment.systemPackages;
                pathsToLink = "/Applications";
              };
            in
            pkgs.lib.mkForce ''
              # Set up applications.
              echo "setting up /Applications..." >&2
              rm -rf /Applications/Nix\ Apps
              mkdir -p /Applications/Nix\ Apps
              find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
              while read -r src; do
                app_name=$(basename "$src")
                echo "copying $src" >&2
                ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
              done
            '';

          # Set MacOS System Settings
          system.defaults = {

            # Dock
            dock.autohide = false;
            dock.tilesize = 50;
            dock.show-recents = false;
            dock.persistent-apps = [
              "/System/Applications/Launchpad.app"
              "/Applications/Safari.app"
              "/System/Applications/Messages.app"
              "/System/Applications/Mail.app"
              "/System/Applications/Calendar.app"
              "/System/Applications/Notes.app"
              "/Applications/WhatsApp.app"
              "/Applications/Ghostty.app"
              "/Applications/IntelliJ IDEA.app"
              "/Applications/Microsoft Teams.app"
              "/Applications/Microsoft Outlook.app"
            ];

            # Finder
            finder.FXPreferredViewStyle = "clmv";
            finder.NewWindowTarget = "Home";

            # Login Screen
            loginwindow.GuestEnabled = false;

            # Activate / Deactivate Control Center Icons
            controlcenter.BatteryShowPercentage = true;
            controlcenter.Bluetooth = true;
            controlcenter.Display = false;
            controlcenter.NowPlaying = false;

            # General Settings
            NSGlobalDomain.AppleICUForce24HourTime = true;
            NSGlobalDomain."com.apple.trackpad.forceClick" = false;
            NSGlobalDomain.KeyRepeat = 2;
            NSGlobalDomain."com.apple.sound.beep.feedback" = 0;

            SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;
          };

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Enable alternative shell support in nix-darwin.
          programs.fish.enable = true;

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 5;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#main
      darwinConfigurations."main" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "pkang";
              autoMigrate = true;
            };
          }
        ];
      };
      darwinPackages = self.darwinConfigurations."main".pkgs;

    };
}
