#!/usr/bin/env bash

# Install homebrew and packages
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo >> /Users/dhable/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/dhable/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    brew update
    echo "Upgrading installed packages..."
    brew upgrade
fi

# Function to install a package if it's not already installed
install_if_missing() {
    local type=${1:-package}  # Default to 'package' if not specified
    local package=$2
    
    local cmd_suffix=""
    local description=""
    
    if [ "$type" = "cask" ]; then
        cmd_suffix="--cask"
        description="cask "
    fi
    
    if ! brew list $cmd_suffix "$package" &>/dev/null; then
        echo "Installing ${description}$package..."
        brew install $cmd_suffix "$package"
    else
        echo "$package is already installed"
    fi
}

# Install packages if they're not already installed
for package in autoconf awk bat cmake ctop diff-so-fancy fish fzf gh git htop jq lazydocker \
    neovim kubectl terraform perf typescript go helm k9s awscli bats-core orbstack; do
    install_if_missing "$package"
done

# Install casks if they're not already installed
for cask in warp joplin cursor; do
    install_if_missing "cask" "$cask"
done
