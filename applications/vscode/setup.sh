#!/bin/bash

wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O "$HOME/Downloads/vscode.deb"
sudo mv "$HOME/Downloads/vscode.deb" /var/cache/apt/archives/
sudo apt install /var/cache/apt/archives/vscode.deb

