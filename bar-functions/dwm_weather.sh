#!/bin/sh

# A dwm_bar function to print the weather from wttr.in
# lisp3r
# GNU GPLv3

OUTPUT_FILE="/tmp/.wthr_output"

dwm_weather() {
    printf "%s" "$SEP1"
    printf "%s" "$(cat $OUTPUT_FILE)"
    printf "%s\n" "$SEP2"
}

dwm_weather
