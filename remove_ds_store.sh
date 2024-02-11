#!/bin/bash

# Function to remove .DS_Store files recursively
remove_ds_store() {
    # Loop through all files and directories in the current folder
    for item in "$1"/*; do
        if [ -d "$item" ]; then
            # If it's a directory, recursively call the function
            remove_ds_store "$item"
        elif [ "${item##*/}" == ".DS_Store" ]; then
            # If it's a .DS_Store file, remove it
            rm "$item"
            echo "Removed: $item"
        fi
    done
}

# Call the function with the specified folder path
remove_ds_store "/path/to/your/folder"

