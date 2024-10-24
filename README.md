# dotfiles

This repository contains my personal configuration files (dotfiles), managed with [Nix](https://nixos.org/) and [Home Manager](https://nix-community.github.io/home-manager/). These dotfiles automate the setup and configuration of development tools, terminal settings, and more.

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

## Inspiration

This repository was inspired by [elliotminns/dotfiles](https://github.com/elliottminns/dotfiles). I highly recommend checking out his [YouTube channel](https://www.youtube.com/@dreamsofautonomy) to learn more about Nix.
