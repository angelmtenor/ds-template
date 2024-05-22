#!/bin/bash
# Angel Martinez-Tenor 2023-2024

# This script updates the system and installs essential packages required for the project.
# It also provides an option to install GPU (NVIDIA/CUDA) support.

# Update the system and install necessary packages
sudo apt-get update --fix-missing -y && sudo apt-get upgrade -y \
  && sudo apt-get install -y --no-install-recommends git git-flow make curl wget bzip2 ca-certificates libglib2.0-0 libxext6 \
  libsm6 libxrender1 mercurial subversion nano htop gcc gpp clang linux-libc-dev

# Ask the user if they want to install GPU (NVIDIA/CUDA) support
read -p "Do you want to install GPU (NVIDIA/CUDA) support? (Y/n) " -n 1 -r
echo    # move to a new line

# If the user wants to install GPU support, install the necessary packages and reboot the system
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # GPU-ONLY
    sudo apt-get install nvtop ubuntu-drivers-common -y
    sudo apt-get install nvidia-kernel-common-535 -y
    sudo apt install nvidia-cuda-toolkit -y
    echo "Rebooting for changes to take effect..."
    sudo reboot
fi
