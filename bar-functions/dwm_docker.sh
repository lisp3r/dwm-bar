#!/bin/sh

# A dwm_bar function to track docker
# Joe Standring <git@joestandring.com>
# lisp3r <git@lisp3r.com>
# GNU GPLv3


dwm_docker () {
    docker_icon=

    service_name="docker.service"

    systemctl is-active --quiet "$service_name" &&
        printf "%s%s%s" "$SEP1" $docker_icon "$SEP2"
}

dwm_docker