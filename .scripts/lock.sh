#!/bin/bash
scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png

if [[ -f $HOME/.icons/lock.png ]]
then
	 convert /tmp/screen.png $HOME/.icons/lock.png -gravity center -composite -matte /tmp/screen.png
fi

# dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
i3lock -u -i /tmp/screen.png -c 000000
rm /tmp/screen.png
