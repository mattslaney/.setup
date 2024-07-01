#!/bin/bash

package_name="vim"
config_file="$PWD/default.vimrc"
config_link="$HOME/.vimrc"

if ! command -v $package_name &> /dev/null
then
    sudo apt install -y $package_name
fi

# ln -sf "$PWD/default.vimrc" "$HOME/.vimrc"
cp "$PWD/default.vimrc" "$HOME/.vimrc"

