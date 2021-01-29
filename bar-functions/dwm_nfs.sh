#!/bin/sh

# A dwm_bar function to show mounted NFS shares
# lisp3r <git@lisp3r.com>
# GNU GPLv3


dwm_nfs() {
    storage_icon=

    shares=$(mount -l | grep nfs | mount -l | grep nfs | awk '{ print $3" ("$1")" }')

    [ -n "$shares" ] &&
        printf "%s%s %s%s" "$SEP1" $storage_icon "$shares" "$SEP2"
}

dwm_nfs