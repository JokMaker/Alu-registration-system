#!/bin/bash

# Define the directory and files with absolute paths
TARGET_DIR="negpod_id-q1"
SOURCE_DIR="/Alu-registration-system"
FILES=("main.sh" "students-list_0524.txt" "select-emails.sh" "student-emails.txt")

# Create the target directory if it does not exist
if [ ! -d "$SOURCE_DIR/$TARGET_DIR" ]; then
    mkdir -p "$SOURCE_DIR/$TARGET_DIR"
fi

# Check and move each file
for FILE in "${FILES[@]}"; do
    SOURCE_PATH="$SOURCE_DIR/$FILE"
    TARGET_PATH="$SOURCE_DIR/$TARGET_DIR/$FILE"
    if [ -e "$SOURCE_PATH" ]; then
        if [ "$SOURCE_PATH" != "$TARGET_PATH" ]; then
            mv "$SOURCE_PATH" "$SOURCE_DIR/$TARGET_DIR" && echo "Moved $FILE to $TARGET_DIR"
        fi
    fi
done

echo "Files moved to $TARGET_DIR"

