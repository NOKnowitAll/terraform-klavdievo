#!/bin/bash

# Update system repositories
sudo apt-get -y update
sudo apt-get -y upgrade

# Installing Ansible
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible

# Default version python is 3
update-alternatives --install /usr/bin/python python /usr/bin/python3 2 

# Copy Ansible file from github using git clone
cd /etc/ansible
sudo git clone https://github.com/NOKnowitAll/ansible-klavdievo.git

# Create ssh key
sudo mkdir -p ~/.ssh
sudo chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys
ssh-keygen -e -m pem -N "" -f ~/.ssh/ansible <<<y 
sudo chmod 400 ~/.ssh/ansible
sudo chmod 400 ~/.ssh/ansible.pub





