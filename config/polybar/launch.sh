#! /usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
external_monitor=HDMI-1

if [[ $(xrandr -q | grep "$external_monitor connected") ]]; then
    if [[ $DESKTOP_SESSION == "i3" || $DESKTOP_SESSION == "i3-with-shmlog" ]]; then
        polybar i3_main -r &
        polybar i3_secondary -r &
    elif [[ $DESKTOP_SESSION == "bspwm" ]]; then
        polybar bspwm_main -r &
        polybar bspwm_secondary -r &
        polybar bspwm_bottom -r &
    fi
else
    if [[ $DESKTOP_SESSION == "i3" || $DESKTOP_SESSION == "i3-with-shmlog" ]]; then
        polybar i3_main -r &
    elif [[ $DESKTOP_SESSION == "bspwm" ]]; then
        polybar bspwm_main -r &
        polybar bspwm_bottom -r &
    fi
fi

echo "Bars launched..."