# woddfellow2's bash Config
# by woddfellow2 | http://wlair.us.to/

# Check for an interactive session
[ -z "$PS1" ] && return

# Prompt stolen from Gentoo
PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "

# vi/Vim FTW
set -o vi
export EDITOR="vim"

# Aliases
alias ls='ls --color=auto'
alias grep="grep --color=auto"
alias colours="$HOME/scripts/colours.sh"
alias flv="$HOME/scripts/flash-video.sh"
alias p3="ping -c 3"
alias mp-overscan="mplayer -vf scale=320:240,crop=288:216 -aspect 4:3"
alias mp-monaural="mplayer -af pan=1:0.5:0.5"
alias yt="youtube-viewer"
alias wx="$HOME/scripts/weather.sh | less"
alias wx-radar="$HOME/scripts/wx-radar.sh"
alias tweet-uptime="$HOME/scripts/tweet-uptime.sh"
alias elinks-porn="elinks -config-file ~/.elinks/elinks.conf -no-home"
alias x="startx & exit"
alias xx="startx ~/.xinitrc-fvwm & exit"
alias c="clear"
alias dRR="screen -dRR"
alias sxp="screen -x -p"
alias sx="screen -x"
alias sls="screen -ls"
alias e="emacsclient -alternate-editor=\"\" -nw"

# Nasty hack involving screen and 256-colour terminal
if [[ "$TERM" =~ "256color" ]]; then
	export SCREENRC="$HOME/.screenrc-256color"
fi
