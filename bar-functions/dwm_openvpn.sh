#!/bin/bash

# A dwm_bar function to show the current OpenVPN connection
# lisp3r <git@lisp3r.com>
# GNU GPLv3

dwm_openvpn() {
    icon=

    # Add your VPN device here
    vpn_device="tun"

    vpn=$(nmcli connection show | grep -v -e "--" | grep -v NAME | awk '{ if ($3 == "tun") {print $3} }')

    if [[ $vpn == $vpn_device ]]; then
        network_aval=`ping ns1.google.com -c 1 &> /dev/null`
        res=$(echo $?)
        printf "%s" "$SEP1"
        if [ $res -eq 0 ]; then
            ip=$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | tr -d '"')
            printf "%s %s | %s" $icon $vpn $ip
        else
            printf "%s %s | %s" $icon $vpn "no connection"
        fi
        printf "%s" "$SEP2"
    fi
}

dwm_openvpn