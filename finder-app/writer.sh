#!/bin/bash

if [ $# -ne 2 ]
then
	echo "Usage: $0 <writefile> <writestr>"
	exit 1
fi

writefile="$1"
writestr="$2"

if [ -z "$writefile" ]
then
	echo "Error: writefile argument is not specified"
	exit 1
fi

if [ -z "$writestr" ]
then
	echo "Error: writestr argument is not specified"
	exit 1
fi


directoryPath=$(dirname "$writefile")

if [ ! -d "$directoryPath" ]
then
	mkdir -p "$directoryPath" || 
		{ 
			echo "Error: Could not create the directory path $directoryPath"
			exit 1
		}
fi

echo "$writestr" > "$writefile" ||
	{
		echo "Error: Could not write to $writefile"
		exit 1
	}





