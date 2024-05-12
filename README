## Makefile Template

应用层的项目框架.

原则: 一个Makefile对应的是一个target, 如果一个target由多个目录组成, 那应该在
该makefile中递归搜索目录.

一个项目由源码, 头文件, 自建库, apps, 依赖组成.
依赖可以分为系统依赖和第三方依赖.

顶层Makefile做的事情就是依次进入target所在目录编译所有target.
我们需要在顶层Makefile中指定这些目录.

target目录的Makefile包含顶层的rules.mk文件, 这个文件定义了如何编译一个target.
Makefile本身需要将自身属性和依赖设置好.

目录结构如下:
```
.
├── release	// release 目录, 依赖和目标安装到此
├── Makefile	// 顶层Makefile文件, 这里要设置需要编译的目录.
├── math	// 自建库源码目录
│   ├── Makefile    // 自建库Makefile, 需要设置依赖和自身属性
│   ├── mymath.cpp
│   └── mymath.h
├── README	// 本文件
├── rules.mk	// 顶层公共规则文件, 每个target都包含这个文件.
├── src
│   ├── macro.h
│   ├── main.cpp
│   ├── Makefile    // 应用程序的Makefile, 需要设置依赖和自身属性
│   ├── sub.c
│   └── sub.h
└── thirdparty	// 三方库, 所有包需要自定义编译, 将prefix指定到release目录
    ├── extra module1
    │   ├── CMakeLists.txt
    │   ├── ...
    │   └── ...
    └── extra module2
	├── Auto.conf
    	├── ...
    	└── ...
```
 
target Makefile示例:

```
VERSION = 1.0.0			    // 应用程序版本 | 库版本

obj-y += test			    // 应用程序名, obj-y目前还没起作用...

INC_FLAGS += -I $(inc_dir)	    // include目录设置

INC_FLAGS += $(shell pkgconf --cflags libjpeg)	// 系统库头文件和cflag
SYS_LIBS += $(shell pkgconf --libs libjpeg)	// 系统库链接flag设置

SYS_LIBS += -lmath -lpthread			// 不需要pkgconf的系统库

EXTRA_LIBDIR += -L $(lib_dir)	    // 三方库所在位置: release/lib
EXTRA_LIBS += -lothermath	    // 三方库链接flag设置

TARGET = $(obj-y)

TARGET_IS_LIB = 0		    // 这个target是库么?

include $(topdir)/rules.mk	    // 包含公共规则
```

#### status

* [x] 支持源文件自动扫描.(wildcard + patsubst)

* [x] 支持C/C++文件混合编译(请记住C文件要extern"C").
    >   c文件目标.o
    >   cpp文件目标.ox
* [x] 支持自建共享库编译.
* [x] 支持三方库编译.
* [x] 交叉编译支持
* [x] 对Makefile做第一次抽象, 将相同的规则和共性提取出来.
* [x] 添加头文件更改监测, 当更改头文件的时候需要编译相关文件.
* [x] x86-64平台编译的时候系统库的使用支持. SYSLIB= ?
* [x] 统一指定三方库的的安装prefix= ${topdir}/release/.

#### todo

* [] 添加override机制, 可以更改编译的规则.
* [] obj-y | obj-so | obj-ar 还没起到应有的作用哈.
* [] 子文件夹的扫描支持. subdir ? 有问题, 暂时不做了
* [] 编译产物的目录制定, 防止污染源码. O= ?
* [] C/C++嵌入汇编的支持.
* [] 对Makefile做第二次抽象, 将各种FLAG变量进行规范化.
* [] 暂没有对库之间的依赖做优化处理, 遇到的时候需要解决依赖关系.
* [] 添加对三方库的自动化处理, 目前三方库不支持自动化处理.

[Bug]
* [] (P3) 如果删除了release目录后执行make clean, 会出现错误.
    main.cpp:3:10: 致命错误：mymath.h：没有那个文件或目录
        3 | #include "mymath.h"
          |          ^~~~~~~~~~
    编译中断。
