#!/usr/bin/env bash
SINK="@DEFAULT_SINK@"

if [[ "$1" == "toggle" ]]; then
    pactl set-sink-mute "$SINK" toggle
fi

VOLUME=$(pactl get-sink-volume "$SINK" | grep -oP '\d+%' | head -n1)
MUTED=$(pactl get-sink-mute "$SINK" | awk '{print $2}')
VOL_NUM=${VOLUME%\%}

if (( VOL_NUM > 100 )); then
    pactl set-sink-volume "$SINK" 100%
    VOL_NUM=100
    VOLUME="100%"
fi

if [[ "$MUTED" == "yes" ]]; then
    notify-send -a "Volume" -h string:x-canonical-private-synchronous:volume "Volume: Muted"
    exit 0
fi

notify-send -a "Volume" -h string:x-canonical-private-synchronous:volume "Volume: $VOLUME"
