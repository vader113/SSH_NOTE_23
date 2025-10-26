#
# Infinix NOTE 23 - Device Definition
#

LOCAL_PATH := $(call my-dir)

# --- Base platform
PRODUCT_PLATFORM := mt6789
PRODUCT_DEVICE := NOTE_23
PRODUCT_BRAND := ssh
PRODUCT_MANUFACTURER := ssh
PRODUCT_MODEL := NOTE 23

# --- Treble and dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_FULL_TREBLE_COMPATIBLE := true

# --- Copy fstab and init scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.note_23:$(TARGET_COPY_OUT_RAMDISK)/fstab.note_23

# Copy all extracted init rc files from vendor_ramdisk
PRODUCT_COPY_FILES += $(foreach f, $(wildcard $(LOCAL_PATH)/rootdir/init*.rc), \
    $(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/$(notdir $(f)))

#Copy permission files
PRODUCT_COPY_FILES += $(foreach f, $(wildcard $(LOCAL_PATH)/configs/permissions/*.xml), \
    $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/$(notdir $(f)))

# --- Overlay (optional; comment out if none)
#PRODUCT_PACKAGE_OVERLAYS += \
#    $(LOCAL_PATH)/overlay

# --- System properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=480 \
    ro.vendor.build.security_patch=2024-06-01 \
    ro.hardware=mt6789

# --- Include vendor blobs (⚠️ Ensure vendor/infinix/note_23/vendor.mk exists)
$(call inherit-product-if-exists, vendor/ssh/NOTE_23/NOTE_23-vendor.mk)

# --- A/B OTA support
AB_OTA_UPDATER := true
PRODUCT_PACKAGES += \
    update_engine \
    update_verifier
