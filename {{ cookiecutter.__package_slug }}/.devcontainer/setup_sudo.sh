#!/bin/bash
# Angel Martinez Tenor 2023

sudo apt-get update --fix-missing -y && sudo apt-get upgrade -y \
  && sudo apt-get install -y --no-install-recommends git make curl wget bzip2 ca-certificates libglib2.0-0 libxext6 \
  libsm6 libxrender1 mercurial subversion nano htop gcc gpp clang linux-libc-dev

read -p "Do you want to install GPU (NVIDIA/CUDA) support? (Y/n) " -n 1 -r
echo    # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # GPU-ONLY
    sudo apt-get install nvtop ubuntu-drivers-common -y
    sudo apt-get install nvidia-kernel-common-535 -y
    sudo apt install nvidia-cuda-toolkit -y
    echo "Rebooting for changes to take effect..."
    sudo reboot
fi