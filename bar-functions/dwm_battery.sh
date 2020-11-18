#!/bin/sh

# A dwm_bar function to read the battery level and status
# lisp3r
# GNU GPLv3

declare -A batt_states=( ["Unknown"]="unkn"
                         ["Charging"]="chrg"
                         ["Discharging"]="dischr"
                         ["Not charging"]="nchrg"
                         ["Full"]="full")

dwm_battery () {
    bat_st="$(cat /sys/class/power_supply/BAT0/status)"
    bat_cap="$(cat /sys/class/power_supply/BAT0/capacity)"

    printf "%s" "$SEP1"

    printf "%s%% %s" "${bat_cap}" "${batt_states[$bat_st]}"

    printf "%s\n" "$SEP2"
}

dwm_battery