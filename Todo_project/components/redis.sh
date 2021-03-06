#!/bin/bash

source components/common.sh
OS_PREREQ

Head "Install Redis"
apt install redis-server -y &>>$LOG
Head "Update Redis Listen Address"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis/redis.conf

Head "Start Redis Service"
systemctl restart redis && systemctl start redis && systemctl status redis &>>$LOG
Stat $?