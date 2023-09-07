#!/bin/bash

# Define important variables
user_home_dir=$(eval echo ~$USER)

# Define arrays of source and destination paths
source_paths=(
    "./configs/.ideavimrc"
)
destination_paths=(
    "$user_home_dir/.ideavimrc"
)

# Check if the number of source and destination paths is the same
if [ ${#source_paths[@]} -ne ${#destination_paths[@]} ]; then
    echo "Number of source and destination paths must match."
    exit 1
fi
# Check if the filename of source and destination is the same
for ((i=0; i<${#source_paths[@]}; i++)); do
    source="${source_paths[$i]}"
    destination="${destination_paths[$i]}"
    source_filename=$(basename "$source")
    destination_filename=$(basename "$destination")
    if [ ! "$source_filename" = "$destination_filename" ]; then
      echo "Filenames do not match: $source_filename vs $destination_filename"
      exit 1
    fi
done

# Loop through the arrays and copy each file
for ((i=0; i<${#source_paths[@]}; i++)); do
    source="${source_paths[$i]}"
    destination="${destination_paths[$i]}"
    
    # Check if the source file exists
    if [ -e "$source" ]; then
        sudo cp "$source" "$destination"
        echo "Copied: $source -> $destination"
    else
        echo "Source file does not exist: $source"
    fi
done

echo "All files copied successfully."
