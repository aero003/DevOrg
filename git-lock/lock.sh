#! /usr/bin/env bash
toplevel=$(git rev-parse --show-toplevel)
branch="$(git rev-parse --abbrev-ref HEAD)"
precommitfile=$toplevel/hooks/pre-receive

_run() {
    if [ "$1" = "lock" ]
    then
        echo $branch branch is Locked  
        echo $branch > ./git-lock/.gitlock
    elif [ "$1" = "unlock" ]   
    then 
        echo $branch branch is Unlocked
        echo "unlocked" > ./git-lock/.gitlock
    elif [ "$1" = "" ]
    then 
        echo Please mention lock or unlock    
    fi
}

if [ -f "$precommitfile" ]
then
    _run $1 
else 
    cp $toplevel/git-lock/pre-commit $precommitfile
    _run $1 
fi

