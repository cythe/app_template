VERSION = 1.0.0

obj-y += test

INC_FLAGS += -I $(inc_dir)
EXTRA_LIBD += -L $(lib_dir)
EXTRA_LIBS += -lmath
EXTRA_LIBS += -lothermath

target = $(obj-y)

include $(TOPDIR)/files.mk

%.o: %.c
	$(CC) $(INC_FLAGS) $(CFLAGS) -c $< -o $@

%.ox: %.cpp
	$(CX) $(INC_FLAGS) $(CXFLAGS) -c $< -o $@

all:$(target)

$(target): $(c_objs) $(cx_objs)
	$(CX) $(LD_FLAGS) $(c_objs) $(cx_objs) -o $@ $(EXTRA_LIBD) $(EXTRA_LIBS)

clean:
	rm -f $(c_objs) $(cx_objs) $(target)

install: $(target)
	install -m 775 $(target) $(bin_dir)
