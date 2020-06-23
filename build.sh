export ARCH=arm64 
export SUBARCH=arm64
export CROSS_COMPILE=/mnt/kernels/Redmi-4/gcc-linaro-4.9.4-2017.01-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
make Deamen-S133PY_defconfig
make -j8
rm ../mkboot/*.img 
rm ../mkboot/zImage
cat arch/arm64/boot/Image.gz-dtb arch/arm64/boot/dts/qcom/*.dtb > ../mkboot/zImage
cd ../mkboot
./mkbootimg --kernel zImage --ramdisk ramdisk.cpio.gz --base 0x80000000 --cmdline 'androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 androidboot.bootdevice=7824900.sdhci earlycon=msm_hsl_uart,0x78B0000 androidboot.selinux=permissive loop.max_part=7 buildvariant=userdebug' -o new_boot.img
