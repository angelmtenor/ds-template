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
MINICONDA_PATH="$MINICONDA_DIR/bin/conda"

# Check if curl, python3, git, and pip3 are installed
command -v curl python3 git pip3 >/dev/null 2>&1 || { echo >&2 "I require curl, python3, git, and pip3 but they're not installed.  Aborting."; exit 1; }

# Install Miniconda
if [ ! -d "$MINICONDA_DIR" ]; then
  mkdir -p "$MINICONDA_DIR" && \
  curl -sSL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o "$MINICONDA_DIR/miniconda.sh" && \
  bash "$MINICONDA_DIR/miniconda.sh" -b -u -p "$MINICONDA_DIR" && \
  rm "$MINICONDA_DIR/miniconda.sh" && \
  "$MINICONDA_PATH" init bash && \
  "$MINICONDA_PATH" init zsh
else
  echo "Miniconda already installed."
fi

# Check for pipx and install if not present
if ! command -v pipx >/dev/null 2>&1; then
  python3 -m pip install --user pipx
  python3 -m pipx ensurepath
fi

# Install Poetry and Cookiecutter using pipx
pipx install poetry
pipx install cookiecutter

# Setup Git: Change default branch to main
git config --global init.defaultBranch main

# Update conda
"$MINICONDA_PATH" update --all -y

# Create conda dev environment if it doesn't exist
if ! "$MINICONDA_PATH" env list | grep '^dev\s' >/dev/null; then
  "$MINICONDA_PATH" create -n dev python=3.12 -y
  echo "conda activate dev" >> ~/.bashrc
  echo "Environment dev created. Please activate it manually using 'conda activate dev'."
fi

# Create PROJECTS directory if it doesn't exist
if [ ! -d ~/PROJECTS ]; then
  mkdir ~/PROJECTS
fi

echo "Finished setting up user environment. Please source your ~/.bashrc or restart your shell to apply changes."