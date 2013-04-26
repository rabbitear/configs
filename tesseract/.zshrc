# woddfellow2's zsh Config (Meskarune's VPS)
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
export PS1="%{$fg_bold[magenta]%}%c%{$reset_color%} ${cmdstatus} "

# vi Keybindings
bindkey -v

# Make Exiting Difficult
if [[ -n "$STY" ]] && [[ "$WINDOW" == "0" ]]; then
	setopt ignoreeof
	alias exit="false"
fi

# Default Applications
export EDITOR="vim"

# Aliases
alias ls='ls --color=auto'
alias grep="grep --color=auto"
alias p3="ping -c 3"
alias c="clear"
alias dRR="screen -dRR"
alias lessaot="less $HOME/irclogs/freenode/#archlinux-offtopic.*.log"
alias lessxkcd="less $HOME/irclogs/foonetic/#xkcd.*.log"
alias lesstwister="less $HOME/irclogs/twister/#main.*.log"
alias lessbmg="less $HOME/irclogs/systemnet/#bulbagarden.*.log"
alias lessdefocus="less $HOME/irclogs/freenode/#defocus.*.log"
alias lesshh="less $HOME/irclogs/freenode/#hackerhaven.*.log"
alias lesswl="less $HOME/irclogs/foonetic/#wlair.*.log"
alias tailaway="tail $HOME/irclogs/away.log"
alias wxtul="$HOME/scripts/wx-tulsa.sh | less"
alias wxrdd="$HOME/scripts/wx-redding.sh | less"
alias w="w -f"
alias blog="$HOME/scripts/update-blog"
