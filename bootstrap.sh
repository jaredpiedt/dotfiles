#!/bin/bash

# Check if nix is installed
if ! command -v nix &> /dev/null
then
    echo "Nix is not installed. Installing..."
    sh <(curl -L https://nixos.org/nix/install)
    echo "Nix installed."
else
    echo "Nix is already installed."
fi

# Check if the system is Darwin (macOS)
if [[ "$(uname)" == "Darwin" ]]; then
    echo "Detected macOS (Darwin). Running nix-darwin command..."
    nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake ./nix/darwin#piedt
else
    echo "This OS is not supported."
fi
