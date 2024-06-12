#!/bin/bash

DIRECTORY="negpod_id-q1"
REMOTE_HOST="305cff4c0136.305cff4c0136.c0bb8d29.alu-cod.online"
REMOTE_USER="305cff4c0136"
REMOTE_PASS="8f02dc4d8f3de1df6eb9"
REMOTE_DIR="/summative/0524-2024m"

# Check if REMOTE_PASS is set
if [ -z "$REMOTE_PASS" ]; then
    echo "REMOTE_PASS environment variable is not set."
    exit 1
fi

# Check if sshpass is installed, and install if it is not
if ! command -v sshpass &> /dev/null; then
    echo "sshpass could not be found, installing it..."
    if ! sudo apt-get install -y sshpass; then
        echo "Failed to install sshpass."
        exit 1
    fi
fi

# Create the target directory on the remote host if it does not exist
sshpass -p "$REMOTE_PASS" ssh -o StrictHostKeyChecking=no "$REMOTE_USER@$REMOTE_HOST" "mkdir -p $REMOTE_DIR" 2>&1 | tee mkdir.log
if [ ${PIPESTATUS[0]} -ne 0 ]; then
    echo "Failed to create directory on remote host. See mkdir.log for details."
    exit 1
fi

# Perform the secure copy using sshpass
if sshpass -p "$REMOTE_PASS" scp -o StrictHostKeyChecking=no -r "$DIRECTORY" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"; then
    echo "Backup completed successfully."
else
    echo "Backup failed."
    exit 1
fi

