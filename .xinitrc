# woddfellow2's ~/.xinitrc
# by woddfellow2 | http://wlair.us.to/

# Screen saver
xset s 60 &
~/scripts/xsidle.sh slock &

xrdb -merge ~/.Xdefaults &
xmodmap ~/.Xmodmap &

# Make Terminus work
xset +fp /usr/share/fonts/local &
xset fp rehash &

# Set wallpaper
xsetroot -solid black &

# Banish pointer
banish &

# Status bar
~/apps/dwmstatus &

until ~/.dwm/dwm; do true; done

# vim: ft=sh
