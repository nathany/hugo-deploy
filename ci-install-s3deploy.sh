S3DEPLOY_VERSION=2.0.2
S3DEPLOY_DOWNLOAD=s3deploy_${S3DEPLOY_VERSION}_Linux-64bit.tar.gz

set -x
set -e

# Install s3deploy if not already cached or upgrade an old version.
if [ ! -e $CIRCLE_BUILD_DIR/bin/s3deploy ] || ! [[ `s3deploy version` =~ v${S3DEPLOY_VERSION} ]]; then
  wget https://github.com/bep/s3deploy/releases/download/v${S3DEPLOY_VERSION}/${S3DEPLOY_DOWNLOAD}
  tar xvzf ${S3DEPLOY_DOWNLOAD} s3deploy
  mv s3deploy $CIRCLE_BUILD_DIR/bin/s3deploy
fi
