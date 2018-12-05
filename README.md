# OS3-LS
Large systems project code

## VM setup
In order to setup the VMs, the following script could be executed:
```
curl -sSL https://raw.githubusercontent.com/Erik-Lamers1/OS3-LS/master/vm-setup/vm-setup.sh | bash
```

This script will also execute the command which is defined in the Filebench - Quick Install section. 

## Filebench
Filebench is used in order to test the filesystem performance. 

### Quick install

Use the command 

```
curl -sSL https://raw.githubusercontent.com/Erik-Lamers1/OS3-LS/master/filebench-scripts/install-script.sh  | bash
```

Then execute the script ```benchmark.sh``` which is located in ```/filebench/```

### Manual running

Go to ```/filebench/workloads```. Use the command ```filebench -f FILENAME.f``` to initiate a test.
