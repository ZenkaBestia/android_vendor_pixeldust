# Setup SOONG_CONFIG_* vars to export the vars listed above.
# Documentation here:
# https://github.com/LineageOS/android_build_soong/commit/8328367c44085b948c003116c0ed74a047237a69

# Pixeldust variables
SOONG_CONFIG_NAMESPACES += pixeldustVarsPlugin

SOONG_CONFIG_pixeldustVarsPlugin :=

define addVar
  SOONG_CONFIG_pixeldustVarsPlugin += $(1)
  SOONG_CONFIG_pixeldustVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))

SOONG_CONFIG_NAMESPACES += pixeldustGlobalVars
SOONG_CONFIG_pixeldustGlobalVars += \
    board_fingerprint_vendor \
    target_init_vendor_lib \
    target_ld_shim_libs \
    target_process_sdk_version_override \
    target_surfaceflinger_fod_lib

# Set default values
TARGET_INIT_VENDOR_LIB ?= vendor_init
TARGET_SURFACEFLINGER_FOD_LIB ?= surfaceflinger_fod_lib

# Soong value variables
SOONG_CONFIG_pixeldustGlobalVars_board_fingerprint_vendor := $(BOARD_FINGERPRINT_VENDOR)
SOONG_CONFIG_pixeldustGlobalVars_target_init_vendor_lib := $(TARGET_INIT_VENDOR_LIB)
SOONG_CONFIG_pixeldustGlobalVars_target_ld_shim_libs := $(subst $(space),:,$(TARGET_LD_SHIM_LIBS))
SOONG_CONFIG_pixeldustGlobalVars_target_process_sdk_version_override := $(TARGET_PROCESS_SDK_VERSION_OVERRIDE)
SOONG_CONFIG_pixeldustGlobalVars_target_surfaceflinger_fod_lib := $(TARGET_SURFACEFLINGER_FOD_LIB)

# Qualcomm variables
SOONG_CONFIG_NAMESPACES += aosp_vs_qva
SOONG_CONFIG_aosp_vs_qva += aosp_or_qva
SOONG_CONFIG_aosp_vs_qva_aosp_or_qva := qva
