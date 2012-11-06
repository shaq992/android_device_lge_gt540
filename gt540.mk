# Inherit from those products. Most specific first
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product-if-exists, vendor/lge/gt540/gt540-vendor.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/gt540/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/lge/gt540/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Board-specific init
PRODUCT_COPY_FILES += \
         $(LOCAL_PATH)/init.swift.rc:root/init.swift.rc \
         $(LOCAL_PATH)/ueventd.qct.rc:root/ueventd.qct.rc    

#Configs
PRODUCT_COPY_FILES += \
            $(LOCAL_PATH)/configs/AVRCP.kl:system/usr/keylayout/AVRCP.kl    $(LOCAL_PATH)/configs/qwerty.kl:system/usr/keylayout/qwerty.kl \
            $(LOCAL_PATH)/configs/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
	    $(LOCAL_PATH)/configs/swift_touchscreen.kcm.bin:system/usr/keychars/swift_touchscreen.kcm.bin \
            $(LOCAL_PATH)/configs/swift_keypad.kcm.bin:system/usr/keychars/swift_keypad.kcm.bin \
	    $(LOCAL_PATH)/configs/swift_touchscreen.kl:system/usr/keylayout/swift_touchscreen.kl 
	    
# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/wireless.ko:system/lib/modules/wireless.ko \
    $(LOCAL_PATH)/configs/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf 

# SD Card
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab 

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/AudioFilter.csv:system/etc/AudioFilter.csv \
    $(LOCAL_PATH)/configs/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml 

# Device Permissions 
PRODUCT_COPY_FILES += \
frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml 

$(call inherit-product, build/target/product/full.mk)

PRODUCT_PACKAGES += \
    gps.swift \
    copybit.gt540 \
    gralloc.gt540 \
    lights.gt540 \
    libril \
    hwaddrs \
    libOmxCore \
    libcamera \
    libapversion 

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := gt540
PRODUCT_DEVICE := gt540
PRODUCT_MODEL := LG-GT540
