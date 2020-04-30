#!/bin/bash

# Update hosts file
echo "[TASK 1] Update the machine"
yum update -y

# Set Root password
echo "[TASK 12] Set root password"
echo "root123" | passwd --stdin root >/dev/null 2>&1