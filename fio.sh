#!/bin/bash

for l in {b..k}
do
    for i in {1..10}
    do
        podman run -it --rm -v "/var/mnt/etcd${l}":"/var/mnt/etcd${l}":Z ljishen/fio --output-format=json --output="/var/mnt/etcd${l}/results${l}${i}.json" --rw=write --ioengine=sync --fdatasync=1 --directory="/var/mnt/etcd${l}" --size=200m --bs=2300 --name="etcd${l}${i}"
        sleep 10
        rm "/var/mnt/etcd${l}/etcd${l}${i}.0.0"
    done
done

find /var/mnt -type f -name results* | xargs tar -cvf /tmp/results.tar
