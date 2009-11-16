# ~/.zshenv

# .zprofile     loaded if login shell
# .zshenv       always loaded
# .zshrc        loaded if interactive shell

export PGCLIENTENCODING=UNICODE

export RPS1="$(print '%{\e[1;31m%}[%{\e[0;36m%}%T%{\e[1;31m%}]%{\e[0m%}')"
export PS1="$(print '%{\e[0;36m%}%n%{\e[0;37m%}@%{\e[1;34m%}%m%{\e[1;31m%} (%{\e[0m%}%25<..<%~%{\e[1;31m%})%{\e[1;33m%} -> %{\e[0m%}')"

# log commands
export HISTFILE="~/.zsh_history"
export HISTSIZE="5000"
export SAVEHIST="1000"

# __END__

