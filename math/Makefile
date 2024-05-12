VERSION = 1.0.0

obj-so += math

target = lib$(obj-so).$(VERSION).so

#include $(TOPDIR)/libs.mk

inc_files := $(wildcard *.h)
c_srcs  := $(wildcard *.c)
cx_srcs := $(wildcard *.cpp)

c_objs  := $(patsubst %c, %o, $(c_srcs))
cx_objs := $(patsubst %cpp, %ox, $(cx_srcs))

%.o: %.c
	$(CC) -fPIC $(INC_FLAGS) $(CFLAGS) -c $< -o $@

%.ox: %.cpp
	$(CX) -fPIC $(INC_FLAGS) $(CXFLAGS) -c $< -o $@

all:$(target)

$(target): $(c_objs) $(cx_objs)
	$(CX) -shared $(LD_FLAGS) $< -o $@ $(EXTRA_LIBS)

clean:
	rm -f $(c_objs) $(cx_objs) $(target)

install: $(target)
	install -m 775 $(target) $(lib_dir)
	pushd $(lib_dir) && ln -sf $(target) lib$(obj-so).so && popd
	install -m 664 $(inc_files) $(inc_dir)
