#!/bin/bash

# Get current profile
current=$(powerprofilesctl get)

if [ "$current" == "power-saver" ]; then
    powerprofilesctl set balanced
    notify-send -a "Power Profiles" -i "battery-good-symbolic" -u low "Power Mode" "Switched to Balanced"
elif [ "$current" == "balanced" ]; then
    powerprofilesctl set performance
    notify-send -a "Power Profiles" -i "power-profile-performance-symbolic" -u normal "Power Mode" "Switched to Turbo / Performance!"
else
    powerprofilesctl set power-saver
    notify-send -a "Power Profiles" -i "power-profile-power-saver-symbolic" -u low "Power Mode" "Switched to Power Saver"
fi
