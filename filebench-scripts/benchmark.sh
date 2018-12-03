#!/bin/bash

resultsdir=/filebench/results
workloadsdir=/filebench/workloads

echo "Workdir = $workloadsdir"
echo "Resultsdir = $resultsdir"

cd "$workloadsdir"

## Retrieving the newest pre-defined workloads
wget https://raw.githubusercontent.com/Erik-Lamers1/OS3-LS/master/filebench-scripts/workloads/fileserver.f
wget https://raw.githubusercontent.com/Erik-Lamers1/OS3-LS/master/filebench-scripts/workloads/varmail.f
wget https://raw.githubusercontent.com/Erik-Lamers1/OS3-LS/master/filebench-scripts/workloads/webserver.f

if [ ! -d "$resultsdir" ]; then
     mkdir "$resultsdir"
fi

echo "### Beginning with the fileserver-test ###"
filebench -f $workloadsdir/fileserver.f &> $resultsdir/results_fileserver.txt
echo "# Done #"
sleep 30
rm -rf /filebench/logfiles
rm -rm /filebench/bigfileset
sleep 30

echo "### Beginning with the mailserver-test ###"
filebench -f $workloadsdir/varmail.f &> $resultsdir/results_mailserver.txt
echo "# Done #"
sleep 30
rm -rf /filebench/logfiles
rm -rm /filebench/bigfileset
sleep 30

echo "### Beginneing with the webserver-test ###"
filebench -f $workloadsdir/webserver.f &> $resultsdir/results_webserver.txt
echo "# Done #"
sleep 10
rm -rf /filebench/logfiles
rm -rm /filebench/bigfileset

echo
echo
echo "Test is completed. I wrote three result_files in $resultsdir."

