# Copyright 2016 The Fuchsia Authors
# Copyright (c) 2008-2015 Travis Geiselbrecht
#
# Use of this source code is governed by a MIT-style
# license that can be found in the LICENSE file or at
# https://opensource.org/licenses/MIT

LOCAL_DIR := $(GET_LOCAL_DIR)

KERNEL_INCLUDES += \
    $(LOCAL_DIR)/include

PLATFORM := generic-arm

MEMBASE := 0x40000000
KERNEL_LOAD_OFFSET := 0x10000
MEMSIZE ?= 0x08000000   # 512MB
KERNEL_LOAD_OFFSET := 0x10000 # 64k

PERIPH_BASE_PHYS := 0x00000000U
PERIPH_BASE_VIRT := 0xffffffffc0000000UL
PERIPH_SIZE      := 0x40000000U         # 1GB
MEMORY_APERTURE_SIZE := 0x780000000UL   # (30ULL * 1024 * 1024 * 1024)

# reserve the first 64k of ram, which should be holding the fdt data
BOOTLOADER_RESERVE_START := $(MEMBASE)
BOOTLOADER_RESERVE_SIZE := 0x10000

KERNEL_DEFINES += \
	MEMBASE=$(MEMBASE) \
	MEMSIZE=$(MEMSIZE) \
	PERIPH_BASE_PHYS=$(PERIPH_BASE_PHYS) \
	PERIPH_BASE_VIRT=$(PERIPH_BASE_VIRT) \
	PERIPH_SIZE=$(PERIPH_SIZE) \
	MEMORY_APERTURE_SIZE=$(MEMORY_APERTURE_SIZE) \
	BOOTLOADER_RESERVE_START=$(BOOTLOADER_RESERVE_START) \
	BOOTLOADER_RESERVE_SIZE=$(BOOTLOADER_RESERVE_SIZE) \
	PLATFORM_SUPPORTS_PANIC_SHELL=1 \

# build MDI
MDI_SRCS := \
    $(LOCAL_DIR)/qemu.mdi \

MDI_INCLUDES := \
    kernel/include/mdi/kernel-defs.mdi \

include make/mdi.mk

