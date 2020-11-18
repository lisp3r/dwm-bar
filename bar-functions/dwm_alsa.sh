#!/bin/sh

# A dwm_bar function to show the master volume of ALSA
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: alsa-utils

icon_mute=""
icon_sound=""

dwm_alsa () {
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    printf "%s" "$SEP1"
    if [ "$VOL" -eq 0 ]; then
        printf $icon_mute
    else
        printf "%s %s%%" $icon_sound "$VOL"
    fi
    printf "%s" "$SEP2"
}

dwm_alsa
