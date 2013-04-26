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
export PS1="%{$fg_bold[yellow]%}%c%{$reset_color%} ${cmdstatus} "

# vi Keybindings
bindkey -v

# Make exiting difficult in the first shell in tmux
if [[ -n "$TMUX" ]] && [[ "$TMUX_PANE" == "%0" ]]; then
	alias exit="false"
	alias logout="false"
	setopt ignoreeof
fi

# Default Applications
export EDITOR="vim"

# Aliases
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias p3="ping -c 3"
alias mp="mplayer"
alias mp-overscan="mplayer -vf scale=320:240,crop=288:216 -aspect 4:3"
alias mp-monaural="mplayer -af pan=1:0.5:0.5"
alias yt="youtube-viewer"
alias wx="$HOME/scripts/wx | less"
alias wx-radar="$HOME/scripts/wx-radar"
alias elinks-porn="elinks -config-file ~/.elinks/elinks.conf -no-home"
alias c="clear"
alias sprunge="curl -F sprunge=@- http://sprunge.us/"
alias volunteer="ssh -t woddf2@volunteer screen -dRR"
alias tesseract="ssh -tC woddf2@69.164.219.208 screen -dRR"

if [[ -z "$DISPLAY" ]] && [[ -z "$TMUX" ]]; then
	alias x="exec startx"
fi
