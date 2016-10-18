# Cyanogen Mod 12.1
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Device
$(call inherit-product, device/huawei/hi6210sft/hi6210sft.mk)
PRODUCT_RELEASE_NAME := hi6210sft

PRODUCT_DEVICE := hi6210sft
PRODUCT_NAME := cm_hi6210sft
PRODUCT_BRAND := hi6210sft
PRODUCT_MODEL := ALE-L21
PRODUCT_MANUFACTURER := HUAWEI
