# woddfellow2's zsh Config
# by woddfellow2 | http://wlair.us.to/

zstyle :compinstall filename '~/.zshrc'

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Report background job status immediately
setopt notify

# Do not cd if a command does not exist, or beep on error
unsetopt autocd beep

# Auto-completion
autoload -Uz compinit
compinit

# Prompt	
autoload -U colors && colors
local cmdstatus="%(?,%{$fg_bold[blue]%}%#%{$reset_color%},%{$fg_bold[red]%}%#%{$reset_color%})"
export PS1="%{$fg_bold[green]%}%c%{$reset_color%} ${cmdstatus} "

# vi Keybindings
bindkey -v

# Make Exiting Difficult
setopt ignoreeof

if [[ -n "$TMUX" ]] && [[ "$TMUX_PANE" == "%0" ]]; then
	alias exit="false"
fi

# Default Applications
export EDITOR="vim"
export PAGER="less"

# Aliases
alias ls="ls --color=auto"
alias grep="grep --color=auto"
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
alias sprungecap="$HOME/scripts/sprungecap"
alias scrompload="$HOME/scripts/scrompload"
alias colours="$HOME/scripts/colours.sh"
alias genesis="ssh -t woddf2@genesis screen -dRR"
alias senator="ssh -t woddf2@senator screen -dRR"
alias maharani="ssh -tC woddf2@66.175.208.202 screen -dRR"

if [[ -z "$DISPLAY" ]] && [[ -z "$TMUX" ]]; then
	alias x="exec startx"
fi