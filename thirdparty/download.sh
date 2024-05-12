# download all your need.
#

git clone https://github.com/libsdl-org/SDL.git
git clone https://github.com/libsdl-org/SDL_image.git
git clone https://github.com/libsdl-org/SDL_mixer.git
git clone https://github.com/libsdl-org/SDL_ttf.git
git clone https://github.com/xiph/opusfile.git
git clone https://github.com/doxygen/doxygen.git
git clone https://github.com/xiph/opus.git

# one methord to check if the git clone is success.
if [ -d SDL ]; then 
    pushd SDL
    git status
    if [ "$?" != "0" ]; then
	echo SDL is not download...
	# download SDL
	git clone https://github.com/libsdl-org/SDL.git
    else
	exit 0;
    fi
else
    git clone https://github.com/libsdl-org/SDL.git
fi

