#!/bin/bash

echo -e "\nStart to prepare extra module...\n"

# 这里引入这个脚本文件, 自己写吧, 需要什么三方库自己写...
# 安装的prefix要指定为${PREFIX}.
#
PREFIX=$1

# download all thing.
# 下载的时候每个人情况不一样, 我网慢, 老断, 就把download
# 单独拎出来了...
#
# skip ....

# process SDL
pushd SDL
git checkout SDL2
mkdir -p build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build . --config Release
cmake --install . --prefix ${PREFIX}
popd

# process SDL_image
pushd SDL_image
git checkout SDL2
mkdir -p build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build . --config Release
cmake --install . --prefix ${PREFIX}
popd

# process docygen (opus file need)
pushd doxygen 
mkdir -p build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build . --config Release
cmake --install . --prefix ${PREFIX}
popd

# process opus (SDL_mixer need)
pushd opus
mkdir -p build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build . --config Release
cmake --install . --prefix ${PREFIX}
popd

# process opus file (SDL_mixer need)
pushd opusfile
mkdir -p build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DDOXYGEN_EXECUTABLE=${PREFIX}/bin/doxygen
cmake --build . --config Release
cmake --install . --prefix ${PREFIX}
popd

# process SDL_mixer
pushd SDL_mixer
git checkout SDL2
mkdir -p build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DOpusFile_LIBRARY=${PREFIX}/lib/libopusfile.a -DOpusFile_INCLUDE_PATH=${PREFIX}/include/opus
cmake --build . --config Release
cmake --install . --prefix ${PREFIX}
popd

# process SDL_ttf
pushd SDL_ttf
git checkout SDL2
mkdir -p build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
cmake --build . --config Release
cmake --install . --prefix ${PREFIX}
popd
