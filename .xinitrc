# woddfellow2's xinitrc (genesis)
# by woddfellow2 | http://wlair.us.to/

xrdb -merge ~/.Xdefaults &
xmodmap ~/.Xmodmap &

# Make Tamsyn and Terminus work
xset +fp /usr/share/fonts/local &
xset fp rehash &

# xautolock/slock
xautolock -time 1 -locker "slock" &

# URxvt daemon
urxvtd -q -o -f &

# dwmstatus
~/apps/dwmstatus &

# Pointless eye candy is pointless
feh --bg-center ~/img/01906_stabilis_1440x900.jpg &

# Banish pointer <https://github.com/woddfellow2/banish>
banish &

until ~/.dwm/dwm; do true; done
