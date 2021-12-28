#
# Copyright (C) 2019-2021 The PixelDust Project
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
#

# Bootanimation
BOOTANIMATION := 1080

# Release name
PRODUCT_RELEASE_NAME := POCO F2 Pro
export TARGET_DEVICE=lmi

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from lmi device
$(call inherit-product, device/xiaomi/lmi/device.mk)

# Include common PixelDust stuff
$(call inherit-product, vendor/pixeldust/build/product/pixeldust_product.mk)
$(call inherit-product, vendor/pixeldust/configs/telephony.mk)
$(call inherit-product, vendor/pixeldust/configs/pixeldust_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := pixeldust_lmi
PRODUCT_DEVICE := lmi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi K30 Pro
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

BUILD_FINGERPRINT := "google/raven/raven:12/SQ1D.211205.017/7955197:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="raven-user 12 SQ1D.211205.017 7955197 release-keys"

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.pixeldust.device="lmi" \
    ro.pixeldust.maintainer="ZenkaBestia"

# Google
WITH_GOOGLE_APEX := true
WITH_GMS ?= true
REMOVE_GAPPS_PACKAGES += \
    pixel_2018_exclusive \
    pixel_experience_2019_midyear \
    pixel_experience_2019 \
    pixel_experience_2020_midyear \
    pixel_experience_2020 \
    pixel_experience_2021_midyear \
    pixel_experience_2021
