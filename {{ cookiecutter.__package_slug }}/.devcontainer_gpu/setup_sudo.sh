sudo apt-get update --fix-missing -y && sudo apt-get upgrade -y \
  && sudo apt-get install -y --no-install-recommends git make curl wget bzip2 ca-certificates libglib2.0-0 libxext6 \
  libsm6 libxrender1 mercurial subversion nano htop gcc gpp nvtop clang linux-libc-dev

sudo apt-get install ubuntu-drivers-common -y
sudo apt-get install nvidia-kernel-common-535 -y

sudo reboot

sudo apt install nvidia-cuda-toolkit -y
