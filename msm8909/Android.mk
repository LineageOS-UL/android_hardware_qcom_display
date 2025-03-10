sdm-libs := sdm/libs
display-hals := include $(sdm-libs)/utils $(sdm-libs)/core

ifneq ($(TARGET_IS_HEADLESS), true)
    display-hals += libcopybit libmemtrack hdmi_cec \
                    $(sdm-libs)/hwc $(sdm-libs)/hwc2 gpu_tonemapper libdrmutils libdisplayconfig
endif

display-hals += gralloc

ifneq ($(TARGET_PROVIDES_LIBLIGHT),true)
    display-hals += liblight
endif

ifneq (,$(call is-vendor-board-qcom))
    include $(call all-named-subdir-makefiles,$(display-hals))
else
ifneq ($(filter msm% apq%,$(TARGET_BOARD_PLATFORM)),)
    include $(call all-named-subdir-makefiles,$(display-hals))
endif
endif
