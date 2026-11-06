# SPDX-License-Identifier: GPL-2.0-or-later
# Run the front panel before loading the standard Rockchip boot script.

test -n "${distro_bootpart}" || distro_bootpart=1

if load ${devtype} ${devnum}:${distro_bootpart} 0x09000000 ${prefix}h96max-early.scr; then
	source 0x09000000
else
	echo "H96 Max display script is unavailable"
fi

if load ${devtype} ${devnum}:${distro_bootpart} 0x0a000000 ${prefix}h96max-main.scr; then
	source 0x0a000000
else
	echo "H96 Max main boot script is unavailable"
fi
