# Define the fstab file as an explicit build module.
# This creates the 'known rule to make it' that Ninja is missing.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.note_23
LOCAL_MODULE_CLASS := ETC # 'ETC' for generic files
LOCAL_MODULE_TAGS  := optional
LOCAL_SRC_FILES    := fstab.note_23

# Crucially, this creates the build dependency for Ninja
include $(BUILD_PREBUILT)
