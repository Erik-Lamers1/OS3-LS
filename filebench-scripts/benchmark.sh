#!/bin/bash

resultsdir=/filebench/results
workloadsdir=/filebench/workloads

cd /filebench/workloads

echo "Workdir = $workloadsdir"
echo "Resultsdir = $resultsdir"

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
