#!/bin/sh
# usage: vagrant up --provision

set -e

version='0.24.1'
ag_source="https://github.com/ggreer/the_silver_searcher/archive/${version}.tar.gz"

# INSTALL BUILD TOOL
sudo yum -y groupinstall "Development Tools"
sudo yum -y install rpmdevtools
sudo yum -y install pcre-devel xz-devel zlib-devel

rpmdev-setuptree

curl -L $ag_source -o ~/rpmbuild/SOURCES/the_silver_searcher-${version}.tar.gz

# GET SOURCE OF AG
tar xfzv ~/rpmbuild/SOURCES/the_silver_searcher-${version}.tar.gz -C ~/rpmbuild/BUILD
~/rpmbuild/BUILD/the_silver_searcher-${version}/build.sh
cp -a ~/rpmbuild/BUILD/the_silver_searcher-${version}/the_silver_searcher.spec ~/rpmbuild/SPECS

# BUILD
rpmbuild -ba ~/rpmbuild/SPECS/the_silver_searcher.spec
cp -a ~/rpmbuild/RPMS/$(uname -i)/* /vagrant
