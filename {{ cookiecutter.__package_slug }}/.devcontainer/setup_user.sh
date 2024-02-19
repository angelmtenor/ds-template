#!/bin/bash
# Author: Angel Martinez Tenor 2023

# First setup required with new users in cloud / on prem machine (alredy done in dev containers)

# USER LEVEL INSTRUCTIONS (NEVER USE SUDO):
# 1: Enable execution:   `chmod +x setup_user.sh`
# 2: Execute with comand `source setup_user.sh`


# Install Miniconda
mkdir -p ~/miniconda3 && \
  curl -sSL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o ~/miniconda3/miniconda.sh && \
  bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3 && \
  rm ~/miniconda3/miniconda.sh && \
  ~/miniconda3/bin/conda init bash && \
  ~/miniconda3/bin/conda init zsh
source ~/.bashrc

# Install Poetry
curl -sSL https://install.python-poetry.org | python3 -
# ENV PATH="$HOME/.local/bin:$PATH"
echo 'export PATH="/home/'$USER'/.local/bin:$PATH"' >> ~/.bashrc

# Setup Git (already installed by admin): Change default branch to main
git config --global init.defaultBranch main
source ~/.bashrc

# Create custom DEV and TEST environments
conda update --all -y

# Dev enviornment with cookiecutter and ipykernel. Can be used with poetry, pip...
conda create -n dev python=3.11 -y && conda init bash && \
  echo "conda activate dev" >> ~/.bashrc && source activate dev && \
  pip install cookiecutter ipykernel
echo "Environment dev created"

mkdir PROJECTS
