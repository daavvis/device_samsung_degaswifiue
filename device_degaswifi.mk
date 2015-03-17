# Copyright (C) 2015 The MoKee Opensourse
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# IR packages
PRODUCT_PACKAGES += \
    consumerir.mrvl

# IR feature permission
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/degaswifi/degaswifi-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/degaswifi/overlay

# Set wifi-only before it's set by generic_no_telephony.mk
PRODUCT_PROPERTY_OVERRIDES += \
        ro.carrier=wifi-only
		
$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_CHARACTERISTICS := tablet

# Enable higher-res drawables while keeping mdpi as primary source
PRODUCT_AAPT_CONFIG := large mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_LOCALES += mdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set property overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zygote.disable_gl_preload=true \
    ro.cm.hardware.cabc=/sys/class/mdnie/mdnie/cabc \
    ro.bq.gpu_to_cpu_unsupported=1 \
    wifi.interface=wlan0 \
    wifi.softap.interface=wlan0 \
    wifi.supplicant_scan_interval=30 \
    dalvik.vm.heapsize=128m \
    ro.carrier=wifi-only
	
DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1 \
    persist.service.adb.enable=1 \
    persist.sys.usb.config=mtp,adb \
    sys.disable_ext_animation=1

    # Common build.props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    ro.cm.hardware.cabc=/sys/class/mdnie/mdnie/cabc \
    ro.sf.hwrotation=270 \
    ro.sf.lcd_density=160 \
    ro.tel.config.path=/system/etc/tel/ \
    wifi.interface=wlan0

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Graphics config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gfx.cfg:system/etc/gfx.cfg \
    $(LOCAL_PATH)/configs/dms.cfg:system/etc/dms.cfg

# fstab:
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.pxa1088:root/fstab.pxa1088 \
    $(LOCAL_PATH)/rootdir/extra.fstab:recovery/root/etc/extra.fstab \

# init.rc's:
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.recovery.pxa1088.rc:root/init.recovery.pxa1088.rc \
    $(LOCAL_PATH)/rootdir/init.pxa1088.rc:root/init.pxa1088.rc \
    $(LOCAL_PATH)/rootdir/init.pxa1088.usb.rc:root/init.pxa1088.usb.rc \
    $(LOCAL_PATH)/rootdir/init.pxa1088.tel.rc:root/init.pxa1088.tel.rc

# Init files
PRODUCT_PACKAGES += \
    fstab.pxa1088 \
    init.pxa1088.rc \
    init.pxa1088.usb.rc \
    ueventd.pxa1088.rc
    
# uevent.rc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/ueventd.pxa1088.rc:root/ueventd.pxa1088.rc

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Product specific Packages
PRODUCT_PACKAGES += \
    libsecril-client

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=wlan0

# Disable SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.selinux=disabled

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sirfgps.conf:system/etc/sirfgps.conf \
    $(LOCAL_PATH)/configs/gps.xml:system/etc/gps.xml

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml
