{
  description = "Piedt Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.05-darwin";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";

  };

  outputs =
    {
      self,
      nix-darwin,
      home-manager,
      ...
    }@inputs:
    let
      add-unstable-packages = final: _prev: {
        unstable = import inputs.nixpkgs-unstable {
          config.allowUnfree = true;
          system = "aarch64-darwin";
        };
      };
      username = "jared";
      configuration =
        { pkgs, config, ... }:
        {
          nixpkgs.config.allowUnfree = true;
          nixpkgs.overlays = [ add-unstable-packages ];

          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = [
            pkgs.awscli
            pkgs.doppler
            pkgs.git
            pkgs.gnupg
            pkgs.go_1_23
            pkgs.gnupg
            pkgs.mkalias
            pkgs.neovim
            pkgs.nodejs_20
            pkgs.unstable.nixd
            pkgs.nixfmt-rfc-style
            pkgs.jq
            pkgs.pinentry_mac
            pkgs.pnpm
            pkgs.rectangle
            pkgs.ripgrep
            pkgs.unstable.saml2aws
            pkgs.unstable.signal-desktop
            pkgs.unstable.terraform
            pkgs.terragrunt
            pkgs.tgswitch
            pkgs.tmux
            pkgs.vscode
            pkgs.wezterm
          ];

          fonts.packages = [ (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

          users.users.jared = {
            name = username;
            home = "/Users/jared";
          };

          system.activationScripts.applications.text =
            let
              env = pkgs.buildEnv {
                name = "system-applications";
                paths = config.environment.systemPackages;
                pathsToLink = "/Applications";
              };
            in
            pkgs.lib.mkForce ''
              # Set up applications
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

          system.defaults = {
            dock.persistent-apps = [
              "${pkgs.wezterm}/Applications/WezTerm.app"
              "${pkgs.vscode}/Applications/Visual Studio Code.app"
            ];
            finder.AppleShowAllFiles = true;
            magicmouse.MouseButtonMode = "TwoButton";
            NSGlobalDomain = {
              InitialKeyRepeat = 15; # slider values: 120, 94, 68, 35, 25, 15
              KeyRepeat = 2; # slider values: 120, 90, 60, 30, 12, 6, 2
            };
          };

          # Auto upgrade nix package and the daemon service.
          services.nix-daemon.enable = true;

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Create /etc/zshrc that loads the nix-darwin environment.
          programs.zsh.enable = true; # default shell on catalina

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
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations."piedt" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jared = import ./home.nix;
          }
        ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."piedt".pkgs;
    };
}
