VERSION = 1.0.0

release_dir=../release
bin_dir=$(release_dir)/bin
lib_dir=$(release_dir)/lib
inc_dir=$(release_dir)/include
#doc_dir=$(release_dir)/doc

.PHONY: all clean

obj-y += test

INC_FLAGS += -I $(inc_dir)
EXTRA_LIBD += -L $(lib_dir)
EXTRA_LIBS += -lmath
EXTRA_LIBS += -lothermath
target = $(obj-y)

#include $(TOPDIR)/libs.mk

inc_files := $(wildcard *.h)
c_srcs  := $(wildcard *.c)
cx_srcs := $(wildcard *.cpp)

c_objs  := $(patsubst %c, %o, $(c_srcs))
cx_objs := $(patsubst %cpp, %ox, $(cx_srcs))

%.o: %.c
	$(CC) $(INC_FLAGS) $(CFLAGS) -c $< -o $@

%.ox: %.cpp
	$(CX) $(INC_FLAGS) $(CXFLAGS) -c $< -o $@

all:$(target)

$(target): $(c_objs) $(cx_objs)
	$(CX) $(LD_FLAGS) $(c_objs) $(cx_objs) -o $@ $(EXTRA_LIBD) $(EXTRA_LIBS)

clean:
	rm -f $(c_objs) $(cx_objs) $(target)

dirs:
	mkdir -p $(bin_dir) $(inc_dir) $(lib_dir) 

install: dirs $(target)
	install -m 775 $(target) $(bin_dir)
