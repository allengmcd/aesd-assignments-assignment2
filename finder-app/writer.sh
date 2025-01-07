#!/bin/bash


# Check if there are at least 2 parameters
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 [writefile] [writestr]"
    exit 1
fi

WRITEFILE=$1
WRITESTR=$2

# Extract path from WRITEFILE
DIR="$(dirname "$WRITEFILE")"

# Create path to file
$(mkdir -p $DIR)

# Create and write to file
$(echo $2 > $1)


# Confirm creation
if [ -f "$WRITEFILE" ]; then
    echo "'$WRITEFILE' was created successfully."
else
    echo "Failed to create '$WRITEFILE'."
    exit 1
fi