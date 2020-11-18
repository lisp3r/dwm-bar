#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

declare -A batt_states=( ["Unknown"]="unkn"
                         ["Charging"]="chrg"
                         ["Discharging"]="dischr"
                         ["Not charging"]="nchrg"
                         ["Full"]="full")

battery_data="/sys/class/power_supply/BAT0"

dwm_battery () {
    bat_st="$(cat $battery_data/status)"
    bat_cap="$(cat $battery_data/capacity)"

    printf "%s" "$SEP1"

    printf "%s%% %s" "${bat_cap}" "${batt_states[$bat_st]}"

    printf "%s\n" "$SEP2"
}

dwm_battery