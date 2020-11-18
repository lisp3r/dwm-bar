#!/bin/sh

# A dwm_bar function that displays the current keyboard layout
# lisp3r
# GNU GPLv3


EN_MASK="00000000"
RU_MASK="00001000"

dwm_keyboard () {
    KEY_MASK=$(xset -q|grep LED| awk '{ print $10 }')

    printf "%s" "$SEP1"
    if [ "$KEY_MASK" = "$EN_MASK" ]; then
        printf "%s" "en"
    elif [ "$KEY_MASK" = "$RU_MASK" ]; then
        printf "%s" "ru"
    fi
    printf "%s\n" "$SEP2"
}

dwm_keyboard
