# dotfiles

[![CircleCI](https://circleci.com/gh/jaredpiedt/dotfiles.svg?style=svg)](https://circleci.com/gh/jaredpiedt/dotfiles)

Most of this was taken from [@jessfraz](https://github.com/jessfraz)'s [dotfiles](https://github.com/jessfraz/dotfiles).

## Installation

```bash
make
```

This will create symlinks from this repo to your home folder.

## Customize

Save env vars, etc in a `.extra` file, that looks something like this:

```bash
###
### Git credentials
###

GIT_AUTHOR_NAME="Your Name"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="email@you.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
GH_USER="nickname"
git config --global github.user "$GH_USER"
```
