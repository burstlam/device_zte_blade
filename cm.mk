$(call inherit-product, device/zte/blade/blade.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

#include qcom opensource features
$(call inherit-product, vendor/qcom/opensource/omx/mm-core/Android.mk)
$(call inherit-product, vendor/qcom/opensource/omx/mm-video/Android.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=blade BUILD_ID=IMM76D BUILD_FINGERPRINT="google/soju/maguro:4.0.4/IMM76D/299849:user/release-keys" PRIVATE_BUILD_DESC="soju-user 4.0.4 IMM76D 299849 release-keys" BUILD_NUMBER=299849

PRODUCT_NAME := cm_blade
PRODUCT_DEVICE := blade
PRODUCT_RELEASE_NAME := Blade
PRODUCT_LOCALES := zh_CN zh_TW en_US
