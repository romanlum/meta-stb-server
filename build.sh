#!/bin/sh
sudo apt-get update
sudo apt-get install -y autoconf xz-utils automake bison bzip2 cvs diffstat flex g++ gawk gcc gettext git-core gzip help2man ncurses-bin ncurses-dev libc6-dev libtool make texinfo patch perl pkg-config subversion tar texi2html wget zlib1g-dev chrpath libxml2-utils xsltproc libglib2.0-dev python-setuptools zip info coreutils diffstat chrpath libproc-processtable-perl libperl4-corelibs-perl sshpass default-jre default-jre-headless java-common libserf-dev qemu quilt
git clone git://github.com/oe-alliance/build-enviroment.git -b 4.4 build-enviroment.tmp

mkdir -p $(pwd)/build-enviroment.tmp/meta-stbserver/conf

cp -R $(pwd)/recipes-stb-server $(pwd)/build-enviroment.tmp/meta-stbserver/recipes-local/
cp -R $(pwd)/conf/* $(pwd)/build-enviroment.tmp/meta-stbserver/conf/

export DISTRO=stbserver
export MACHINE=gbx34k

mkdir -p build-enviroment.tmp/builds/stbserver
ln -s build-enviroment/builds/stbserver/sstate-cache build-enviroment.tmp/builds/stbserver/sstate-cache

cd build-enviroment.tmp
sed -i -e 's/meta-local/meta-stbserver/g' Makefile

make image
