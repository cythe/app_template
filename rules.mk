
%.o: %.c
ifeq ($(TARGET_IS_LIB), 1)
	$(CC) -fPIC $(INC_FLAGS) $(CFLAGS) -c $< -o $@
else
	$(CC) $(INC_FLAGS) $(CFLAGS) -c $< -o $@
endif

%.ox: %.cpp
ifeq ($(TARGET_IS_LIB), 1)
	$(CX) -fPIC $(INC_FLAGS) $(CXFLAGS) -c $< -o $@
else
	$(CX) $(INC_FLAGS) $(CXFLAGS) -c $< -o $@
endif

all: $(target)

$(target): $(c_objs) $(cx_objs)
ifeq ($(TARGET_IS_LIB), 1)
	$(CX) -shared $(LD_FLAGS) $< -o $@ $(EXTRA_LIBS)
else
	$(CX) $(LD_FLAGS) $(c_objs) $(cx_objs) -o $@ $(EXTRA_LIBD) $(EXTRA_LIBS)
endif

clean:
	rm -f $(c_objs) $(cx_objs) $(target)

install: $(target)
ifeq ($(TARGET_IS_LIB), 1)
	install -m 775 $(target) $(lib_dir)
	pushd $(lib_dir) && ln -sf $(target) lib$(obj-so).so && popd
	install -m 664 $(inc_files) $(inc_dir)
else
	install -m 775 $(target) $(bin_dir)
endif

