#!/bin/sh

# A dwm_bar function that shows the current date and time
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Date is formatted like like this: "[Mon 01-01-00 00:00:00]"

dwm_date () {
    date_icon=
    time_icon=

    date_time=`date "+%b %d (%A) |%T"`
    date=`echo "$date_time" | awk -F '|' '{ print $1 }'`
    time=`echo "$date_time" | awk -F '|' '{ print $2 }'`

    printf "%s" "$SEP1"
    printf "%s %s" $date_icon "$date" $time_icon "$time"
    printf "%s" "$SEP2"
}

dwm_date