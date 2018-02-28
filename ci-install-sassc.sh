SASS_VERSION=3.4.8

set -x
set -e

# Install SassC if not already cached or upgrade an old version.
if [ ! -e $CIRCLE_BUILD_DIR/bin/sassc ] || ! [[ `sassc -v` =~ "libsass: ${SASS_VERSION}" ]]; then
  export SASS_BUILD_DIR=$HOME/src/github.com/sass
  mkdir -p $SASS_BUILD_DIR
  cd $SASS_BUILD_DIR

  git clone --recursive https://github.com/sass/libsass.git -b ${SASS_VERSION}
  git clone https://github.com/sass/sassc.git -b ${SASS_VERSION}

  cd sassc
  SASS_LIBSASS_PATH=$SASS_BUILD_DIR/libsass make

  cp $SASS_BUILD_DIR/sassc/bin/sassc $CIRCLE_BUILD_DIR/bin/sassc
fi
