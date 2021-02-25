#!/bin/bash

set -e

source ./secrets/sensitive.sh



IGNITION_CONFIG=rhcos.yaml
TEMPLATE_IGNITION_CONFIG=template.yaml



GOVC_BIN_URL="https://github.com/vmware/govmomi/releases/download/v0.24.0/govc_linux_amd64.gz"
FCCT_URL="https://github.com/coreos/fcct/releases/download/v0.10.0/fcct-x86_64-unknown-linux-gnu"

if [ ! -f govc  ]; then
    echo "Downloading govc..."
    curl -L ${GOVC_BIN_URL} | gunzip > govc
    chmod +x govc
fi

./govc vm.destroy "${VM_NAME}"

./govc datastore.rm -ds etcd ${VM_NAME}

