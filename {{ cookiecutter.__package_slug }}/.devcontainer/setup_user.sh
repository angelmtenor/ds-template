#!/bin/bash
# Angel Martinez-Tenor 2023-2024
# https://github.com/angelmtenor/ds-template

# This script is used for the initial setup required for new users on cloud or on-premises machines.
# Note: This setup is already done in development containers.

# To create a new user and log in with it (Admin level), use the following commands:
# sudo adduser <username>
# sudo usermod -aG docker <username>
# newgrp docker
# su <username>
# cd ~

# USER LEVEL INSTRUCTIONS:
# These instructions should be followed at the user level. Avoid using 'sudo' with these commands.
# Step 1: Enable execution of the script with the following command:
# chmod +x setup_user.sh
# Step 2: Execute the script with the following command:
# source setup_user.sh

set -e
set -u

# Variables
MINICONDA_DIR=~/miniconda3
MINICONDA_PATH=$MINICONDA_DIR/bin/conda
POETRY_PATH=~/.local/bin

# Check if curl, python3, git, and pip are installed
command -v curl python3 git pip >/dev/null 2>&1 || { echo >&2 "I require curl, python3, git, and pip but they're not installed.  Aborting."; exit 1; }

# Install Miniconda
if [[ ! -d $MINICONDA_DIR ]]; then
  mkdir -p $MINICONDA_DIR && \
  curl -sSL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o $MINICONDA_DIR/miniconda.sh && \
  bash $MINICONDA_DIR/miniconda.sh -b -u -p $MINICONDA_DIR && \
  rm $MINICONDA_DIR/miniconda.sh && \
  $MINICONDA_PATH init bash && \
  $MINICONDA_PATH init zsh
  source ~/.bashrc
fi

# Install Poetry
if [[ ! -d $POETRY_PATH ]]; then
  curl -sSL https://install.python-poetry.org | python3 -
  echo 'export PATH="/home/'$USER'/.local/bin:$PATH"' >> ~/.bashrc
  source ~/.bashrc
fi

# Setup Git (already installed by admin): Change default branch to main
git config --global init.defaultBranch main

# Create custom DEV and TEST environments
$MINICONDA_PATH update --all -y

# Dev environment with cookiecutter and ipykernel. Can be used with poetry, pip...
if [[ ! $($MINICONDA_PATH env list | grep '^dev\s') ]]; then
  $MINICONDA_PATH create -n dev python=3.12 -y && $MINICONDA_PATH init bash && \
  echo "conda activate dev" >> ~/.bashrc && source activate dev && \
  pip install cookiecutter ipykernel
  echo "Environment dev created"
fi

# Create PROJECTS directory if it doesn't exist
if [[ ! -d ~/PROJECTS ]]; then
  mkdir ~/PROJECTS
fi

echo "Finished setting up user environment"
