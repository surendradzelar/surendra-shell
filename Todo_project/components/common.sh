#!/bin/bash

Head () {
     echo -e "\e[1;34m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% $1 %%%%%%%%%%%%%%%%%%%%%%%% \e[0m "
    echo -e "\e[1;33m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% $1 %%%%%%%%%%%%%%%%%%%%%% \e[0m "  >>$LOG
}

Stat() {
    if [ "$1" -eq "0" ]; then
        echo -e "\e[1;32mSUCCESS\e[0m"
        else
        echo -e "\e[1;32mFAIL\e[0m"
        echo -e "\n\e[1;33m You can refer log file fore more information, Log file Path = ${LOG}\e[0m"
        exit 1
    fi
}

OS_PREREQ(){
    set-hostname ${COMPONENT}
    Head "updating the pacakges"
    apt update &>>$LOG
    Stat $?
}
   
ERROR(){
    echo -e "\e[1;35m$1\e[0m"
}
    
DOWNLOAD_COMPONENT(){
    Head "updating ${COMPONENT} "
    git clone "https://github.com/surendradzelar/${COMPONENT}"
}