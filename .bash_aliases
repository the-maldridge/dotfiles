alias emacs='emacs -nw'

alias such="sudo -p \"Doge needs all of your auths: \""

alias shortPrompt="PS1=\">\""
alias longPrompt="source ~/.bashrc"

alias oldTerm="/usr/libexec/xscreensaver/phosphor -scale 2 -delay 10000 -program /bin/bash"

#CV Section
cvReboot="ansible clients:mediaboxen -Kk -u cv --sudo -a \"/sbin/reboot\""