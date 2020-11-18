#!/bin/bash

OUTPUT_DIR="/tmp"
WEATHER_DESCR=$OUTPUT_DIR/weather_descr
WEATHER_CEL=$OUTPUT_DIR/weather_cel

connection=`nmcli dev | grep "connected"`

if [[ -n "$connection" ]]; then

    avaliability=`curl -o /dev/null -s -w "%{http_code}\n" wttr.in/?format=1`

    if [ $avaliability -eq "200" ]; then
        # curl -s wttr.in/?format=j1 | jq '. | {descr: .current_condition[0].weatherDesc[0].value, cels: .current_condition[0].temp_C}'
        weather_json=`curl -s wttr.in/?format=j1`
        weather_descr=`echo $weather_json | jq '.current_condition[0].weatherDesc[0].value'`
        weather_cel=`echo $weather_json | jq '.current_condition[0].temp_C'`

        echo $weather_descr | tr -d '"' > $WEATHER_DESCR
        echo $weather_cel | tr -d '"' > $WEATHER_CEL
    fi

else
    exit 0
fi
