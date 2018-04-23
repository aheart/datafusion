#!/usr/bin/env bash
#
# Upload Code Coverag Report

set -e 

apt update
apt -y install libcurl4-openssl-dev libelf-dev libdw-dev cmake gcc binutils-dev libiberty-dev

wget https://github.com/SimonKagstrom/kcov/archive/master.tar.gz
tar xzf master.tar.gz
cd kcov-master
mkdir build
cd build
cmake ..
make
make install DESTDIR=../../kcov-build
cd ../..
rm -rf kcov-master

for file in target/debug/datafusion-*[^\.d]; do
    mkdir -p "target/cov/$(basename $file)";
    ./kcov-build/usr/local/bin/kcov --exclude-pattern=/.cargo,/usr/lib --verify "target/cov/$(basename $file)" "$file";
done

ls -la /target/cov/

wget -O - -q "https://codecov.io/bash" > .codecov
chmod +x .codecov
./.codecov -t $CODECOV_TOKEN
echo "Uploaded code coverage"
