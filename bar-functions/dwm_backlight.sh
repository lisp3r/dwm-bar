#!/bin/sh

# A dwm_bar module to display the current backlight brighness with xbacklight
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: xbacklight

dwm_backlight () {
    icon=
    printf "%s%s %.0f%s\n" "$SEP1" "$icon" "$(xbacklight)" "$SEP2"
}

dwm_backlight