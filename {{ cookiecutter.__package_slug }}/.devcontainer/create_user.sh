#!/bin/bash
# Angel Martinez Tenor 2023

# Make the script executable with the command: chmod +x create_user.sh
# Run the script with root privileges using: sudo ./create_user.sh

# Check if the script is run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Ask for the username
read -p "Enter the new username: " username

# Add the new user
adduser $username

# Add the new user to the docker group
usermod -aG docker $username

# # Change to the new user group
# newgrp docker

# Ask if the user wants to generate an SSH key
read -p "Do you want to generate an SSH key for the new user? (Y/n): " generate_ssh_key

# Set default value to "Y" if no answer is given
generate_ssh_key=${generate_ssh_key:-Y}

if [[ $generate_ssh_key =~ ^[Yy]$ ]]; then
  # Ask for the label
  read -p "Enter the label for the SSH key: " label

  # Ask for the hostname
  read -p "Enter the hostname: " hostname

  # Switch to the new user and generate the SSH key, copy the public key to authorized_keys, add the server to the SSH config, and set the permissions
  su - $username -c "
    cd ~
    ssh-keygen -t ed25519 -f ~/.ssh/$label -q -N ''
    cp ~/.ssh/$label.pub ~/.ssh/authorized_keys
    echo '$label
      HostName $hostname
      IdentityFile ~/.ssh/$label
      User $username
      ForwardAgent yes' >> ~/.ssh/config
    chmod 600 ~/.ssh/config
    chmod 700 ~/.ssh
  "
fi

# Change to the new user
su - $username -c "
  echo 'User $username created and logged in'
  read -p 'Do you want to proceed with the setup? This will install git, conda, and poetry. (Y/n): ' proceed_with_setup
  proceed_with_setup=${proceed_with_setup:-Y}
  if [[ \$proceed_with_setup =~ ^[Yy]$ ]]; then
    wget https://github.com/angelmtenor/ds-template/raw/main/%7B%7B%20cookiecutter.__package_slug%20%7D%7D/.devcontainer/setup_user.sh
    chmod +x setup_user.sh
    source setup_user.sh
  fi

  echo 'Copy the following SSH config to your local machine:'
  cat ~/.ssh/config
  echo 'Copy the following private key to the servers you need access to:'
  cat ~/.ssh/$label
"