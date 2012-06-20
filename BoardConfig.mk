# Copyright (C) 2007 The Android Open Source Project
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

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := true

# Use the non-open-source parts, if they're present
-include vendor/zte/blade/BoardConfigVendor.mk

# Headers
TARGET_SPECIFIC_HEADER_PATH := device/zte/blade/include

# Arch and board related defines
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := blade
TARGET_BOARD_PLATFORM := msm7x27
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
ARCH_ARM_HAVE_VFP := true

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=blade console=null
BOARD_KERNEL_BASE := 0x02600000

# Bluetooth

# RILS
TARGET_PROVIDES_LIBRIL := true
BOARD_PROVIDES_LIBRIL := true
BOARD_HAVE_BLUETOOTH := true

# QCOM and GPS
BOARD_GPS_LIBRARIES := libloc
BOARD_USES_GPSSHIM := true
BOARD_GPS_NEEDS_XTRA := true
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# Touchscreen
BOARD_USE_LEGACY_TOUCHSCREEN := true

# Graphics
# Enable OpenGL Hardware Acceleration
# msm7x27: no support for overlay, bypass, or c2d
BOARD_EGL_CFG := device/zte/blade/prebuilt/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_USE_QCOM_PMEM := true
TARGET_USES_GENLOCK := true
TARGET_USE_OVERLAY := false
TARGET_HAVE_BYPASS := false
TARGET_USES_SF_BYPASS := false
TARGET_USES_C2D_COMPOSITION := false
BOARD_ADRENO_DECIDE_TEXTURE_TARGET :=true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true
TARGET_NO_BYPASS_CROPPING := true
COMMON_GLOBAL_CFLAGS += -DTARGET_MSM7x27 
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60
COMMON_GLOBAL_CFLAGS += -DDECIDE_TEXTURE_TARGET 
COMMON_GLOBAL_CFLAGS += -DALLOW_DEQUEUE_CURRENT_BUFFER
TARGET_BOOTANIMATION_PRELOAD := true
# Backwards compatability for O_SYNC		
#COMMON_GLOBAL_CFLAGS += -DO_DSYNC=O_SYNC
#COMMON_GLOBAL_CFLAGS += -DEGL_EGLEXT_PROTOTYPES
#COMMON_GLOBAL_CFLAGS += -DMISSING_GRALLOC_BUFFERS
#COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_PIXEL_FORMAT_YV12
#COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_EXTERNAL_IMAGE

# need by camera hacks
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true
BOARD_CAMERA_USE_MM_HEAP := true
#BOARD_CAMERA_USE_GETBUFFERINFO := true
#BOARD_NO_RGBX_8888 := true
#TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true


# Browser
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
HTTP := chrome
# DYNAMIC_SHARED_LIBV8SO := true

# CPU UPLOAD
TARGET_FORCE_CPU_UPLOAD := true
COMMON_GLOBAL_CFLAGS += -DFORCE_CPU_UPLOAD


# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := AR6000
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := wlan0
WIFI_DRIVER_MODULE_PATH     := /system/wifi/ar6000.ko
WIFI_DRIVER_MODULE_NAME     := ar6000

# Partition sizes
# # cat /proc/mtd
# dev:    size   erasesize  name
# mtd0: 00480000 00020000 "recovery"
# mtd1: 00480000 00020000 "boot"
# mtd2: 00180000 00020000 "splash"
# mtd3: 00060000 00020000 "misc"
# mtd4: 02940000 00020000 "cache"
# mtd5: 0cf80000 00020000 "system"
# mtd6: 0d020000 00020000 "userdata"
# mtd7: 00180000 00020000 "persist"
BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x00480000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00900000
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 0x0cf80000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0d020000
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/zte/blade/recovery/recovery_keys.c
BOARD_CUSTOM_GRAPHICS := ../../../device/zte/blade/recovery/graphics.c
TARGET_RECOVERY_INITRC := device/zte/blade/recovery/recovery.rc

TARGET_KERNEL_SOURCE := kernel/zte/zte-kernel-msm7x27
TARGET_KERNEL_CONFIG := cyanogen_blade_defconfig

# USB 
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"

TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/zte/blade/releasetools/ota_from_target_files
