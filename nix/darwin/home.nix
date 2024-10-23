{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;
in
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
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs = {
    git = import ../home/git.nix { inherit config pkgs; };
    gpg = import ../home/gpg.nix { inherit pkgs; };
    vscode = import ../home/vscode.nix { inherit pkgs; };
    zsh = import ../home/zsh.nix { inherit config pkgs lib; };
  };

  home.file.".gnupg/gpg-agent.conf".text = ''
    pinentry-program ${pkgs.pinentry_mac}/bin/pinentry-mac
  '';
}
