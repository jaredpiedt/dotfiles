#!/bin/bash

# Check if the system is Darwin (macOS)
if [[ "$(uname)" == "Darwin" ]]; then
    echo "Updating all flake inputs..."
    nix flake update ./nix/darwin

    echo "Rebuilding the system..."
    darwin-rebuild switch --flake ./nix/darwin#piedt
else
    echo "This OS is not supported."
fi
