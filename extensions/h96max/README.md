# H96 Max RK3528

Native Armbian extension for the H96 Max RK3528 board.

The board DTS is installed through the rockchip64-7.3 archive's
dts-directories and auto-patch-dt-makefile configuration.

RK3528 TSADC support is supplied by Armbian's existing rk3528-thermal.patch.
The H96 SoC fragment intentionally does not redefine the TSADC node.

The RK3528 HDMI/VOP2 patch is active. It lives in
patch/kernel/archive/rockchip64-7.3/rk35xx-rk3528-display-hdmi-vop2.patch.
The rk35xx- prefix sorts it after the RK3562 VOP2 patch.
