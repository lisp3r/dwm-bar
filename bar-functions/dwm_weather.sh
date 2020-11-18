#!/bin/sh

# A dwm_bar function to print the weather from wttr.in
# lisp3r
# GNU GPLv3

OUTPUT_DIR="/tmp"
WEATHER_DESCR=$OUTPUT_DIR/weather_descr
WEATHER_CEL=$OUTPUT_DIR/weather_cel

declare -A weather_day=( ["Unknown"]=""
                         ["Sunny"]=""
                         ["PartlyCloudy"]=""
                         ["Cloudy"]=""
                         ["VeryCloudy"]=""
                         ["Fog"]="",
                         ["LightShowers"]="",
                         ["LightSleetShowers"]="",
                         ["LightSnowShowers"]="",
                         ["ThunderyShowers"]="",
                         ["HeavyShowers"]="",
                         ["HeavySnowShowers"]="",
                         ["ThunderySnowShowers"]="",
                         ["LightSnow"]="",
                         ["HeavySnow"]="",
                         ["LightRain" ]="",
                         ["LightSleet"]="",
                         ["HeavyRain"]="",
                         ["ThunderyHeavyRain"]="",
                        )

declare -A weather_night=( ["Unknown"]=""
                         ["Sunny"]=""
                         ["PartlyCloudy"]=""
                         ["Cloudy"]=""
                         ["VeryCloudy"]=""
                         ["Fog"]="",
                         ["LightShowers"]="",
                         ["LightSleetShowers"]="",
                         ["LightSnowShowers"]="",
                         ["ThunderyShowers"]="",
                         ["HeavyShowers"]="",
                         ["HeavySnowShowers"]="",
                         ["ThunderySnowShowers"]="",
                         ["LightSnow"]="",
                         ["HeavySnow"]="",
                         ["LightRain" ]="",
                         ["LightSleet"]="",
                         ["HeavyRain"]="",
                         ["ThunderyHeavyRain"]="",
                        )

dwm_weather() {
    weather_descr=`cat $WEATHER_DESCR`
    weather_cel=`cat $WEATHER_CEL`

    curr_hour=`date '+%H'`
    if [[ $curr_hour -lt 21 && $curr_hour -gt 6 ]]; then
        icon=${weather_day[$weather_descr]}
    else
        icon=${weather_night[$weather_descr]}
    fi

    printf "%s" "$SEP1"
    printf "%s %s" $icon $weather_cel
    printf "%s" "$SEP2"
}

dwm_weather