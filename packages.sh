#!/usr/bin/env bash

# Install homebrew and packages
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /Users/dhable/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/dhable/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
    
brew install autoconf awk bat cmake ctop diff-so-fancy fish fzf gh git htop jq lazydocker \
	neovim kubectl terraform perf typescript go helm k9s awscli bats-core
brew install --cask warp joplin cursor docker 
