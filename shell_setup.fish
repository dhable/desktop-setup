#!/usr/bin/env fish

# Install fisher package manager and packages
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install IlanCosman/tide@v6
fisher install jorgebucaran/nvm.fish
fisher install edc/bass
fish_add_path fisher install edc/bass

# Install Rust and CLI tools
sh -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)" "" -y
fish_add_path $HOME/.cargo/bin
cargo install --locked difftastic
cargo install --locked bacon

# Install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -Rf fonts/

# Start prompt configuration
tide configure

# Setup nvm
nvm install lts
set -Ux nvm_default_version lts

