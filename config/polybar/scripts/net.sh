#!/bin/bash

wireless='wlp0s20f3'

if [ "$(/usr/sbin/ifconfig | grep "$wireless" -A 1 | tail -n 1 | awk '{print $1}')" = "inet" ]
then
    net=$(/usr/sbin/ifconfig | grep "$wireless" -A 1 | tail -n 1 | awk '{print $2}')
fi

case $1 in
    "show-ip")
        echo -e "%{F#FFFFFF}  ${net}%{u-}"
        ;;
    "check_connection")
        ping -c 2 archlinux.org > /dev/null 2>&1
        if [ "$(echo $?)" != "0" ]
        then
            echo -e "%{F#BF1811} Disconect%{-u}"
        else
            echo -e "%{F#FFFFFF}  Connect%{u-}"
        fi
        ;;
    *)
        echo "x"
        ;;
esac
