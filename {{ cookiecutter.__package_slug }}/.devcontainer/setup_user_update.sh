#!/bin/bash
# Maintained by Angel Martinez-Tenor, 2023-2024
# Repository: https://github.com/angelmtenor/ds-template

# This script is designed to update Miniconda and Poetry.

# USER LEVEL INSTRUCTIONS:
# Execute these instructions at the user level. Avoid using 'sudo' with these commands.
# Step 1: Enable script execution with the following command:
# chmod +x setup_user_update.sh
# Step 2: Run the script with the following command:
# source setup_user_update.sh

# Update Miniconda
source deactivate
conda update -n base -c defaults conda
source activate dev

# Update Poetry
curl -sSL https://install.python-poetry.org | python3 -
# echo 'export PATH="/home/'$USER'/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
