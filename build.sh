
#!/bin/sh
sudo apt-get install -y autoconf automake bison bzip2 cvs diffstat flex g++ gawk gcc gettext git-core gzip help2man ncurses-bin ncurses-dev libc6-dev libtool make texinfo patch perl pkg-config subversion tar texi2html wget zlib1g-dev chrpath libxml2-utils xsltproc libglib2.0-dev python-setuptools zip info coreutils diffstat chrpath libproc-processtable-perl libperl4-corelibs-perl sshpass default-jre default-jre-headless java-common libserf-dev qemu quilt
git clone git://github.com/oe-alliance/build-enviroment.git -b 4.4

ln -s $(pwd)/recipes-stb-server $(pwd)/build-enviroment/meta-local/recipes-local/
ln -s $(pwd)/conf/distro $(pwd)/build-enviroment/meta-local/conf/

cd build-enviroment
export DISTRO=stbserver
export MACHINE=gbx34k
make image

