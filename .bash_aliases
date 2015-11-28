alias emacs='emacs -nw'

alias such="sudo -p \"Doge needs all of your auths: \""

alias shortPrompt="PS1=\">\""
alias longPrompt="source ~/.bashrc"

alias oldTerm="/usr/libexec/xscreensaver/phosphor -scale 2 -delay 10000 -program /bin/bash"

alias whereAmI="ip -oneline -4 a | grep -v 127.0.0 | sed 's/brd.*$//; s/inet//'"

#CV Section
export INVENTORY_FILE=/home/maldridge/Documents/CV/cv_config/inventory
alias cvReboot="ansible -i $INVENTORY_FILE clients:mediaboxen -K --sudo -a \"/sbin/reboot\""
alias cvWho="ansible -i $INVENTORY_FILE clients:mediaboxen -a 'w'"
alias cvWake="ansible -i $INVENTORY_FILE clients:mediaboxen -K --sudo -a \"sudo su lightdm -s /bin/bash -c 'xset -display :0 dpms force on'\""
