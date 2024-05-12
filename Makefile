CROSS_COMPILE ?= aarch64-linux-gnu-

AS = $(CROSS_COMPILE)as
LD = $(CROSS_COMPILE)ld
CC = $(CROSS_COMPILE)gcc
CX = $(CROSS_COMPILE)g++
CPP = $(CC) -E
AR = $(CROSS_COMPILE)ar
NM = $(CROSS_COMPILE)nm
STRIP = $(CROSS_COMPILE)strip
OBJCOPY = $(CROSS_COMPILE)objcopy
OBJDUMP = $(CROSS_COMPILE)objdump

export AS LD CC CX CPP AR NM
export STRIP OBJCOPY OBJDUMP

DIRS = math thirdparty/math src

all:
	@for dir in $(DIRS) ; do \
		if test -d $$dir ; then \
			echo "$$dir: $(MAKE) $@" ; \
			if (cd $$dir; $(MAKE) $@; $(MAKE) install) ; then \
				true; \
			else \
				exit 1; \
			fi; \
		fi \
	done

clean:
	@for dir in $(DIRS) ; do \
		if test -d $$dir ; then \
			echo "$$dir: $(MAKE) $@" ; \
			if (cd $$dir; $(MAKE) $@) ; then \
				true; \
			else \
				exit 1; \
			fi; \
		fi \
	done
	rm bin/* -vf
