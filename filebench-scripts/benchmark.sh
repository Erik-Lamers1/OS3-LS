#!/bin/bash

resultsdir=/filebench/results
workloadsdir=/filebench/workloads
declare -a server_types=("fileserver" "webserver" "mailserver")

echo "Workdir = $workloadsdir"
echo "Resultsdir = $resultsdir"

cd "$workloadsdir"
rm "$workloadsdir/*"
## Retrieving the newest pre-defined workloads
wget https://raw.githubusercontent.com/Erik-Lamers1/OS3-LS/master/filebench-scripts/workloads/fileserver.f
wget https://raw.githubusercontent.com/Erik-Lamers1/OS3-LS/master/filebench-scripts/workloads/mailserver.f
wget https://raw.githubusercontent.com/Erik-Lamers1/OS3-LS/master/filebench-scripts/workloads/webserver.f

if [[ ! -d "$resultsdir" ]]; then
     mkdir "$resultsdir"
fi

function run_benchmark() {

echo "### Beginning with the $1-test ###"
filebench -f $workloadsdir/$1.f &> $resultsdir/results_$1.txt
echo "# Done #"
sleep 30
rm -rf /filebench/logfiles
rm -rf /filebench/bigfileset
sleep 30

}

for i in ${server_types[@]}; do
   run_benchmark ${i}
done

echo
echo
echo "Test is completed. I wrote three result_files in $resultsdir."
