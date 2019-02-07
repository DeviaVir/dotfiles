#!/bin/sh
# vim:ts=4:sw=4:expandtab

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi
[ -x "/home/chase/.scripts/wake.sh" ] && . "/home/chase/.scripts/wake.sh"

xrdb -load ~/.Xresources

xset s off -dpms
xset -dpms
xset dpms 0 0 0
xset s noblank

xset r rate 250 30
setxkbmap us -variant intl

(xrandr | grep -q "DP-0 connected") && xrandr --output DP-0 --mode 3440x1440 --rate 100 --primary

exec i3
