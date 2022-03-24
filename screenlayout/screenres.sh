#!/bin/bash

external_monitor=HDMI-1

if [[ $(xrandr -q | grep "$external_monitor connected") ]]; then
    xrandr --output LVDS-1 --mode 1366x768 --pos 1920x215 --rotate normal --output VGA-1 --off --output HDMI-1 --primary --mode 1920x1200 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off

else
    xrandr --output LVDS-1 --primary --mode 1366x768 --rotate normal --output VGA-1 --off --output HDMI-1 --off --output DP-1 --off --output DP-2 --off
fi