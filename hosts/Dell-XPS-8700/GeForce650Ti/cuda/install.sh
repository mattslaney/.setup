#!/bin/bash

# Remove existing CUDA installations
#sudo apt-get --purge remove "*cublas*" "cuda*" "nsight*"
#sudo apt-get autoremove
#sudo apt-get autoclean

# Install deps
#sudo apt-get update
#sudo apt-get install build-essential

# Fetch older liburcu6 package
#wget http://archive.ubuntu.com/ubuntu/pool/main/libu/liburcu/liburcu6_0.11.1-2_amd64.deb
#sudo dpkg -i liburcu6_0.11.1-2_amd64.deb
#sudo apt-get install -f

# Setup repo
#sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub
#sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"

# Install cuda
#sudo apt-get update
#sudo apt-get install cuda-11-4

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.4.0/local_installers/cuda-repo-ubuntu2004-11-4-local_11.4.0-470.42.01-1_amd64.deb

sudo dpkg -i cuda-repo-ubuntu2004-11-4-local_11.4.0-470.42.01-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu2004-11-4-local/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda

