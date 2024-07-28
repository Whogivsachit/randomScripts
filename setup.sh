# Debian/Ubuntu setup script

#!/bin/bash

#Variables
port="20"
permit_root_login="yes"
use_pam="yes"
ssh_key="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILj0PEv/YOTwfYNPgk3cYenPHmQ0WJK6imhAT6hKQK9R Whogi-WS"
password_authentication="no"

# Adding Sudo
echo Adding sudo
apt install sudo -y

# Update Packages
echo Updating packages...
sudo apt update -y && sudo apt upgrade -y
echo Installing Packages...

# Install Packages
sudo curl -sSL 'https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh' | sudo bash
sudo apt install -y fail2ban snap bpytop htop curl wget speedtest ncdu
echo Packages finished.

# Setup SSH
echo Configuring SSH...
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.BAK
sudo sed -i "s/^Port [0-9]\+$/Port $port/" /etc/ssh/sshd_config
sudo sed -i "s/^PermitRootLogin .*/PermitRootLogin $permit_root_login/" /etc/ssh/sshd_config
sudo sed -i "s/^UsePAM .*/UsePAM $use_pam/" /etc/ssh/sshd_config
sudo sed -i "s/^PasswordAuthentication .*/PasswordAuthentication $password_authentication/" /etc/ssh/sshd_config

# Add SSHKey
sudo touch /root/.ssh/authorized_keys
echo $ssh_key >> ~/.ssh/authorized_keys

# Restart SSH And Finish
sudo systemctl restart sshd
echo SSH configuration finished.
echo Server Setup finished.
