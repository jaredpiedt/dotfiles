###
# MacOS System Setup
###

# Show hidden files in finder
defaults write com.apple.finder AppleShowAllFiles YES


###
# Applications Setup
###
# while IFS='' read -r line || [[ -n "$line" ]]; do
#     brew install "$line"
# done < "brew.txt"


###
# Dotfiles Setup
###

# zsh
stow zsh -t $HOME

# git
stow git -t $HOME
