#!/bin/sh

# A dwm_bar function to print the weather from wttr.in
# lisp3r
# GNU GPLv3

function dwm_bluetooth() {

stat=$(~/go/bin/sluez status | grep connected=true);

res=''

icon=""

if [ $? -eq 0 ]; then
  res=$(echo "$stat" | awk -F 'alias=' '{print $2}' | awk -F '"' '{print $2}')
fi

if [ ! -z "$res" ]; then
    printf "%s" "$SEP1"
    printf "%s %s%s" $icon "${res}"
    printf "%s" "$SEP2"
fi

}
