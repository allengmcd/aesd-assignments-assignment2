#!/bin/bash


# Check if there are at least 2 parameters
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 [filesdir] [searchstr]"
    exit 1
fi

FILESDIR=$1
SEARCHSTR=$2

if [[ -d $FILESDIR ]]; then
    test=""
else
    exit 1
fi


directory="$FILESDIR" 

# Count the number of files
count=$(find "$directory" -type f | wc -l)


# Run grep command and store its output in a variable
output=$(grep -R "$SEARCHSTR" "$FILESDIR") 

# Count the number of lines in the output
line_count=$(echo "$output" | wc -l) 

# Check if grep found a match
echo "The number of files are $count and the number of matching lines are $line_count"
