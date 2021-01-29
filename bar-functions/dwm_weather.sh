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

    curr_hour=$(date '+%H')

    time="night"
    [ "$curr_hour" -lt 21 ] && [ "$curr_hour" -gt 6 ] && time='day'

    weather_icon=$(cat "$ICONS" | jq ".weather.weather_$time.\"$weather_descr\"" | tr -d '"')

    [ -n "$weather_descr" ] && 
        printf "%s%s %s°C%s" "$SEP1" "$weather_icon" "$weather_cel" "$SEP2"
}

dwm_weather