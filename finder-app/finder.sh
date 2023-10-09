#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir="$1"
searchstr="$2"

# Check if filesdir is a valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a valid directory."
    exit 1
fi


search_files() {
    local dir="$1"
    local search="$2"
    local file_count=0
    local match_count=0

    # Loop through files in the directory and its subdirectories
    while IFS= read -r -d '' file; do
        if [ -f "$file" ]; then
            ((file_count++))
            # Use grep to search for the searchstr in the file
            if grep -q "$search" "$file"; then
                ((match_count++))
            fi
        fi
    done < <(find "$dir" -type f -print0)

    echo "The number of files are $file_count and the number of matching lines are $match_count"
}

search_files "$filesdir" "$searchstr"

exit 0

