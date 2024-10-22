# dotfiles

My dotfile configuration.

## Dependencies

Install [Nix](https://nixos.org/download/).

```bash
sh <(curl -L https://nixos.org/nix/install)
```

## Installation

### Mac

Apply the Nix configuration.

```bash
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake ./nix/darwin#piedt
```
