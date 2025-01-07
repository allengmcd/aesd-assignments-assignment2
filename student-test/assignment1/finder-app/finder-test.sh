#!/bin/bash


# Check if there are at least 2 parameters
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 [numfiles] [writestr]"
    exit 1
fi

if [ 0 -ne "$1" ]; then
    NUMFILES=$1
else
    NUMFILES=10
fi

if [ -z "$2" ]; then
    WRITESTR=$2
else
    WRITESTR="AELD_IS_FUN"
fi


# Create path for the files
$(mkdir -p "/tmp/aeld-data")

username=$(cat "/conf/username.txt")

for i in $(seq 1 $NUMFILES);
do
    FILENAME="/tmp/aeld-data/username$i.txt"
    output=$(./writer.sh $FILENAME $WRITESTR)
    #echo $output
done


FILENAME="/tmp/aeld-data"
output=$(./finder.sh $FILENAME $WRITESTR)
#echo $output

EXPECTEDOUTPUT="The number of files are $NUMFILES and the number of matching lines are $NUMFILES"

if [ "$output" = "$EXPECTEDOUTPUT" ]; then
    echo "success"
else
    echo "error"
fi