# Boot animation
BOOTANIMATION := 1920

# Inherit some common AOSiP stuff.
$(call inherit-product, vendor/pixeldust/configs/pixeldust_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/walleye/aosp_walleye.mk)

include device/google/wahoo/device-pixeldust.mk

# Device identifier. This must come after all inclusions
PRODUCT_NAME := pixeldust_walleye
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 2
PRODUCT_RESTRICT_VENDOR_FILES := false
TARGET_DEVICE := walleye

$(call inherit-product-if-exists, vendor/google/walleye/walleye-vendor.mk)
$(call inherit-product-if-exists, vendor/gapps/gapps.mk)
