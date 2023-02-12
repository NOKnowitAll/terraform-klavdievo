#!/bin/bash

# Update system repositories
sudo apt-get -y update
sudo apt-get -y upgrade

# Default version python is 3
update-alternatives --install /usr/bin/python python /usr/bin/python3 2 

# SSH Key permissions chmod settings
chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys

# Set "PasswordAuthentication" as yes
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service ssh restart

# Missing sudo password in Ansible
sudo sh -c "echo \"ubuntu ALL=(ALL) NOPASSWD: ALL\" > /etc/sudoers.d/ubuntu"







