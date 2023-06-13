#!/bin/bash
# Author: Angel Martinez Tenor 2023

# executable permission: chmod +x post_script_setup_ai_machine.sh

# INSTALL MINICONDA (user)
mkdir -p ~/miniconda3 && \
  curl -sSL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o ~/miniconda3/miniconda.sh && \
  bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3 && \
  rm ~/miniconda3/miniconda.sh && \
  ~/miniconda3/bin/conda init bash && \
  ~/miniconda3/bin/conda init zsh

source ~/.bashrc

# Poetry
curl -sSL https://install.python-poetry.org | python3 -
# ENV PATH="$HOME/.local/bin:$PATH"
echo 'export PATH="/home/'$USER'/.local/bin:$PATH"' >> ~/.bashrc

# Git: Change default branch to main
git config --global init.defaultBranch main
source ~/.bashrc