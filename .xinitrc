# woddfellow2's ~/.xinitrc
# by woddfellow2 | http://wlair.us.to/

xrdb -merge ~/.Xdefaults &

# xautolock
xautolock -time 1 -locker slock &

# Set wallpaper
feh --bg-scale ~/img/twc/IS\ Graphics/domesticAlmanac.tif &

# Banish pointer
banish &

until ~/.dwm/dwm; do true; done

# vim: ft=sh
