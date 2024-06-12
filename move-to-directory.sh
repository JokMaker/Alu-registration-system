#!/bin/bash

DIRECTORY="negpod_id-q1"

# Ensure the directory exists
mkdir -p $DIRECTORY

# Move files to the directory
mv main.sh students-list_0524.txt select-emails.sh student-emails.txt $DIRECTORY

echo "Files moved to $DIRECTORY"
