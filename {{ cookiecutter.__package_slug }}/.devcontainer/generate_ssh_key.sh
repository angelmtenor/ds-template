#!/bin/bash
# Angel Martinez-Tenor 2023-2024
# https://github.com/angelmtenor/ds-template


# Make the script executable with the command: chmod +x generate_ssh_key.sh
# Run the script with root privileges using: sudo ./generate_ssh_key.sh

read -p "Do you want to generate an SSH key? (Y/n): " generate_ssh_key

# Set default value to "Y" if no answer is given
generate_ssh_key=${generate_ssh_key:-Y}

if [[ $generate_ssh_key =~ ^[Yy]$ ]]; then
  # Ask for the label
  read -p "Enter the label for the SSH key: " label

  # Ask for the hostname
  read -p "Enter the hostname: " hostname

  # Get the username of the user executing the script
  username=$(whoami)

  # Switch to the new user and generate the SSH key, copy the public key to authorized_keys, add the server to the SSH config, and set the permissions
  cd ~
  ssh-keygen -t ed25519 -f ~/.ssh/$label -q -N ''
  cp ~/.ssh/$label.pub ~/.ssh/authorized_keys
  echo "Host $label
      HostName $hostname
      IdentityFile ~/.ssh/$label
      User $username
      ForwardAgent yes" >> ~/.ssh/config
  chmod 600 ~/.ssh/config
  chmod 700 ~/.ssh

  echo 'Copy the following SSH config to your local machine:'
  cat ~/.ssh/config
  echo 'Copy the following private key to the servers you need access to:'
  cat ~/.ssh/$label
fi
