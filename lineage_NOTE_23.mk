#
# Product definition for ssh NOTE 23
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/ssh/NOTE_23/device.mk)

PRODUCT_NAME := lineage_NOTE_23
PRODUCT_DEVICE := NOTE_23
PRODUCT_BRAND := ssh
PRODUCT_MODEL := NOTE 23
PRODUCT_MANUFACTURER := ssh
PRODUCT_RELEASE_NAME := NOTE_23

# --- Shipping API (Android 13)
PRODUCT_SHIPPING_API_LEVEL := 33

# FIX: Dexpreopt failure for LineageOS platform services
# This ensures the package is built and included correctly.
PRODUCT_PACKAGES += \
    org.lineageos.platform

#TARGET_VENDOR_MANIFEST_FRAGMENT_OVERRIDES += \
#    android.hardware.biometrics.fingerprint@2.1-service:
