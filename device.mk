# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_PACKAGE_OVERLAYS := device/zte/blade/overlay

$(call inherit-product-if-exists, vendor/zte/blade/blade-vendor.mk)

#Use dalvik parameters for a 512 MB device
$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := blade
PRODUCT_DEVICE := blade
PRODUCT_BRAND := ZTE
PRODUCT_MODEL := ZTE Blade
PRODUCT_MANUFACTURER := ZTE


PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.baseband_version=P729BB01

# ZTE devices use high-density artwork where available
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_LOCALES += hdpi

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

DISABLE_DEXPREOPT := false

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.blade \
    audio_policy.blade \
    libaudioutils \

# Custom Package
PRODUCT_PACKAGES += \
    Apollo \
    AppWidgetPicker \
    BladeParts \
    Camera \
    ThemeChooser \
    ThemeManager \
    FileManager \
    ROMControl \

# Sensors
PRODUCT_PACKAGES += \
    librpc \
    gps.blade \
    sensors.blade \
    camera.msm7x27 \
    lights.blade

# Support Libs
PRODUCT_PACKAGES += \
    libril \
    libcamera \
    abtfilt \
    dexpreopt \
    prox_cal

# Display
PRODUCT_PACKAGES += \
    libgenlock \
    libmemalloc \
    liboverlay \
    libQcomUI \
    libtilerenderer \
    libopencorehw \
    gralloc.msm7x27 \
    copybit.msm7x27 \
    hwcomposer.msm7x27

# QCOM OMX
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libOmxCore \
    libmm-omxcore \
    libdivxdrmdecrypt \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxVdec \
    libOmxVenc

#   libopencore \

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
        librs_jni

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Keylayout
PRODUCT_COPY_FILES += \
    device/zte/blade/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/zte/blade/prebuilt/usr/keylayout/blade_keypad.kl:system/usr/keylayout/blade_keypad.kl

# ROOT
PRODUCT_COPY_FILES += \
    device/zte/blade/prebuilt/root/init.blade.rc:root/init.blade.rc \
    device/zte/blade/prebuilt/root/init.blade.usb.rc:root/init.blade.usb.rc \
    device/zte/blade/prebuilt/root/ueventd.blade.rc:root/ueventd.blade.rc

# Audio
PRODUCT_COPY_FILES += \
    device/zte/blade/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/zte/blade/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# Camera
PRODUCT_COPY_FILES += \
    device/zte/blade/prebuilt/lib/liboemcamera.so:system/lib/liboemcamera.so \
    device/zte/blade/prebuilt/lib/liboemcamera.so:obj/lib/liboemcamera.so

# Volume table and Touchscreen
PRODUCT_COPY_FILES += \
    device/zte/blade/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
    device/zte/blade/prebuilt/usr/idc/Fts-touchscreen.idc:system/usr/idc/fts-touchscreen.idc \
#    device/zte/blade/prebuilt/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
#    device/zte/blade/prebuilt/usr/idc/synaptics-rmi4-ts.idc:system/usr/idc/synaptics-rmi4-ts.idc


# WiFi
PRODUCT_COPY_FILES += \
    device/zte/blade/prebuilt/wifi/ar6000.ko:system/wifi/ar6000.ko \
    device/zte/blade/prebuilt/wifi/regcode:system/wifi/regcode \
    device/zte/blade/prebuilt/wifi/data.patch.hw2_0.bin:system/wifi/data.patch.hw2_0.bin \
    device/zte/blade/prebuilt/wifi/athwlan.bin.z77:system/wifi/athwlan.bin.z77 \
    device/zte/blade/prebuilt/wifi/athtcmd_ram.bin:system/wifi/athtcmd_ram.bin \
    device/zte/blade/prebuilt/wifi/device.bin:system/wifi/device.bin \
    device/zte/blade/prebuilt/wifi/eeprom.bin:system/wifi/eeprom.bin \
    device/zte/blade/prebuilt/wifi/eeprom.data:system/wifi/eeprom.data

# Configs
PRODUCT_COPY_FILES += \
    device/zte/blade/prebuilt/lib/modules/cifs.ko:system/lib/modules/2.6.35.7-perf+/cifs.ko \
    device/zte/blade/prebuilt/lib/modules/zram.ko:system/lib/modules/2.6.35.7-perf+/zram.ko \
    device/zte/blade/prebuilt/lib/modules/lzo_compress.ko:system/lib/modules/2.6.35.7-perf+/lzo_compress.ko \
    device/zte/blade/prebuilt/lib/modules/lzo_decompress.ko:system/lib/modules/2.6.35.7-perf+/lzo_decompress.ko \
    device/zte/blade/prebuilt/etc/init.bt.sh:system/etc/init.bt.sh \
    device/zte/blade/prebuilt/etc/start_usb0.sh:system/etc/start_usb0.sh \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf \
    device/zte/blade/prebuilt/etc/liberty.cfg:system/etc/liberty.cfg \
    device/zte/blade/prebuilt/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/zte/blade/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/zte/blade/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/zte/blade/prebuilt/bin/hostapd:system/bin/hostapd \
    device/zte/blade/releasetools/extras.sh:system/bin/extras.sh \
    device/zte/blade/prebuilt/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \

# Sysctl
PRODUCT_COPY_FILES += \
    device/zte/blade/prebuilt/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    device/zte/blade/prebuilt/etc/sysctl.conf:system/etc/sysctl.conf

# QCOMLIBS (need Qcom updates)
PRODUCT_COPY_FILES += \
#    device/zte/blade/prebuilt/lib/libDivxDrm.so:system/lib/libDivxDrm.so \
#    device/zte/blade/prebuilt/lib/libmm-color-convertor.so:system/lib/libmm-color-convertor.so \
#    device/zte/blade/prebuilt/lib/libmmosal.so:system/lib/libmmosal.so \
#    device/zte/blade/prebuilt/lib/libmmparser.so:system/lib/libmmparser.so \
#    device/zte/blade/prebuilt/lib/libmmparser_divxdrmlib.so:system/lib/libmmparser_divxdrmlib.so \

# QCOMLIBS
PRODUCT_COPY_FILES += \
    device/zte/blade/prebuilt/lib/libqc-opt.so:system/lib/libqc-opt.so \
    device/zte/blade/prebuilt/lib/libv8.so:system/lib/libv8.so \
    device/zte/blade/prebuilt/lib/libv8.so:obj/lib/libv8.so \
    device/zte/blade/prebuilt/lib/libcneapiclient.so:system/lib/libcneapiclient.so \
    device/zte/blade/prebuilt/lib/libdnshostprio.so:system/lib/libdnshostprio.so \
    device/zte/blade/prebuilt/lib/libnetmonitor.so:system/lib/libnetmonitor.so \
    device/zte/blade/prebuilt/lib/libtcpfinaggr.so:system/lib/libtcpfinaggr.so \
    device/zte/blade/prebuilt/lib/pp_proc_plugin.so:system/lib/pp_proc_plugin.so \
    device/zte/blade/prebuilt/lib/qnet-plugin.so:system/lib/qnet-plugin.so \
    device/zte/blade/prebuilt/lib/tcp-connections.so:system/lib/tcp-connections.so \

# INIT.D
PRODUCT_COPY_FILES += \
    device/common/app/Androidian.apk:system/app/Androidian.apk \
    device/common/app/RootExplorer.apk:system/app/RootExplorer.apk \
    device/zte/blade/prebuilt/app/Backup.apk:system/app/ZTEBackup.apk \
    device/zte/blade/prebuilt/app/NotesPad.apk:system/app/NotesPad.apk \
    device/zte/blade/prebuilt/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    device/zte/blade/prebuilt/etc/init.d//05mntsdcard:system/etc/init.d/05mntsd \
    device/zte/blade/prebuilt/etc/init.d/06mountdl:system/etc/init.d/06mountdl \
    device/zte/blade/prebuilt/etc/init.d/80swapon:system/etc/init.d/80swapon \
    device/zte/blade/prebuilt/etc/init.d/88tweaks:system/etc/init.d/88tweaks \
    device/zte/blade/prebuilt/app/S2E_zh.apk:system/app/S2E_zh.apk \
    device/zte/blade/prebuilt/bin/abtfilt:system/bin/abtfilt \

# AOKP ROMCONTROL
PRODUCT_COPY_FILES += \
    device/zte/blade/prebuilt/boot_audio.mp3:system/media/boot_audio.unicorn \
    device/zte/blade/prebuilt/etc/init_trigger.enabled:system/etc/init_trigger.enabled \

# Get full apns-conf.xml instead of the development sample
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# for bugmailer
ifneq ($(TARGET_BUILD_VARIANT),user)
         PRODUCT_PACKAGES += send_bug
         PRODUCT_COPY_FILES += \
                 system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
                 system/extras/bugmailer/send_bug:system/bin/send_bug
endif
