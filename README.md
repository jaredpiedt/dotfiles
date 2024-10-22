# dotfiles

My dotfile configuration for MacOS.

## Dependencies

Install [Homebrew](https://docs.brew.sh/Installation):

```bash
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

eval "$(homebrew/bin/brew shellenv)"
brew update --force --quiet
chmod -R go-w "$(brew --prefix)/share/zsh"
```

Install [stow](https://www.gnu.org/software/stow/):

```bash
brew install stow
```

## Installation

```bash
./setup.sh
```

Install Nix

```bash
sh <(curl -L https://nixos.org/nix/install)
```

### Mac

Install `nix-darwin`

```bash
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake ./nix/darwin#piedt
```
