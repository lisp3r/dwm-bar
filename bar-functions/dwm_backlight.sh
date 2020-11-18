#!/bin/sh

# A dwm_bar module to display the current backlight brighness with xbacklight
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: xbacklight

icon=""

dwm_backlight () {
    printf "%s%s %.0f%s\n" "$SEP1" "$icon" "$(xbacklight)" "$SEP2"
}
