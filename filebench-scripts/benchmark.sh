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
sleep 10

echo "### Beginning with the mailserver-test ###"
filebench -f $workloadsdir/varmail.f &> $resultsdir/results_mailserver.txt
echo "# Done #"
sleep 10

echo "### Beginneing with the webserver-test ###"
filebench -f $workloadsdir/webserver.f &> $resultsdir/results_webserver.txt
echo "# Done #"

echo
echo
echo "Test is completed. I wrote three result_files in $resultsdir."

