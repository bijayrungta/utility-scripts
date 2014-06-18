#!/bin/bash

# @TODO Ensure this is not running as root.

SCRIPT_BASE_DIR=$(dirname $0)
CURRENT_PATH=`pwd`

mkdir -p ~/lib/bash
cp -r ${SCRIPT_BASE_DIR}/bash/* ~/lib/bash/

# @TODO, detect if the Bash ALiases content already exists..
isAliasesAlreadySetup=false
if [ -f ~/.bash_aliases ]; then
    if [ "$(grep -E 'BIJAY_UTILITY_SCRIPT_STARTS' ~/.bash_aliases)" ]; then
        isAliasesAlreadySetup=true
    fi
fi

if [ ! ${isAliasesAlreadySetup} ]; then
    cat ~/lib/bash/_bash_aliases.sh >> ~/.bash_aliases
fi
