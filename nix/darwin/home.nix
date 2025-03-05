{ pkgs, lib, ... }:
{
  home.username = "jared";
  home.homeDirectory = "/Users/jared";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs = {
    git = import ../home/git.nix { };
    gpg = import ../home/gpg.nix { };
    vscode = import ../home/vscode.nix { inherit pkgs; };
    zsh = import ../home/zsh.nix { inherit pkgs lib; };
  };

  home.file.".gnupg/gpg-agent.conf".text = ''
    pinentry-program ${pkgs.pinentry_mac}/bin/pinentry-mac
  '';

  # Wezterm configuration
  home.file.".wezterm.lua".text = ''
    local wezterm = require 'wezterm'

    -- This will hold the configuration
    local config = wezterm.config_builder()

    config.color_scheme = 'Tokyo Night'
    config.font_size = 16.0

    -- https://github.com/wez/wezterm/issues/5990#issuecomment-2509141230
    config.front_end = "WebGpu"

    return config
  '';
}
