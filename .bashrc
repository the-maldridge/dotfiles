# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# source git prompt script
source ~/.gitprompt.sh

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

if [ -n "$(tput colors)" ] ; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1)\$ '
else
    PS1='\u@\h:\w\$ '
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ssh-agent
if [ ! -f $HOME/.nokeys ] ; then
    SSH_ENV="$HOME/.ssh/environment"
    
    function start_agent {
	echo "Initialising new SSH agent..."
	/usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
	echo success!
	chmod 600 "${SSH_ENV}"
	. "${SSH_ENV}" > /dev/null
	/usr/bin/ssh-add;
    }
    
    # Source SSH settings, if applicable
    if [ -f "${SSH_ENV}" ]; then
	. "${SSH_ENV}" > /dev/null
	ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
	    start_agent;
	}
    else
	start_agent;
    fi
fi

export PAGER=less
export JAVA_HOME=/usr/lib/jvm/openjdk

export GPG_TTY=$(tty)
export EDITOR=emacs

# Add ~/bin to path
export PATH=$PATH:~/bin

# Add dfm to path
export PATH=$PATH:~/.dotfiles/dfm

if [ -d ~/.local/bin ] ; then
    export PATH=$PATH:~/.local/bin
fi

if [ -d ~/go/bin ] ; then
    export PATH=$PATH:~/go/bin
fi

# Check for node crap
if [ -d "$HOME/.node" ] ; then
    export PATH=$PATH:"$HOME/.node/bin"
    export NODE_PATH="$HOME/.node/lib/node_modules:$NODE_PATH"
    export MANPATH="$HOME/.node/share/man:$MANPATH"
fi
