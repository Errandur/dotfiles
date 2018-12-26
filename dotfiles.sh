#! /bin/bash

### UPDATE APT & INSTALL GIT ###
sudo apt -y update && sudo apt -y install git
  
### CLONE REPO ###
if [ ! -d ~/dotfiles ]; then
	cloneGit
fi

### RESOURCE BASHRC ###
echo 'source ~/dotfiles/.bashrc' > ~/.bashrc

### INSTALL RANGER ###
sudo apt install -y ranger

### COPY RANGER CONFIG FILES ###
if [ ! -d ~/.config/ranger ]; then
  ranger --copy-config=all
fi

### RESOURCE RANGER CONFIG ###
sudo echo 'source ~/dotfiles/rc.conf' > ~/.config/ranger/rc.conf

### INSTALL TMUX ###
sudo apt install -y tmux

### RESOURCE TMUX CONFIG ###
echo 'source ~/dotfiles/.tmux.conf' > ~/.tmux.conf

### COMPLETION MESSAGE ###
echo "Setup Complete! Reload Terminal!"

### FUNCTIONS
cloneGit() {
  git clone https://github.com/errandur/dotfiles 
}
