#!/bin/bash
FILES=$(find var/mnt -type f -regextype sed -regex '.*/etcd[b-k]/results[b-k][0-9][0]*.json')

jq -s 'map(.jobs[])' ${FILES} > jobs.json

jq -r '.[] | "\(.jobname), \(.sync.lat_ns.mean), \(.sync.lat_ns.max), \(.sync.lat_ns.percentile | ."99.000000" ), \(.sync.lat_ns.percentile | ."99.990000" )"' jobs.json

