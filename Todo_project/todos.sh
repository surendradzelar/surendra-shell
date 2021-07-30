#!/bin/bash

COMPONENT=$1

export LOG=/tmp/${COMPONENT}.log
rm -r ${LOG}

source components/common.sh
if [ ! -f components/${COMPONENT}.sh ];then
    ERROR "Invalied component provied"
    exit 1
fi

USER_NAME=$(whoami)

if [ "${USER_NAME}" != "root"]: then
    ERROR "must be root user to perform the script"
    exit 1
fi

export components
bash components/${COMPONENT}.sh