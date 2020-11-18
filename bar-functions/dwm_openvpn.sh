#!/bin/bash

# A dwm_bar function to show the current OpenVPN connection
# lisp3r <git@lisp3r.com>
# GNU GPLv3

icon=""

# Add your VPN device here
vpn_device="tun"

dwm_openvpn() {
    vpn=$(nmcli connection show | grep -v -e "--" | grep -v NAME | awk '{ if ($3 == "tun") {print $3} }')
    if [ $vpn == $vpn_device ]; then
        ip=$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | tr -d '"')
        printf "%s" "$SEP1"
        printf "%s %s | %s" $icon $vpn $ip
        printf "%s" "$SEP2"
    fi
}

dwm_openvpn
