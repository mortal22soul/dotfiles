#! /usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar

if [[ $DESKTOP_SESSION == "i3" || $DESKTOP_SESSION == "i3-with-shmlog" ]]; then
    polybar main -r &
    polybar secondary -r &
elif [[ $DESKTOP_SESSION == "bspwm" ]]; then
    polybar main -r &
    polybar secondary -r &
    polybar bottom -r &
fi

echo "Bars launched..."