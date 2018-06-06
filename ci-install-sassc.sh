set -x
set -e

# Install SassC if not already cached or upgrade an old version.
if [ ! -e $HOME/bin/sassc ] || ! [[ `$HOME/bin/sassc -v` =~ "libsass: ${LIBSASS_VERSION}" ]]; then
  export SASS_BUILD_DIR=$HOME/src/github.com/sass
  mkdir -p $SASS_BUILD_DIR
  cd $SASS_BUILD_DIR

  git clone --recursive --depth 1 https://github.com/sass/libsass.git -b ${LIBSASS_VERSION}
  git clone --depth 1 https://github.com/sass/sassc.git -b ${SASS_VERSION}

  cd sassc
  SASS_LIBSASS_PATH=$SASS_BUILD_DIR/libsass make

  mv $SASS_BUILD_DIR/sassc/bin/sassc $HOME/bin/sassc
fi
