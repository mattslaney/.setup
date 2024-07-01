#!/bin/sh

if [ ! -e /opt/jetbrains-toolbox*/jetbrains-toolbox ]
then
sudo apt install libfuse2

wget "https://download-cdn.jetbrains.com/toolbox/jetbrains-toolbox-2.3.2.31487.tar.gz" -O ~/Downloads/jetbrains-toolbox.tar.gz

#toolbox_file=$(find ~/Downloads -name "jetbrains-toolbox*.tar.gz" -print -quit)

sudo tar -xzf ~/Downloads/jetbrains-toolbox.tar.gz -C /opt
else
echo "jetbrains toolbox already installed"
fi
