#!/bin/sh

# A dwm_bar function that shows the current date and time
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Date is formatted like like this: "[Mon 01-01-00 00:00:00]"

dwm_date () {
    date_icon=

    printf "%s" "$SEP1"
    printf "%s %s" $date_icon "$(date "+%a %d-%m-%y %T")"
    printf "%s" "$SEP2"
}

dwm_date