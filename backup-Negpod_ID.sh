#!/bin/bash

DIRECTORY="negpod_id-q1"
REMOTE_HOST="305cff4c0136.305cff4c0136.c0bb8d29.alu-cod.online"
REMOTE_USER="305cff4c0136"
REMOTE_PASS="8f02dc4d8f3de1df6eb9"
REMOTE_DIR="/summative/0524-2024m"

# Install sshpass if not already installed
if ! command -v sshpass &> /dev/null; then
    echo "sshpass could not be found, installing it..."
    sudo apt-get install -y sshpass
fi

sshpass -p $REMOTE_PASS scp -r $DIRECTORY $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR

echo "Backup completed."i
