#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# lisp3r <git@lisp3r.com>
# GNU GPLv3

declare -A batt_states=( ["Unknown"]="unkn"
                         ["Charging"]="chrg"
                         ["Discharging"]="dischr"
                         ["Not charging"]="nchrg"
                         ["Full"]="full")

bat_icon=""

dwm_battery () {
    bat_st="$(cat /sys/class/power_supply/BAT0/status)"
    bat_cap="$(cat /sys/class/power_supply/BAT0/capacity)"

    printf "%s" "$SEP1"
    printf "%s %s%% %s" $bat_icon "${bat_cap}" "${batt_states[$bat_st]}"
    printf "%s" "$SEP2"
}

dwm_battery
