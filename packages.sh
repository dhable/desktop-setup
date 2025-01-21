#!/usr/bin/env bash

# Install homebrew and packages
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /Users/dhable/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/dhable/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
    
brew install autoconf awk bat cmake ctop diff-so-fancy fish fzf gh git htop jq lazydocker \
	neovim kubectl terraform perf typescript go
brew install --cask iterm2 joplin cursor docker 

# Setup iterm2 defaults
defaults write com.googlecode.iterm2 QuitWhenAllWindowsClosed -int 0
defaults write com.googlecode.iterm2 SUEnableAutomaticChecks -int 0
defaults write com.googlecode.iterm2 SoundForEsc -int 0
defaults write com.googlecode.iterm2 VisualIndicatorForEsc -int 0
defaults write com.googlecode.iterm2 PromptOnQuit -int 1
