#!/usr/bin/env fish

# Install fisher package manager and packages
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install IlanCosman/tide@v6
fisher install jorgebucaran/nvm.fish
fisher install edc/bass
fish_add_path fisher install edc/bass

# Install Rust and CLI tools
if not command -sq rustup
    sh -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)" "" -y
    fish_add_path $HOME/.cargo/bin
end
cargo install --locked bacon

# Install fonts required
# https://github.com/IlanCosman/tide?tab=readme-ov-file#meslo-nerd-font

# Start prompt configuration
tide configure

# Setup nvm
nvm install lts
set -Ux nvm_default_version lts

# Ensure for OS X that the shell is now in the list of allowed shells. This value needs
# to be set in the UI via the Users & Groups setting (right click->Advanced options on a user)
sudo which fish | sudo tee -a /etc/shells

# Setup brew
set -U fish_user_paths /opt/homebrew/bin $fish_user_paths
set -g fish_complete_path $fish_complete_path /opt/homebrew/share/fish/vendor_completions.d
