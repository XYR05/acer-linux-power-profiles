# Acer Linux Power Profiles

A custom out-of-tree Linux kernel module and user-space script to enable Acer Predator (specifically PH16-72) hardware features on Linux.

This project enables support for Acer-specific thermal profiles (Turbo, Performance, Balanced, Quiet, Eco) and integrates them with `powerprofilesctl`.

## Features
- Kernel-level support for Acer Predator-v4 hardware features.
- Seamless mapping of Acer thermal states to Linux platform profiles.
- Automated cycle script (`cycle_power.sh`) with desktop notifications to easily switch between Turbo, Balanced, and Power Saver modes.
- Fixed for modern Linux kernels (7.2+) by replacing deprecated `strncpy` calls.

## Installation

### 1. Compile the Kernel Driver
You will need your kernel headers and `make` installed.

```bash
make clean
make
sudo make install
sudo modprobe linuwu_sense
```

*(You may also want to run `sudo systemctl restart power-profiles-daemon` so it detects the new hardware capabilities).*

### 2. Set up the Power Cycle Script
You can use `cycle_power.sh` to quickly toggle between performance modes. 
Map it to a keyboard shortcut (e.g. `Super + Alt + P`) in your window manager (Hyprland, Sway, GNOME, etc.).

```bash
chmod +x cycle_power.sh
./cycle_power.sh
```

## Credits
This driver is a fork of [Linuwu-Sense](https://github.com/0x7375646F/Linuwu-Sense) patched to build on modern kernels (7.x+).