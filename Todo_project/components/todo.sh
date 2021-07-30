#!/bin/bash

source components/common.sh

#Used export instead of service file
DOMAIN=zssurendra.tk

OS_PREREQ

Head "Installing npm"
apt install npm -y &>>$LOG
Stat $?

Head "Adding user"
deluser app
useradd -m -s /bin/bash todo &>>$LOG
Stat $?

Head "Changing directory"
cd /home/todo/
Stat $?

Head "Downloading Component"
rm -rf todo
DOWNLOAD_COMPONENT
Stat $?

cd todo/

Head "Installing NPM"
npm install --save-dev  --unsafe-perm node-sass &>>$LOG
Stat $?

Head "pass the EndPoints in Service File"
sed -i -e "s/REDIS_ENDPOINT/redis.zssurendra.tk/" systemd.service
Stat $?

Head "Setup the systemd Service"
mv systemd.service /etc/systemd/system/todo.service &>>$LOG
systemctl daemon-reload && systemctl start todo && systemctl enable todo  &>>$LOG
systemctl status todo
Stat $?