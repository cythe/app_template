VERSION = 1.0.0

obj-y += test

INC_FLAGS += -I $(inc_dir)
EXTRA_LIBD += -L $(lib_dir)
EXTRA_LIBS += -lmath
EXTRA_LIBS += -lothermath

TARGET = $(obj-y)

TARGET_IS_LIB = 0

include $(TOPDIR)/files.mk
include $(TOPDIR)/rules.mk
