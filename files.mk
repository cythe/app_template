inc_files := $(wildcard *.h)
c_srcs  := $(wildcard *.c)
cx_srcs := $(wildcard *.cpp)

c_deps 	:= $(patsubst %c, %d, $(c_srcs))
cx_deps := $(patsubst %cpp, %dx, $(cx_srcs))

c_objs  := $(patsubst %c, %o, $(c_srcs))
cx_objs := $(patsubst %cpp, %ox, $(cx_srcs))
