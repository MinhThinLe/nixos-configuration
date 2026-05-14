#!/usr/bin/env bash

SYSFS_PATH="/devices/platform/i8042/serio0/input/input0"
DEV_PATH="/sys/$SYSFS_PATH/inhibited"

case "$1" in
    disable)
        echo 1 | tee "$DEV_PATH"
        ;;
    enable)
        echo 0 | tee "$DEV_PATH"
        ;;
    *)
        echo "Usage $0 {enable|disable}" >&2
        exit 1
        ;;
esac
