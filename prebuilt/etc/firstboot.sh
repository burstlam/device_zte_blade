#!/system/bin/sh
/system/bin/mount -o remount,rw /
/system/bin/mkdir /sd-ext
/system/bin/mount -o remount,ro /
if [ -e /dev/block/mmcblk0p2 ];
then
        /system/bin/mount -t ext4 /dev/block/mmcblk0p2 /sd-ext
fi;
