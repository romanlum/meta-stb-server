
#!/bin/sh
sudo apt-get update
sudo apt-get install -y autoconf  xz-utils automake bison bzip2 cvs diffstat flex g++ gawk gcc gettext git-core gzip help2man ncurses-bin ncurses-dev libc6-dev libtool make texinfo patch perl pkg-config subversion tar texi2html wget zlib1g-dev chrpath libxml2-utils xsltproc libglib2.0-dev python-setuptools zip info coreutils diffstat chrpath libproc-processtable-perl libperl4-corelibs-perl sshpass default-jre default-jre-headless java-common libserf-dev qemu quilt
git clone git://github.com/oe-alliance/build-enviroment.git -b 4.4 build-environment.tmp

mkdir -p $(pwd)/build-enviroment/meta-stbserver/conf
cp build-environment.tmp/* $(pwd)/build-enviroment/ -R -f

cp -R $(pwd)/recipes-stb-server $(pwd)/build-enviroment/meta-stbserver/recipes-local/
cp -R $(pwd)/conf/* $(pwd)/build-enviroment/meta-stbserver/conf/



cd build-enviroment
sed -i -e 's/meta-local/meta-stbserver/g' Makefile

export DISTRO=stbserver
export MACHINE=gbx34k
make image

