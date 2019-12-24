# Navigation
############
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias cdc="cd ~; clear"
alias lsl='ls -l';
alias sudo='sudo';

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
alias update='sudo apt -y update && sudo apt -y upgrade';

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

# Custom Console
################
# PS1="\[\033]0;\W\007\]"; # working directory base name
PS1="\n\[${green}\]┌[\[${userStyle}\]\u";
PS1+="\[${white}\]@\[$(tput setaf 45)\]\h";
PS1+="\[${green}\]]";
PS1+="\[${orange}\][\w]\n\[${green}\]└╼  ";
PS1+="";
PS1+="\[${yellow}\]# \[${reset}\]"; # `$` (and reset color)
export PS1;
PS2="\[${yellow}\]→ \[${reset}\]";
export PS2;
