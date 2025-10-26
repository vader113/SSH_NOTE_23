#
# Product definition for Infinix NOTE 23
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/ssh/NOTE_23/device.mk)

PRODUCT_NAME := lineage_NOTE_23
PRODUCT_DEVICE := NOTE_23
PRODUCT_BRAND := ssh
PRODUCT_MODEL := NOTE 23
PRODUCT_MANUFACTURER := ssh
PRODUCT_RELEASE_NAME := NOTE_23

# --- Shipping API (⚠️ Update from build.prop)
PRODUCT_SHIPPING_API_LEVEL := 33
