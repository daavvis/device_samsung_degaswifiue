## Specify phone tech before including full_phone
# $(call inherit-product, vendor/mk/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := degaswifi

# Inherit some common mokee stuff.
$(call inherit-product, vendor/mk/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/degaswifi/full_degaswifi.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := degaswifi
PRODUCT_NAME := mk_degaswifi
PRODUCT_BRAND := samsung
PRODUCT_MODEL := degaswifi
PRODUCT_MANUFACTURER := samsung
