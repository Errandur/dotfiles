#! /bin/bash

### VARIABLES ###
GITURL="https://github.com/errandur/dotfiles"

### FUNCTIONS ###
function cloneGit() {
	git clone $GITURL 
}

function copyRangerConfig() {
	ranger --copy-config=all 
	sudo echo "source ~/dotfiles/rc.conf" > ~/.config/ranger/rc.conf
}

function updateSkip() {
	caution=$'\e[1;33m'
	reset=$'\e[0m'
	PS3="${caution}Select Option: ${reset}" 	
	options=(Update Skip)
	select opt in "${options[@]}"
	do
		case $opt in
		Update)
			rm -rf ~/dotfiles/
			cloneGit
		;;
		Skip)
			break 
		;;
		*) echo "invalid option $REPLY"
		;;
		esac
	done
}

### UPDATE APT & INSTALL GIT ###
sudo apt -y update && sudo apt -y install git
  
### CLONE REPO ###
if [ ! -d ~/dotfiles ]; then
	cloneGit;
  else
  	updateSkip;
fi

### RESOURCE BASHRC ###
echo "source ~/dotfiles/.bashrc" > ~/.bashrc

### INSTALL RANGER ###
sudo apt install -y ranger

### COPY RANGER CONFIG FILES ###
if [ ! -d ~/.config/ranger ]; then
	copyRangerConfig;
fi

### INSTALL TMUX ###
sudo apt install -y tmux

### RESOURCE TMUX CONFIG ###
echo "source ~/dotfiles/.tmux.conf" > ~/.tmux.conf

### COMPLETION MESSAGE ###
clear
echo -e "\033[0;32m SETUP COMPLETE! PLEASE RELAUNCH TERMINAL!"
