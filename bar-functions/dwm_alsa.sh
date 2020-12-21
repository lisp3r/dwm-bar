#!/bin/sh

# A dwm_bar function to show the master volume of ALSA
# Joe Standring <git@joestandring.com>
# lisp3r <git@lisp3r.com>
# GNU GPLv3

# Dependencies: alsa-utils

dwm_alsa () {
    icon_mute=
    icon_sound=

    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    OFF=$(amixer get Master | tail -n1 | grep off)
    printf "%s" "$SEP1"
    if [[ "$VOL" -eq 0 ]] || [[ ! -z $OFF ]]; then
        printf $icon_mute
    else
        printf "%s %s%%" $icon_sound "$VOL"
    fi
    printf "%s" "$SEP2"
}

dwm_alsa