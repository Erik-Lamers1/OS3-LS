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

wget https://raw.githubusercontent.com/Erik-Lamers1/OS3-LS/master/filebench-scripts/workloads/fileserver.f
wget https://raw.githubusercontent.com/Erik-Lamers1/OS3-LS/master/filebench-scripts/workloads/varmail.f
wget https://raw.githubusercontent.com/Erik-Lamers1/OS3-LS/master/filebench-scripts/workloads/webserver.f

cd /filebench/
wget https://raw.githubusercontent.com/Erik-Lamers1/OS3-LS/master/filebench-scripts/benchmark.sh

chmod +x benchmark.sh

read -p "Would you like to run the benchmark? [Y/n]" -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
     sh ./benchmark.sh
fi
