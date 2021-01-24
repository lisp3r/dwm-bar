#!/bin/bash

# A dwm_bar function to show the current OpenVPN connection
# lisp3r <git@lisp3r.com>
# GNU GPLv3

dwm_openvpn() {
    openvpn_icon=
    no_connection_icon=

    service_name="openvpn-client@motayloremote.service"
    interface="tun0"

    systemctl is-active --quiet "$service_name"
    res=$(echo $?)

    if [ $res -eq 0 ]; then
        network_aval=`ping ns1.google.com -c 1 &> /dev/null`
        res=$(echo $?)
        printf "%s" "$SEP1"
        if [ $res -eq 0 ]; then
            ip=`ifconfig $interface | grep inet | grep -v inet6 | awk '{ print $2 }'`
            printf "%s %s" $openvpn_icon $ip
        else
            printf "%s %s" $openvpn_icon $no_connection_icon
        fi
        printf "%s" "$SEP2"
    fi
}

dwm_openvpn