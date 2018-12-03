#!/bin/bash

apt update && upgrade

apt install -y libtool m4 autotools-dev wget make git bison flex

cd /tmp

wget https://github.com/filebench/filebench/releases/download/1.5-alpha3/filebench-1.5-alpha3.tar.gz

tar xvfz filebench-1.5-alpha3.tar.gz

cd filebench-1.5-alpha3

./configure && make && make install

mkdir /filebench/
mkdir /filebench/workloads/

cp /usr/local/share/filebench/workloads/webserver.f /filebench/workloads/
cp /usr/local/share/filebench/workloads/fileserver.f /filebench/workloads/
cp /usr/local/share/filebench/workloads/varmail.f /filebench/workloads/

