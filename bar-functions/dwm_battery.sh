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

icon_full=""
icon_three_quarters=""
icon_half=""
icon_quarter=""
icon_empty=""

dwm_battery () {
    bat_st="$(cat /sys/class/power_supply/BAT0/status)"
    bat_cap="$(cat /sys/class/power_supply/BAT0/capacity)"

    if [[ bat_cap -le 10 ]]; then
        icon=$icon_empty
    elif [[ bat_cap -gt 10 && bat_cap -le 25 ]]; then
        icon=$icon_quarter
    elif [[ bat_cap -gt 25 && bat_cap -le 50 ]]; then
        icon=$icon_half
    elif [[ bat_cap -gt 50 && bat_cap -le 90 ]]; then
        icon=$icon_three_quarters
    elif [[ bat_cap -gt 90 && bat_cap -le 100 ]]; then
        icon=$icon_full
    fi

    printf "%s" "$SEP1"
    printf "%s %s%%" $icon "${bat_cap}"
    # printf "%s %s%% %s" $icon "${bat_cap}" "${batt_states[$bat_st]}"
    printf "%s" "$SEP2"

}

dwm_battery
