#CROSS_COMPILE=/opt/ti-processor-sdk-linux-am335x-evm-01.00.00.03/linux-devkit/sysroots/i686-arago-linux/usr/bin/arm-linux-gnueabihf-
#CROSS_COMPILE=/opt/arm-2014.05/bin/arm-none-linux-gnueabi-
DIRS = math thirdparty/math src

all:
	@for dir in $(DIRS) ; do \
		if test -d $$dir ; then \
			echo "$$dir: $(MAKE) $@" ; \
			if (cd $$dir; $(MAKE) CROSS_COMPILE=$(CROSS_COMPILE) $@; $(MAKE) install) ; then \
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
