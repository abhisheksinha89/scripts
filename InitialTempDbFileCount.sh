#!/bin/bash
#Get the number of Initial Sql Temp Db files to be created
re='^[0-9]+$'
numberOfFiles=1
matchGetOptsArgs=0
zero=0

usage() { echo "Usage: $0 [-n <number of TempDb files to create>]"; exit 1; }


while getopts ":h?n:" opt; do
	case "${opt}" in
	  n)
  	  echo "Number of Initial Sql TempDb Files to be created: $OPTARG" >&2
      numberOfFiles=$OPTARG
      matchGetOptsArgs+=1
      ;;
    h|\?)
      usage
      ;;
    *)
      usage    
  esac
done	

if [ $matchGetOptsArgs -eq 0 ]; 
  then
    usage
fi

for ((i=0; i<$numberOfFiles; i++)); do
  echo $i
done
