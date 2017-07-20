#!/bin/sh
# vim:ts=4:sw=4:expandtab

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrdb -load ~/.Xresources

xset s off -dpms
xset -dpms
xset dpms 0 0 0
xset s noblank

xset r rate 250 30
setxkbmap us -variant intl

exec i3
