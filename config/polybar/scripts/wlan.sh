#!/bin/bash

site=google.com
netapp=nm-connection-editor
if (timeout 2 ping -c 1 $site) &>/dev/null; then
    echo "%{A1:$netapp:} $(ping -c 1 $site | grep time= | cut -d"=" -f4)%{A}"
else
    echo "%{A1:$netapp:} offline%{A}"
fi
