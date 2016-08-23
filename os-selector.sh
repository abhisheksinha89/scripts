#!/bin/bash
isUbuntu=`cat /etc/*-release | grep -w 'NAME' | awk -F"=" '{print $2}'`
if [ "$isUbuntu" == "\"Ubuntu\"" ];
  then
    echo "This is Ubuntu"
    exit
fi
isRedHat=`cat /etc/*-release | grep -w 'ID' | awk -F"=" '{print $2}'`
if [ "$isRedHat" == "\"rhel\"" ];
  then
    echo "This is RedHat"
    exit
fi
