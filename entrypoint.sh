#!/bin/bash

# Generate a unique worker name using hostname and timestamp
LABEL="worker_$(cat /proc/sys/kernel/hostname)_$(date +%s)"

# Run rqminer in the background using nohup to keep it running after the script or terminal closes
nohup ./rqminer --threads 32 --id SVNIAUSOXIZQOFNNXTETJWRSEPHCPFJKTLHGEKGQBBCDZLTNDZBJDLACROBF --label "$LABEL" &

# Prevent script from failing by keeping it active
while true; do sleep 1; done
