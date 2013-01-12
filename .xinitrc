# woddfellow2's ~/.xinitrc
# by woddfellow2 | http://wlair.us.to/

# xautolock
xautolock -time 1 -locker slock &

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
