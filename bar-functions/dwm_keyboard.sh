#!/bin/sh

# A dwm_bar function that displays the current keyboard layout
# Joe Standring <git@joestandring.com>
# lisp3r <git@lisp3r.com>
# GNU GPLv3

EN_MASK="00000000"
RU_MASK="00001000"

declare -A keyboard_states=( ["00000000"]="en"
                         ["00001000"]="ru")

icon=""

dwm_keyboard () {
    key_mask=$(xset -q|grep LED| awk '{ print $10 }')

    printf "%s" "$SEP1"
    printf "%s %s" $icon "${keyboard_states[$key_mask]}"
    printf "%s" "$SEP2"
}
