#!/bin/bash

apt update && upgrade

## Retrieving the needed packages ##
apt install -y libtool m4 autotools-dev wget make git bison flex

cd /tmp

## Retrieving the filebench tarball
wget https://github.com/filebench/filebench/releases/download/1.5-alpha3/filebench-1.5-alpha3.tar.gz

tar xvfz filebench-1.5-alpha3.tar.gz

cd filebench-1.5-alpha3

## Compiling filebench
./configure && make && make install

mkdir /filebench/
mkdir /filebench/workloads/
cd /filebench/workloads/

## Retrieving the pre-defined workloads
wget https://raw.githubusercontent.com/Erik-Lamers1/OS3-LS/master/filebench-scripts/workloads/fileserver.f
wget https://raw.githubusercontent.com/Erik-Lamers1/OS3-LS/master/filebench-scripts/workloads/varmail.f
wget https://raw.githubusercontent.com/Erik-Lamers1/OS3-LS/master/filebench-scripts/workloads/webserver.f

cd /filebench/

## Retrieving the benchmark script
wget https://raw.githubusercontent.com/Erik-Lamers1/OS3-LS/master/filebench-scripts/benchmark.sh

chmod +x benchmark.sh

echo "Filebench is installed. Please run 'benchmark.sh' in order to run the benchmark."
