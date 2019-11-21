#!/bin/bash
set -e
set -o pipefail

# install.sh
#   This script installs by basic setup for a mac laptop

# installs base packages
base() {
  base_min
}

base_min() {
  brew update || true
  brew upgrade

  brew install \
    bash-completion
}

main() {
  local cmd=$1

  if [[ -z "$cmd" ]]; then
    usage
    exit 1
  fi

  if [[ $cmd == "base" ]]; then
    base
  elif [[ $cmd == "basemin" ]]; then
    base_min
  else
    usage
  fi
}

main "$@"