#!/bin/sh

if  [ -e /run/user/1000/pipectl.1000.wl-present.pipe ]; then
    rm /run/user/1000/pipectl.1000.wl-present.pipe
fi
sleep 0.5
niri msg action focus-monitor "eDP-1" && \
    wl-present mirror eDP-1 --fullscreen-output HDMI-A-1 --fullscreen &
