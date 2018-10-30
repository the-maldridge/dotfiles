alias emacs='emacs -nw'

alias such="sudo -p \"Doge needs all of your auths: \""

alias shortPrompt="PS1=\">\""
alias longPrompt="source ~/.bashrc"

alias oldTerm="/usr/libexec/xscreensaver/phosphor -scale 2 -delay 10000 -program /bin/bash"

alias whereAmI="ip -oneline -4 a | grep -v 127.0.0 | sed 's/brd.*$//; s/inet//'"

alias serveHere="busybox httpd -f -p 8080"
