#!/bin/bash

package_name="tmux"
config_file="$PWD/default.tmux.conf"
config_link="$HOME/tmux.conf"

if ! command -v $package_name &> /dev/null
then
    sudo apt install -y $package_name
fi

ln -sf $config_file $config_link

