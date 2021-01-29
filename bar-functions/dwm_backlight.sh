#!/bin/sh

# A dwm_bar module to display the current backlight brighness with xbacklight
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: xbacklight

dwm_backlight () {
    backlight_icon=
    printf "%s%s %.0f%s" "$SEP1" $backlight_icon "$(xbacklight)" "$SEP2"
}

dwm_backlight