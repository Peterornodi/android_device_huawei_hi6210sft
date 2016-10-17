# Android Open Source Project Common Stuff
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# ADB
PRODUCT_PROPERTY_OVERRIDES += \
         debug.sf.no_hw_vsync=1 \
         ro.adb.secure=0 \
         ro.secure=0 \

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Audio
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/etc/audio_effects.conf:system/etc/audio_effects.conf \
	$(LOCAL_PATH)/rootdir/etc/audio_policy.conf:system/etc/audio_policy.conf \
	$(LOCAL_PATH)/rootdir/etc/hisi_omx.cfg:system/etc/hisi_omx.cfg \
	$(LOCAL_PATH)/rootdir/etc/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/rootdir/etc/media_profiles.xml:system/etc/media_profiles.xml \

PRODUCT_PACKAGES += \
    	audio.a2dp.default \
    	audio.primary.default \
    	audio.r_submix.default \
    	audio.usb.default \
    	libaudioroute \
    	libaudioutils \
    	libtinyalsa \
    	tinycap \
    	tinymix \
    	tinypcminfo \
    	tinyplay

# Binaries
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/huawei/hi6210sft/binaries,system/bin)

# Bluetooth
PRODUCT_PACKAGES += \
    	bt_vendor.conf \
    	libbt-vendor

# Codecs
PRODUCT_COPY_FILES += \
    	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)
PRODUCT_TAGS += dalvik.gc.type-precise

# Display
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# File System
PRODUCT_PACKAGES += \
    	make_ext4fs \
    	setup_fs

# GPS
$(call inherit-product, device/common/gps/gps_us_supl.mk)

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/etc/globalAutoAdapt-conf.xml:system/etc/globalAutoAdapt-conf.xml \
	$(LOCAL_PATH)/rootdir/etc/globalMatchs-conf.xml:system/etc/globalMatchs-conf.xml \
	$(LOCAL_PATH)/rootdir/etc/goldeneye_config.xml:system/etc/goldeneye_config.xml \
	$(LOCAL_PATH)/rootdir/etc/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/rootdir/etc/gpsconfig.xml:system/etc/gpsconfig.xml \
	$(LOCAL_PATH)/rootdir/etc/hisi_cfg.ini:system/etc/hisi_cfg.ini \
	$(LOCAL_PATH)/rootdir/etc/hisi_cfg_alice.ini:system/etc/hisi_cfg_alice.ini \
	$(LOCAL_PATH)/rootdir/etc/hisi_cfg_cherry.ini:system/etc/hisi_cfg_cherry.ini \

# Graphics
PRODUCT_PACKAGES += \
	libGLES_mali

PRODUCT_PROPERTY_OVERRIDES += \
    	debug.hwui.render_dirty_regions=false \
    	hw.lcd.lcd_density=320 \
    	ro.opengles.version=131072 \
    	ro.sf.lcd_density=320 \
    	persist.sys.strictmode.disable=1 \
    	persist.sys.use_dithering=2

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/huawei/hi6210sft/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    	$(LOCAL_KERNEL):kernel

# Misc
PRODUCT_PACKAGES += \
    	Torch \
    	com.android.future.usb.accessory

# Overlays
DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \

# Ramdisk
PRODUCT_PACKAGES += \
    	fstab.hi6210sft \
    	init.chip.usb.rc \
    	init.hi6210sft.rc \
    	init.hi6210sft.usb.rc \
    	init.rc \
    	ueventd.hi6210sft.rc

# Teec
PRODUCT_PACKAGES += \
	libteec

# Wifi
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/etc/wifi/hostapd_hisi.conf:system/etc/wifi/hostapd_hisi.conf \
	$(LOCAL_PATH)/rootdir/etc/wifi/wpa_supplicant_hisi.conf:system/etc/wifi/wpa_supplicant_hisi.conf \

PRODUCT_PACKAGES += \
    	hostapd \
    	libwpa_client \
    	wpa_supplicant \
    	wpa_supplicant.conf

# Zygote
ADDITIONAL_DEFAULT_PROPERTIES += ro.zygote=zygote64_32

PRODUCT_COPY_FILES += system/core/rootdir/init.zygote64_32.rc:root/init.zygote64_32.rc

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.zygote=zygote64_32


