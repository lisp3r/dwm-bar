#!/bin/sh

# A dwm_bar function to show the current network connection/SSID, private IP, and public IP
# Joe Standring <git@joestandring.com>
# lisp3r <git@lisp3r.com>
# GNU GPLv3

# Dependencies: nmcli
 wifi_icon=""

dwm_network() {
    wifi=$(nmcli connection show | grep -v -e "--" | grep -v NAME | awk '{ if ($3 == "wifi") {print $1} }')

    if [ ! -z "$wifi" ]; then
        printf "%s" "$SEP1"
        printf "%s %s" $wifi_icon "$wifi"
        printf "%s" "$SEP2"
    fi
}

dwm_network