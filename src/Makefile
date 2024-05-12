VERSION = 1.0.0

obj-y += test

INC_FLAGS += -I $(inc_dir)

INC_FLAGS += $(shell pkgconf --cflags libjpeg)
SYS_LIBS += $(shell pkgconf --libs libjpeg)

EXTRA_LIBDIR += -L $(lib_dir)
EXTRA_LIBS += -lmath
EXTRA_LIBS += -lothermath

TARGET = $(obj-y)

TARGET_IS_LIB = 0

include $(topdir)/rules.mk
