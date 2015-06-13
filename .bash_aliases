alias emacs='emacs -nw'

alias such="sudo -p \"Doge needs all of your auths: \""

alias shortPrompt="PS1=\">\""
alias longPrompt="source ~/.bashrc"

alias powerrem="echo -n $(($(cat /sys/class/power_supply/BAT0/charge_now)*100  / $(cat /sys/class/power_supply/BAT0/charge_full))); echo '%'"
alias oldTerm="/usr/libexec/xscreensaver/phosphor -scale 2 -delay 10000 -program /bin/bash"

