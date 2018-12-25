#! /bin/bash

### Update APT and install GIT ###
##################################
sudo apt -y update && sudo apt -y install git

### Clone repo ###
##################
git clone https://github.com/errandur/dotfiles 

### Source new bashrc ###
#########################
echo 'source ~/dotfiles/.bashrc' > ~/.bashrc

### Install ranger ###
######################
sudo apt install -y ranger

### Copy ranger config files ###
################################
ranger --copy-config=all

### Set new Ranger config ###
#############################
sudo echo 'source ~/dotfiles/rc.conf' > ~/.config/ranger/rc.conf

### Install Tmux ###
####################
sudo apt install -y tmux

### Set new Tmux config ###
###########################
echo 'source ~/dotfiles/.tmux.conf' > ~/.tmux.conf

### Re-source .bashrc ###
#########################
source ~/.bashrc

echo Setup Complete!
####################
