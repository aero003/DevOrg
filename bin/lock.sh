#! /usr/bin/env bash

branch="$(git rev-parse --abbrev-ref HEAD)"

if [ "$1" = "lock" ]
then
    echo $branch branch is Locked  
    echo $branch > ./bin/.gitlock
elif [ "$1" = "unlock" ]   
then 
    echo $branch branch is Unlocked
    echo "unlocked" > ./bin/.gitlock
fi
#echo $branch > ./bin/.gitlock