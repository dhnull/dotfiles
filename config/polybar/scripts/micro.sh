#!/usr/bin/bash

DEFAULT_SOURCE_INDEX=$(pacmd list-sources | grep  "\* index:" | cut  -d' ' -f 5)
VOLUME=$(pacmd list-sources | grep "index: $(pacmd list-sources | grep "\* index:" | cut -d' ' -f 5)" -A 7 | grep "volume" | awk -F/ '{print $2}' | tr '%' ' ' | awk '{print $1}')
VOLUMEE=$(pacmd list-sources | grep "index: $(pacmd list-sources | grep "\* index:" | cut -d' ' -f 5)" -A 7 | grep "volume" | awk -F/ '{print $2}' | awk '{print $1}')

display_volume() {
    volume=$(pacmd list-sources | grep "index: $DEFAULT_SOURCE_INDEX" -A 7 | grep "volume" | awk -F/ '{print $2}')
    mute=$(pacmd list-sources | grep "index: $DEFAULT_SOURCE_INDEX" -A 11 | grep "muted")

    if [ -z "$volume" ]; then
        echo "no"
    else
        volume="${volume//[[:blank:]]/}"
        if [[ "$mute" == *"yes"* ]]; then
            echo -e "%{F#CC241D} muted%{F#e2ee6a}%{-u}"
        elif [[ "$mute" == *"no"* ]];  then
            echo "%{F#D5C4A1} $volume%{F#e2ee6a}%{-u}"
        else
            echo ""
        fi
    fi
}

case $1 in
    "show-vol")
        display_volume
        ;;
    "inc-vol")
        pactl set-source-volume "$DEFAULT_SOURCE_INDEX" +5%
        dunstify "Micro Up" "$VOLUMEE" -h int:value:"$VOLUME" -u low -r 7979
        display_volume
        ;;
    "dec-vol")
        pactl set-source-volume "$DEFAULT_SOURCE_INDEX" -5%
        dunstify "Micro Down" "$VOLUMEE" -h int:value:"$VOLUME" -u low -r 7979
        display_volume
        ;;
    "mute-vol")
        pactl set-source-mute "$DEFAULT_SOURCE_INDEX" toggle
        dunstify "Micro Muted" "$VOLUMEE" -h int:value:"$VOLUME" -u low -r 7979
        display_volume
        ;;
    *)
        echo "Invalid script option"
        ;;
esac
