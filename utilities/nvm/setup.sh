#!/bin/bash

# Check if NVM exists and if not, install it
export NVM_DIR="$HOME/.nvm"

if [ ! -d "$NVM_DIR" ];
then
    echo "Not installed"
    #curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    # wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
else
    source "$NVM_DIR/nvm.sh"
fi

# Check if there is a version of node installed, otherwise install latest
if [ "$(nvm current)" = "none" ]; then
    echo "No Node.js version is currently active. Installing the latest LTS version..."
    nvm install --lts
else
    echo "Node.js version $(nvm current) is currently active."
fi

