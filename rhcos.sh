#!/bin/bash

set -e
#set -x

export GOVC_URL=
export GOVC_USERNAME=""
export GOVC_PASSWORD=""
export GOVC_INSECURE=1
export GOVC_DATASTORE=datastore1


IPADDR=""
GATEWAY=""
MASK=""
VM_NAME=rhcos

IGNITION_CONFIG=rhcos.yaml
TEMPLATE_IGNITION_CONFIG=template.yaml


cp "${TEMPLATE_IGNITION_CONFIG}" "${IGNITION_CONFIG}"

#VCSA_ISO=iso/vcsa.iso
#
FCOS_OVA_URL="https://releases-art-rhcos.svc.ci.openshift.org/art/storage/releases/rhcos-4.7/47.83.202102090044-0/x86_64/rhcos-47.83.202102090044-0-vmware.x86_64.ova"
GOVC_BIN_URL="https://github.com/vmware/govmomi/releases/download/v0.24.0/govc_linux_amd64.gz"
FCCT_URL="https://github.com/coreos/fcct/releases/download/v0.10.0/fcct-x86_64-unknown-linux-gnu"

if [ ! -f govc  ]; then
    echo "Downloading govc..."
    curl -L ${GOVC_BIN_URL} | gunzip > govc
    chmod +x govc
fi

if [ ! -f fcct ]; then
    echo "Downloading fcct..."
    wget --show-progress -nc -O fcct "${FCCT_URL}"
    chmod +x fcct
fi

if [[ "$(./govc vm.info "${VM_NAME}" | wc -c)" -eq 0 ]]
then
    if [ ! -f rhcos.ova ]; then
        echo "Downloading Fedora CoreOS OVA..."
        wget --show-progress -nc -O rhcos.ova "${FCOS_OVA_URL}"
    fi
    ./govc import.ova -options rhcos.json -name "${VM_NAME}" rhcos.ova
fi

./govc datastore.mkdir -ds etcd ${VM_NAME} || true

d=2

declare -a disks
declare -a filesystems

for l in {b..f}
do
    ./govc vm.disk.create -ds etcd -vm ${VM_NAME} -name ${VM_NAME}/disk${d} -size 5G -eager=false -thick=false
    printf -v temp_disk '{"device":"/dev/sd%s","wipe_table":true,"partitions":[{"number":1,"label":"etcd%s"}]}\n' "$l" "$d"
    printf -v temp_filesystem '{"path":"/var/mnt/etcd%s","device":"/dev/disk/by-partlabel/etcd%s","format":"xfs","wipe_filesystem":true,"label":"etcd%s","with_mount_unit":true}\n' "$d" "$d" "$d"
    disks+=$temp_disk
    filesystems+=$temp_filesystem
    d=$((d+1))
done


for l in {g..k}
do
    ./govc vm.disk.create -ds etcd -vm ${VM_NAME} -name ${VM_NAME}/disk${d} -size 5G -eager=true -thick=true
    printf -v temp_disk '{"device":"/dev/sd%s","wipe_table":true,"partitions":[{"number":1,"label":"etcd%s"}]}\n' "$l" "$d"
    printf -v temp_filesystem '{"path":"/var/mnt/etcd%s","device":"/dev/disk/by-partlabel/etcd%s","format":"xfs","wipe_filesystem":true,"label":"etcd%s","with_mount_unit":true}\n' "$d" "$d" "$d"
    disks+=$temp_disk
    filesystems+=$temp_filesystem
    d=$((d+1))
done

printf "  disks:\n" >> "${IGNITION_CONFIG}"
printf "    \055 %s\n" $disks >>  "${IGNITION_CONFIG}"
printf "  filesystems:\n" >> "${IGNITION_CONFIG}"
printf "    \055 %s\n" $filesystems >> "${IGNITION_CONFIG}"


CONFIG_DATA=$(./fcct --files-dir . --strict < rhcos.yaml | tee rhcosign.json | base64 -w0 -)
./govc vm.change -vm "${VM_NAME}" \
    -e guestinfo.ignition.config.data=${CONFIG_DATA} \
    -e guestinfo.ignition.config.data.encoding="base64" \
    -e guestinfo.afterburn.initrd.network-kargs="ip=${IPADDR}::${GATEWAY}:${MASK}:rhcos:ens192:none:8.8.8.8"

#printf "storage:\n" >> "${IGNITION_CONFIG}"
