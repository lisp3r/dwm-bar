#!/bin/sh

# A dwm_bar function to track docker
# Joe Standring <git@joestandring.com>
# lisp3r <git@lisp3r.com>
# GNU GPLv3


dwm_docker () {
    docker_icon=

    service_name="docker.service"

    systemctl is-active --quiet "$service_name"
    res=$(echo $?)

    if [ $res -eq 0 ]; then
        # active
        printf "%s" "$SEP1"
        printf "%s" $docker_icon
        printf "%s" "$SEP2"
    fi
}

dwm_docker