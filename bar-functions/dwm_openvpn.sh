#!/bin/bash

# A dwm_bar function to show the current OpenVPN connection
# lisp3r <git@lisp3r.com>
# GNU GPLv3

dwm_openvpn() {
    openvpn_icon=
    no_connection_icon=

    service_name="openvpn-client@motayloremote.service"
    interface="tun0"

    systemctl is-active --quiet "$service_name" && {
        printf "%s" "$SEP1"
        # network avaliable?
        ping ns1.google.com -c 1 &> /dev/null && {
            ip=$(ifconfig $interface | grep inet | grep -v inet6 | awk '{ print $2 }')
            printf "%s %s" $openvpn_icon "$ip"
        } || printf "%s %s" $openvpn_icon $no_connection_icon
        printf "%s" "$SEP2"
    }
}

dwm_openvpn