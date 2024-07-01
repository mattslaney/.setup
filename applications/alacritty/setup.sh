#!/bin/bash

script_path=$PWD

if !(command -v cargo &> /dev/null && command -v rustup &> /dev/null && command -v cmake &> /dev/null); then
    echo "Is rust installed?"
fi

if ! command -v alacritty &> /dev/null; then
    rustup override set stable
    rustup update stable

    # install debian/ubuntu dependencies
    sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
    
    # Install using cargo
    #cargo install alacritty
    
    # Install from source
    cd /usr/local/src
    sudo git clone https://github.com/alacritty/alacritty.git
    cd alacritty
    cargo build --release
    
    # Check terminfo
    infocmp alacritty &> /dev/null
    if [ $? -ne 0 ]; then
        echo "WARNING: Terminal information for Alacritty not found. Please check the installation."
	sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
    fi

    # Create desktop info
    sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
    sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    sudo desktop-file-install extra/linux/Alacritty.desktop
    sudo update-desktop-database

    # Setup auto-completion
    mkdir -p ~/.bash_completion
    cp extra/completions/alacritty.bash ~/.bash_completion/alacritty
    grep -q "source ~/.bash_completion/alacritty" ~/.bashrc || echo "source ~/.bash_completion/alacritty" >> ~/.bashrc
 
    # Install manual page
    sudo apt install -y gzip scdoc
    sudo mkdir -p /usr/local/share/man/man1
    sudo mkdir -p /usr/local/share/man/man5
    scdoc < extra/man/alacritty.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
    scdoc < extra/man/alacritty-msg.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
    scdoc < extra/man/alacritty.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz > /dev/null
    scdoc < extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz > /dev/null

    # Install user config
    cd $script_path
    mkdir -p ~/.config/alacritty
    cp alacritty.toml ~/.config/alacritty/alacritty.toml
else
    echo "Alacritty already installed"	
fi
