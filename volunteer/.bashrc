# woddfellow2's bash Config (senator)
# by woddfellow2 | http://wlair.us.to/

# Prompt
PS1="\[\033[01;36m\]\w\[\033[01;34m\] \$\[\033[00m\] "

# vi Keybindings
set -o vi

# Environment Variables
export EDITOR="vim"

# Make Exiting Difficult
export IGNOREEOF=9001

if [[ -n "$STY" ]] && [[ "$WINDOW" == 0 ]]; then
	alias exit="false"
fi

# Aliases
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias volunteer="ssh -t volunteer screen -dRR"
alias genesis="ssh -t genesis screen -dRR"
alias maharani="ssh -tC 66.175.208.202 screen -dRR"
alias c="clear"
alias mp="mplayer"
