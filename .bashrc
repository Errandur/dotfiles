### Easier navigation
#####################
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias cdc="cd ~; clear"

# Shortcuts
###########
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias pwr='poweroff'
alias open='xdg-open'
alias install="sudo apt -y install"
alias update="sudo apt -y update; sudo apt -y upgrade"
alias sleep='systemctl suspend'
alias run='sudo bash'
alias apt='sudo apt-get'

# Funtions 
##########
function cs() { cd $@ && ls -alh; }
function update() { sudo apt -y update; sudo apt -y upgrade; }
function archive() { tar czf target.tar.gz $1; }
function uarchive() { tar xzf $1; }
function encrypt() { gpg -c $1; }
function dedcrypt() { gpg -c $1shred -u $1; }
function decrypt() { gpg -d $1 > _unencrypted_target; }
function shedcrypt() { gpg -d $1 > target; shred -u $1; }
function encryptdir() { tar czf target.tar.gz $1; rm -rf $1; gpg -c target.tar.gz; rm -rf target.tar.gz; }
function dircrypt() { tar czf target.tar.gz $1; rm -rf $1; gpg -c target.tar.gz; rm -rf target.tar.gz; }
function decryptdir() { gpg -d $1 > target.tar.gz; tar xzf target.tar.gz; rm -rf target.tar.gz; }
function dedircrypt() { gpg -d $1 > target.tar.gz; tar xzf target.tar.gz; rm -rf target.tar.gz; }
function dotpull() { cd ~/dotfiles/; sudo git pull; cd ~; }
function dotpush() { cd ~/dotfiles/; sudo git add .; sudo git commit -m "$1"; sudo git push; }

# Misc Options
##############
# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";
# Export Editor
export EDITOR=vim;
# Auto CD
shopt -s autocd;
# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;
# Append to the Bash history file, rather than overwriting it
shopt -s histappend;
# Autocorrect typos in path names when using `cd`
shopt -s cdspell;
# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Console Customization
#######################
# List all files colorized in long format
alias l="ls -lhF ${colorflag}";
# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}";
# List only directories
alias ll="ls -alh ${colorflag}";
# Always use color output for `ls`
alias ls="command ls ${colorflag}";
# List Dir - Long View
alias lsl='ls -l';
# Enable aliases to be sudo’ed
alias sudo='sudo';
# Single comman to update and upgrade debian
alias update='sudo apt -y update && sudo apt -y upgrade';

# Shell Colors
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM='gnome-256color';
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM='xterm-256color';
fi;
if tput setaf 1 &> /dev/null; then
	tput sgr0; # reset colors
	bold=$(tput bold);
	reset=$(tput sgr0);
	# Solarized colors, taken from http://git.io/solarized-colors.
	black=$(tput setaf 0);
	blue=$(tput setaf 33);
	cyan=$(tput setaf 37);
	green=$(tput setaf 40);
	orange=$(tput setaf 202);
	magenta=$(tput setaf 13);
	purple=$(tput setaf 125);
	red=$(tput setaf 124);
	violet=$(tput setaf 61);
	white=$(tput setaf 15);
	yellow=$(tput setaf 226);
else
	bold='';
	reset="\e[0m";
	black="\e[1;30m";
	blue="\e[1;34m";
	cyan="\e[1;36m";
	green="\e[1;32m";
	magenta="\e[0;49m";
	purple="\e[1;35m";
	red="\e[1;31m";
	violet="\e[1;35m";
	white="\e[1;37m";
	yellow="\e[1;33m";
fi;
# Highlight the user name when logged in as root.
if [[ "${USER}" == "root" ]]; then
	userStyle="${red}";
else
	userStyle="${green}";
fi;
# Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
	hostStyle="${bold}${red}";
else
	hostStyle="${magenta}";
fi;

# Set the terminal title and prompt.
# PS1="\[\033]0;\W\007\]"; # working directory base name
PS1="\n\[${green}\]┌[\[${userStyle}\]\u";
PS1+="\[${white}\]@\[$(tput setaf 45)\]\h";
PS1+="\[${green}\]]";
PS1+="\[${orange}\][\w]\n\[${green}\]└╼  ";
PS1+="";
# PS1+="\[${bold}\]\n"; # newline
# PS1+="\[${userStyle}\]\u"; # username
# PS1+="\[${white}\] at ";
# PS1+="\[${hostStyle}\]\h"; # host
# PS1+="\[${white}\] in ";
# PS1+="\[${green}\]\w"; # working directory full path
# PS1+="\$(prompt_git \"\[${white}\] on \[${violet}\]\" \"\[${blue}\]\")"; # Git repository details
# PS1+="\n";
PS1+="\[${yellow}\]# \[${reset}\]"; # `$` (and reset color)
export PS1;
PS2="\[${yellow}\]→ \[${reset}\]";
export PS2;
