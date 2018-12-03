#!/bin/bash

resultsdir=/filebench/results
workloadsdir=/filebench/workloads

cd /filebench/workloads

echo "Workdir = $workloadsdir"
echo "Resultsdir = $resultsdir"

if [ ! -d "$resultsdir" ]; then
     mkdir "$resultsdir"
fi

filebench -f $workloadsdir/fileserver.f &> $resultsdir/results_fileserver.txt

sleep 10

filebench -f $workloadsdir/varmail.f &> $resultsdir/results_mailserver.txt

sleep 10

filebench -f $workloadsdir/webserver.f &> $resultsdir/results_webserver.txt

echo "Test is completed. I wrote three result_files in $resultsdir."

