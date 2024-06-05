#!/bin/bash
# Angel Martinez-Tenor 2023-2024
# https://github.com/angelmtenor/ds-template

# This script updates the system and installs essential packages required for the project.
# It also provides an option to install GPU (NVIDIA/CUDA) support.

# Recommended OS: Ubuntu 24.04 LTS or above

# INSTRUCTIONS:
# Step 1: Enable execution of the script with the following command:
# chmod +x setup_sudo.sh
# Step 2: Execute the script with the following command:
# sudo ./setup_sudo.sh


# Ensure the script is being run with superuser privileges
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Stop the script if any command fails
set -e

# Update the system and install necessary packages
sudo apt update --fix-missing -y && sudo apt upgrade -u -y \
  && sudo apt install -y --no-install-recommends git git-flow make curl wget ca-certificates \
  nano htop gcc gpp clang linux-libc-dev pipx

# Remove unnecessary packages
sudo apt autoremove -y

# Ask the user if they want to install GPU (NVIDIA/CUDA) support
read -p "Do you want to install GPU (NVIDIA/CUDA) support? (Y/n) " -n 1 -r
echo    # move to a new line

# If the user wants to install GPU support, install the necessary packages and reboot the system
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # GPU-ONLY
    sudo apt-get install nvtop ubuntu-drivers-common -y
    sudo apt-get install nvidia-kernel-common-555 -y
    sudo apt install nvidia-cuda-toolkit -y
    echo "Rebooting for changes to take effect..."
    sudo reboot
fi
