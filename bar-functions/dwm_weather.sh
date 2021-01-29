#!/bin/sh

# A dwm_bar function to print the weather from wttr.in
# lisp3r
# GNU GPLv3


OUTPUT_DIR="/tmp"
WEATHER_DESCR=$OUTPUT_DIR/weather_descr
WEATHER_CEL=$OUTPUT_DIR/weather_cel

ICONS="$DIR/misc/weather_icons.json"

dwm_weather() {
    weather_descr=$(cat $WEATHER_DESCR)
    weather_cel=$(cat $WEATHER_CEL)

    curr_hour=`date '+%H'`
    if [[ $curr_hour -lt 21 && $curr_hour -gt 6 ]]; then
        icon=$(cat $ICONS | jq ".weather.weather_day.\"$weather_descr\"" | tr -d '"')
        #icon=${weather_day[$weather_descr]}
    else
        #icon=${weather_night[$weather_descr]}
        icon=$(cat $ICONS | jq ".weather.weather_night.\"$weather_descr\"" | tr -d '"')
    fi

    if [ ! -z "$weather_descr" ]; then
        printf "%s" "$SEP1"
        printf "%s %s°C" $icon $weather_cel
        printf "%s" "$SEP2"
    fi
}

dwm_weather