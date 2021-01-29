#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# lisp3r <git@lisp3r.com>
# GNU GPLv3

dwm_battery () {
    # declare -A batt_states=( ["Unknown"]="unkn"
    #                          ["Charging"]="chrg"
    #                          ["Discharging"]="dischr"
    #                          ["Not charging"]="nchrg"
    #                          ["Full"]="full")

    icon_full=
    icon_three_quarters=
    icon_half=
    icon_quarter=
    icon_empty=

    BAT_STAT="/sys/class/power_supply/BAT0"

    bat_st=$(cat $BAT_STAT/status)
    bat_cap=$(cat $BAT_STAT/capacity)

    if [ "$bat_cap" -le 10 ]; then
        icon=$icon_empty
        if [ "$bat_st" != 'Charging' ]; then
            notify-send "               You are about to loosing your job! Plug in a power cabel!!"
        fi
    elif [ "$bat_cap" -gt 10 ] && [ "$bat_cap" -le 25 ]; then
        icon=$icon_quarter
    elif [ "$bat_cap" -gt 25 ] && [ "$bat_cap" -le 50 ]; then
        icon=$icon_half
    elif [ "$bat_cap" -gt 50 ] && [ "$bat_cap" -le 90 ]; then
        icon=$icon_three_quarters
    elif [ "$bat_cap" -gt 90 ] && [ "$bat_cap" -le 100 ]; then
        icon=$icon_full
    fi

    printf "%s" "$SEP1"
    printf "%s %s%%" $icon "${bat_cap}"
    # printf "%s %s%% %s" $icon "${bat_cap}" "${batt_states[$bat_st]}"
    printf "%s" "$SEP2"

}

dwm_battery