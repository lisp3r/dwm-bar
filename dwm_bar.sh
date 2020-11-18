#!/bin/sh

# A modular status bar for dwm
# Joe Standring <git@joestandring.com>
# lisp3r <git@lisp3r.com>
# GNU GPLv3

# Dependencies: xorg-xsetroot, FontAwesome

# Store the directory the script is running from

LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

# Add your module here

MODULE_FOLDER="$DIR/bar-functions"

# Change the charachter(s) used to seperate modules. If two are used, they will be placed at the start and end.

export SEP1=" "
export SEP2=" "

load_module() {
    . $MODULE_FOLDER/$1.sh
    func=`declare -f $1 > /dev/null; echo $?`

    if [ ! -z "$func" ]; then
       BAR="${BAR}$($1)"
    fi
}

# Import the modules

load_module 'dwm_battery'
load_module 'dwm_alsa'
load_module 'dwm_keyboard'
load_module 'dwm_weather'
load_module 'dwm_date'
load_module 'dwm_bluetooth'
load_module 'dwm_openvpn'
load_module 'dwm_network'

# Update dwm status bar every second

while true
do
    xsetroot -name "$BAR"
    sleep 1
done
