#!/bin/bash
echo "Show dump output. Please hit any key to continue."
read -n 1 -s
set -x
deck gateway dump
set +x

echo "Output dump to file. Please hit any key to continue."
read -n 1 -s
set -x
deck gateway dump -o ./mygw-backup.yaml
set +x