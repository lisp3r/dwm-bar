#!/bin/sh

# A dwm_bar function to track WireGuard
# Joe Standring <git@joestandring.com>
# lisp3r <git@lisp3r.com>
# GNU GPLv3


dwm_wireguard () {
    wireguard_icon=
    no_connection_icon=

    service_name="wg-quick@wg0.service"

    systemctl is-active --quiet "$service_name" && {
        printf "%s" "$SEP1"
        # network avaliable?
        ping ns1.google.com -c 1 &> /dev/null && {
            ip=$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | tr -d '"')
            printf "%s %s" $wireguard_icon "$ip"
        } || printf "%s %s" $wireguard_icon $no_connection_icon
        printf "%s" "$SEP2"
    }
}

dwm_wireguard
