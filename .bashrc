# woddfellow2's bash Config
# by woddfellow2 | http://wlair.us.to/

# Apparently I need to keep this here (Check for an interactive session)
[ -z "$PS1" ] && return

# Prompt Stolen from Gentoo
PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "

# vi Keybindings
set -o vi

# Default Applications
export EDITOR="vim"
export PAGER="less"

# Aliases
alias ls='ls --color=auto'
alias grep="grep --color=auto"
alias colours="$HOME/scripts/colours.sh"
alias flv="$HOME/scripts/flash-video.sh"
alias p3="ping -c 3"
alias mp="mplayer"
alias mp-overscan="mplayer -vf scale=320:240,crop=288:216 -aspect 4:3"
alias mp-monaural="mplayer -af pan=1:0.5:0.5"
alias yt="youtube-viewer"
alias wx="$HOME/scripts/weather.sh | $PAGER"
alias wx-radar="$HOME/scripts/wx-radar.sh"
alias tweet-uptime="$HOME/scripts/tweet-uptime.sh"
alias elinks-porn="elinks -config-file ~/.elinks/elinks.conf -no-home"
alias c="clear"
alias dRR="screen -dRR"
alias sprungecap="$HOME/scripts/sprungecap"
alias scrompload="$HOME/scripts/scrompload"
alias genesis="ssh -t woddf2@genesis screen -dRR"
alias senator="ssh -t woddf2@senator screen -dRR"
alias maharani="ssh -tC woddf2@66.175.208.202 screen -dRR"

if [[ -z "$DISPLAY" ]] && [[ -z "$STY" ]]; then
	alias x="exec startx"
	alias wm="$HOME/scripts/select-wm"
fi

# If this were less naïve, it would check $TERMCAP to see if it can do title.
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
