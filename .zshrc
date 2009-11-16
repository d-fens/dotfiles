# .zshrc

# .zprofile     loaded if login shell
# .zshenv       always loaded
# .zshrc        loaded if interactive shell

# load envirnoment
if [ -f ~/.zshenv ] ; then
	source ~/.zshenv
fi

# load aliases
if [ -f ~/.zsh.aliases ] ; then
	source ~/.zsh.aliases
fi

# attach screen if there, else show me the screens available
if [ $SSH_TTY ] && [ ! $WINDOW ]; then
	SCREENLIST=`screen -ls | grep 'Attached'`
	if [ $? -eq "0" ]; then
		echo -e "Screen is already running and attached:\n ${SCREENLIST}"
	else
		screen -Udr
	fi
fi

# clear sets up a screen as mesg n
mesg n

setopt append_history ignoreeof

# prevents aliases on the command line from being internally substituted before completion is attempted.
set COMPLETE_ALIASES

# remove stty for ctrl^s
stty stop undef   
stty start undef

# Completion Styles
zmodload -i zsh/complist

# Setup new style completion system.
autoload -U compinit
compinit

# make it look pretty
autoload -U promptinit
promptinit

# load colors
autoload -U colors
colors

# completion of online usernames and your friends, demoggification ;)
function userlist { reply=(`users | tr ' ' '\n' | < ~/.friends | sort -u`); }
compctl -K userlist hey
compctl -K userlist finger
compctl -K userlist ps -fu
compctl -K userlist id  

# general completion technique
zstyle ':completion:*' completer _complete _prefix _ignored _complete:-extended

# separate matches into groups
zstyle ':completion:*:matches' group 'yes'

# describe options in full
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'

# completion for processes
zstyle ':completion:*:*:*:*:processes' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always

# __END__

