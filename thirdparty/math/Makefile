VERSION = 1.0.0

obj-so += othermath

INC_FLAGS += -I $(inc_dir)
EXTRA_LIBD += -L $(lib_dir)
EXTRA_LIBS +=
EXTRA_LIBS +=

target = lib$(obj-so).$(VERSION).so

include $(TOPDIR)/files.mk

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
