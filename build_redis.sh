#!/usr/bin/env bash

source /vagrant/redis_vars.sh

# download, unpack and build redis
rm -rf $REDIS_BUILD_DIR

mkdir $REDIS_BUILD_DIR

wget -qO- https://github.com/antirez/redis/archive/$REDIS_VERSION.tar.gz | tar xvz -C $REDIS_BUILD_DIR --strip-components=1

pushd $REDIS_BUILD_DIR
make
sudo make install
cp src/redis-trib.rb /usr/local/bin/redis-trib.rb
cp ./redis.conf /etc/redis.conf

# If we don't make Redis bind to 0.0.0.0, we can't access it.
sed -i -e 's/bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis.conf

popd
