#!/bin/sh

# woddfellow2's xinitrc (genesis)
# by woddfellow2 | http://wlair.us.to/

xrdb -merge ~/.Xdefaults &
xmodmap ~/.Xmodmap &

# Make Terminus work
xset +fp /usr/share/fonts/local &
xset fp rehash &

# Screen saver
xset s 60 &
~/apps/xssstate/xsidle.sh slock &

# URxvt daemon
urxvtd -q -o -f &

# dwmstatus
~/apps/dwmstatus &

# Set wallpaper
xsetroot -solid black &

# Banish pointer <https://github.com/woddfellow2/banish>
banish &

# ssh-agent (Inspired by and stolen from OpenBSD)
id1=$HOME/.ssh/identity
id2=$HOME/.ssh/id_dsa
id3=$HOME/.ssh/id_rsa
id4=$HOME/.ssh/id_ecdsa
if [ -x /usr/bin/ssh-agent ] && [ -f $id1 -o -f $id2 -o -f $id3 -o -f $id4 ];
then
	eval $(ssh-agent -s)
	ssh-add < /dev/null
fi

# Start the WM
until ~/.dwm/dwm; do true; done

# Kill ssh-agent upon exiting
if [ "$SSH_AGENT_PID" ]; then
	ssh-add -D < /dev/null
	eval $(ssh-agent -s -k)
fi
