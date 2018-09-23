LOCAL_PATH := $(call my-dir)

common_src_files := cluster.c io.c log.c lookup.c mount.c node.c time.c utils.c

include $(CLEAR_VARS)
LOCAL_MODULE := libexfat
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS := -D_FILE_OFFSET_BITS=64 -Wno-sign-compare -Wno-address-of-packed-member
LOCAL_SRC_FILES := $(common_src_files)
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)
include $(BUILD_SHARED_LIBRARY)

ifneq ($(TARGET_NO_RECOVERY),true)
include $(CLEAR_VARS)
LOCAL_MODULE := libexfat_static
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS := -D_FILE_OFFSET_BITS=64
LOCAL_SRC_FILES := $(common_src_files)
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)
LOCAL_STATIC_LIBRARIES := libfuse_static libexfat_static
include $(BUILD_STATIC_LIBRARY)
endif
