#!/bin/sh

# A dwm_bar function to track WireGuard
# Joe Standring <git@joestandring.com>
# lisp3r <git@lisp3r.com>
# GNU GPLv3


dwm_wireguard () {
    wireguard_icon=
    no_connection_icon=

    service_name="wg-quick@wg0.service"

    systemctl is-active --quiet "$service_name"
    res=$(echo $?)

    if [ $res -eq 0 ]; then
        network_aval=`ping ns1.google.com -c 1 &> /dev/null`
        res=$(echo $?)
        printf "%s" "$SEP1"
        if [ $res -eq 0 ]; then
            ip=$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | tr -d '"')
            printf "%s %s" $wireguard_icon $ip
        else
            printf "%s %s" $wireguard_icon $no_connection_icon
        fi
        printf "%s" "$SEP2"
    fi
}

dwm_wireguard
