#!/bin/bash

wireless='wlp0s20f3'

if [ "$(/usr/sbin/ifconfig | grep "$wireless" -A 1 | tail -n 1 | awk '{print $1}')" = "inet" ]
then
    net=$(/usr/sbin/ifconfig | grep "$wireless" -A 1 | tail -n 1 | awk '{print $2}')
fi

case $1 in
    "show-ip")
        echo $net
        ;;
    "check_connection")
        ping -c 4 archlinux.org > /dev/null 2>&1
        if [ "$(echo $?)" != "0" ]
        then
            echo "Disconect"
        else
            echo "Connect"
        fi
        ;;
    *)
        echo "x"
        ;;
esac
