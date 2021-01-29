#!/bin/sh

# A dwm_bar function to show the current network connection
# Joe Standring <git@joestandring.com>
# lisp3r <git@lisp3r.com>
# GNU GPLv3

# Dependencies: nmcli

dwm_network() {
    wifi_icon=
    wifi=$(nmcli connection show | grep -v -e "--" | grep -v NAME | awk '{ if ($3 == "wifi") {print $1} }')

    [ -n "$wifi" ] &&
        printf "%s%s %s%s" "$SEP1" $wifi_icon "$wifi" "$SEP2"
}

dwm_network