#!/bin/sh

# A modular status bar for dwm
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: xorg-xsetroot, FontAwesome

# Import functions with "$include /route/to/module"
# It is recommended that you place functions in the subdirectory ./bar-functions and use: . "$DIR/bar-functions/dwm_example.sh"

# Store the directory the script is running from
LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

# Add FontAwesome icons instead of emodji

# Change the charachter(s) used to seperate modules. If two are used, they will be placed at the start and end.
export SEP1=" "
export SEP2=" "

# Import the modules
. "$DIR/bar-functions/dwm_battery.sh"
. "$DIR/bar-functions/dwm_weather.sh"
. "$DIR/bar-functions/dwm_date.sh"
. "$DIR/bar-functions/dwm_keyboard.sh"
. "$DIR/bar-functions/dwm_alsa.sh"
. "$DIR/bar-functions/dwm_network.sh"
. "$DIR/bar-functions/dwm_bluetooth.sh"
. "$DIR/bar-functions/dwm_openvpn.sh"

# Update dwm status bar every second
while true
do
    xsetroot -name "$(dwm_network)$(dwm_openvpn)$(dwm_bluetooth)$(dwm_date)$(dwm_weather)$(dwm_keyboard)$(dwm_alsa)$(dwm_battery)"
    sleep 1
done
