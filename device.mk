#
# ssh NOTE 23 - Device Definition
#

LOCAL_PATH := $(call my-dir)

# --- Base platform and Branding
PRODUCT_PLATFORM := mt6789
PRODUCT_DEVICE := NOTE_23
PRODUCT_BRAND := ssh
PRODUCT_MANUFACTURER := ssh
PRODUCT_MODEL := NOTE 23

# --- Treble and dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_FULL_TREBLE_COMPATIBLE := true

ODM_MANIFEST_FILES += \
    vendor/ssh/NOTE_23/proprietary/odm/etc/vintf/manifest_dsds.xml \
    vendor/ssh/NOTE_23/proprietary/odm/etc/vintf/manifest_qsqs.xml \
    vendor/ssh/NOTE_23/proprietary/odm/etc/vintf/manifest_ss.xml \
    vendor/ssh/NOTE_23/proprietary/odm/etc/vintf/manifest_tsts.xml \
    vendor/ssh/NOTE_23/proprietary/vendor/odm/etc/vintf/manifest_dsds.xml \
    vendor/ssh/NOTE_23/proprietary/vendor/odm/etc/vintf/manifest_qsqs.xml \
    vendor/ssh/NOTE_23/proprietary/vendor/odm/etc/vintf/manifest_ss.xml \
    vendor/ssh/NOTE_23/proprietary/vendor/odm/etc/vintf/manifest_tsts.xml

# FIX: Suppress automatic manifest fragment generation for the Biometrics service
TARGET_VENDOR_MANIFEST_FRAGMENT_OVERRIDES += \
    android.hardware.biometrics.fingerprint@2.1-service:

# --- Copy fstab and init scripts (FSTAB PATH CORRECTED)
# The fstab is in the device root and copied to the ramdisk.
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/fstab.note_23:$(TARGET_COPY_OUT_RAMDISK)/fstab.note_23

# Copy all extracted init rc files from vendor_ramdisk
PRODUCT_COPY_FILES += $(foreach f, $(wildcard $(LOCAL_PATH)/rootdir/init*.rc), \
    $(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/$(notdir $(f)))

#Copy permission files
PRODUCT_COPY_FILES += $(foreach f, $(wildcard $(LOCAL_PATH)/configs/permissions/*.xml), \
    $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/$(notdir $(f)))

# --- System properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=480 \
    ro.vendor.build.security_patch=2024-06-01 \
    ro.hardware=mt6789

# --- Include vendor blobs (CRITICAL: NOTE_23-vendor.mk must exist)
# NOTE: The original comment referred to 'infinix', which is now ignored.
$(call inherit-product-if-exists, vendor/ssh/NOTE_23/NOTE_23-vendor.mk)

# --- A/B OTA support
AB_OTA_UPDATER := true
PRODUCT_PACKAGES += \
    update_engine \
    update_verifier

