#!/bin/bash

find /var/mnt/ -name etcd* -type d -exec podman run -it --rm -v {}:{}:Z ljishen/fio --output-format=json --output="{}/results.json" --rw=write --ioengine=sync --fdatasync=1 --directory="{}" --size=200m --bs=2300 --name=etcd \; -exec sleep 10 \;

find /var/mnt -type f -name results.json | xargs tar -cvf /tmp/results.tar
