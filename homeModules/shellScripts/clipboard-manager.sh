#!/usr/bin/env bash
if [ -z "$1" ]; then
    cliphist list # | sed 's/.*\t//'
else
    cliphist decode <<<"$1" | wl-copy
fi
