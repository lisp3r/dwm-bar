#!/bin/sh

# A dwm_bar function to show mounted NFS shares
# lisp3r <git@lisp3r.com>
# GNU GPLv3


dwm_nfs() {
    storage_icon=

    shares=`mount -l | grep nfs | mount -l | grep nfs | awk '{ print $3" ("$1")" }'`

    if [ ! -z "$shares" ]; then
        printf "%s %s %s %s" "$SEP1"
        printf "%s %s" $storage_icon "$shares"
        printf "%s" "$SEP2"
    fi
}

dwm_nfs