VERSION = 1.2.0

obj-so += math

INC_FLAGS += -I $(inc_dir)

INC_FLAGS += $(shell pkgconf --cflags libmpeg2)
SYS_LIBS += $(shell pkgconf --libs libmpeg2)

EXTRA_LIBDIR += -L $(lib_dir)
EXTRA_LIBS +=
EXTRA_LIBS +=

TARGET = lib$(obj-so).$(VERSION).so

TARGET_IS_LIB = 1

include $(topdir)/rules.mk
