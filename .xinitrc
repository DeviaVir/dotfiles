#!/bin/sh
# vim:ts=4:sw=4:expandtab

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrdb -load ~/.Xresources

xset s off
xset -dpms
xset s noblank

xset r rate 250 30
setxkbmap us -variant intl

export $(dbus-launch)

exec i3
compton &
