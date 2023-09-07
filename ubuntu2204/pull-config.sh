#!/bin/bash

# Define important variables
user_home_dir=$(eval echo ~$USER)

# Define an array of source file paths
source_files=(
  "$user_home_dir/.ideavimrc" 
)

# Destination directory
destination_dir="./configs"

# Check if the destination directory exists
if [ ! -d "$destination_dir" ]; then
    echo "Destination directory does not exist. Creating it..."
    mkdir -p "$destination_dir"
fi

# Loop through the source file paths and copy each file to the destination directory
for source_file in "${source_files[@]}"; do
    # Extract the filename from the source path
    filename=$(basename "$source_file")

    # Copy the file to the destination directory
    sudo cp "$source_file" "$destination_dir/$filename"
    
    # Check if the copy was successful
    if [ $? -eq 0 ]; then
        echo "Copied: $filename"
    else
        echo "Failed to copy: $filename"
    fi
done

echo "Pull files finished!"
