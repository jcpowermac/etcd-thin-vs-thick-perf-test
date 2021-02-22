#!/bin/bash

FILES=$(find var -type f -name results.json)

printf "name,write.iops_mean,write.lat_ns_mean,write.lat_ns.max,sync.lat_ns.mean,sync.lat_ns.max\n"
jq '"\(.disk_util[].name), \(.jobs[].write.iops_mean), \(.jobs[].write.lat_ns.mean), \(.jobs[].write.lat_ns.max), \(.jobs[].sync.lat_ns.mean), \(.jobs[].sync.lat_ns.max)"' ${FILES}

