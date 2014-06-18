#!/bin/bash

function bjFindFiles()
{
    pattern="$1"
    fileTypeOptions=""
    pathToCheck=.
    if [ "$2" ]; then
        fileTypeOptions=" -type $2"
    fi
    if [ "$3" ]; then
        pathToCheck="$3"
    fi
    find ${pathToCheck} ${fileTypeOptions} -regex ".*${pattern}.*"
}

function rmMatching()
{
    printHeader "Will remove following Files matching pattern *$1*"
    ls *$1*
    rm *$1*
    printInfo "### Done ###"
}
