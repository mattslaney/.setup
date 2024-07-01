#!/bin/bash

script_path=$PWD
setup_path=$HOME/.setup
cd $setup_path

# Setup basic applications
cd applications
./vim/setup.sh
./tmux/setup.sh
./alacritty/setup.sh
./firefox/setup.sh
./waterfox/setup.sh

# Setup code editors
./vscode/setup.sh
./jetbrains-toolbox/setup.sh
./nvim/setup.sh

# Setup utilities
cd $setup_path/utilities
./nvm/setup.sh
./rust/setup.sh
./sdkman/setup.sh
./nix/setup.sh
