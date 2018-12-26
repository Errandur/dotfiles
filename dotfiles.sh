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
  copyRangerConfig
fi

### INSTALL TMUX ###
sudo apt install -y tmux

### RESOURCE TMUX CONFIG ###
echo 'source ~/dotfiles/.tmux.conf' > ~/.tmux.conf

### COMPLETION MESSAGE ###
echo "SETUP COMPLETE! PLEASE RELAUNCH TERMINAL!"

### FUNCTIONS
cloneGit() {
  git clone https://github.com/errandur/dotfiles 
}

copyRangerConfig() {
  ranger --copy-config=all 
  sudo echo 'source ~/dotfiles/rc.conf' > ~/.config/ranger/rc.conf
}
