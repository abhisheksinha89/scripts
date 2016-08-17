#!/bin/bash

#Arguments check section

re='^[0-9]+$'
numberOfFiles=1
matchGetOptsArgs=0
zero=0

usage() { printf "Usage: $0 [-n <number of additional TempDb files to create>]"; exit 1; }


while getopts ":h?n:u:p:" opt; do
	case "${opt}" in
	  n)
  	  printf "Number of Initial Sql TempDb Files to be created: $OPTARG" >&2
      numberOfFiles=$OPTARG
      ((matchGetOptsArgs+=1))
      ;;
    u)
      userName=${OPTARG}
      ((matchGetOptsArgs+=1))
      ;;
    p)
      password=${OPTARG}
      ((matchGetOptsArgs+=1))
      ;;
    h|\?)
      usage
      ;;
    *)
      usage    
  esac
done	

if [ $matchGetOptsArgs -ne 3 ]; 
  then
    printf "Args matched "+$matchGetOptsArgs
    usage
fi

#Arguments check completed, beginning T-SQL logic

printf "\n"

printf "Creating "$numberOfFiles" additional TempDB files with default size of 8MB and Filegrowth 64MB\n"
sqlcmdCommand="sqlcmd -S localhost -U "$userName" -P "$password" -Q "

#Build the T-SQL to be executed

for ((i=0; i<$numberOfFiles; i++)); do
  tempName="temp$i"
  tempFileName="C:\data\tempdb_mssql_${i}.ndf"
  tsqlScriptBuilder="ALTER DATABASE tempdb ADD FILE (NAME = N'${tempName}' , FILENAME = N'${tempFileName}' , SIZE = 8MB , FILEGROWTH = 64MB);"
  
  #Execute command
  sqlcmd -S localhost -U $userName -P $password -Q "${tsqlScriptBuilder}"
done

