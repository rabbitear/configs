# woddfellow2's bash Config (genesis)
# by woddfellow2 | http://wlair.us.to/

# Apparently I need to keep this here (Check for an interactive session)
[ -z "$PS1" ] && return

# Prompt is similar to Gentoo default, but with yellow and date/time
PS1="\d \t \[\033[01;33m\]\w\[\033[01;34m\] \$\[\033[00m\] "

# vi Keybindings
set -o vi

# Default Applications
export EDITOR="vim"
export PAGER="less"

# Aliases
alias ls='ls --color=auto'
alias grep="grep --color=auto"
alias p3="ping -c 3"
alias c="clear"
alias dRR="screen -dRR"
alias mp="mplayer"
alias volunteer="ssh -t volunteer screen -dRR"
alias senator="ssh -t senator screen -dRR"
alias maharani="ssh -tC 66.175.208.202 screen -dRR"

if [[ -z "$DISPLAY" ]] && [[ -z "$STY" ]]; then
	alias x="startx & exit"
fi

if [[ -n "$DISPLAY" ]]; then
        alias fixtitle="echo -e \"\e]0;\""
fi

# Make Exiting Difficult
export IGNOREEOF=9001

if [[ -n "$STY" ]] && [[ "$WINDOW" == 0 ]]; then
	alias exit="false"
fi

# Functions
function sprunge ()
{
        $@ | curl -F 'sprunge=<-' http://sprunge.us
}
function rot13 ()
{
        $@ | tr a-zA-Z n-za-mN-ZA-M;
}
