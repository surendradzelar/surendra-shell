#!/bin/bash

source components/common.sh

DOMAIN=zssurendra.tk

OS_PREREQ

Head "installing Nginx"
apt install nginx -y &>>$LOG
Stat $?

Head"install npm"
apt install npm -y &>>$LOG
Stat $?



Head "create Directory"
cd /var/www/html & >>$LOG
Stat $?
mkdir todo &>>$LOG
Stat $?
cd todo &>>$LOG
Stat $?
rm -rf frontend &>>$LOG
Stat $?

Head "Downloading content"
DOWNLOAD_COMPONENT
cd frontend
Stat $?

Head "run and build npm"
npm install -g npm@latest &>>$LOG
npm install shelljs &>>$LOG
npm install --save-dev  --unsafe-perm node-sass &>>$LOG
npm run build  &>>$LOG
Stat $?


Head "Replacing domain names"
sed -i '32 s/127.0.0.1/login.zssurendra.tk/g' /var/www/html/todo/frontend/config/index.js
sed -i '36 s/127.0.0.1/todo.zssurendra.tk/g'  /var/www/html/todo/frontend/config/index.js
Stat $?

Head "start and restart Nginx"
systemctl restart nginx &>>$LOG && systemctl start nginx &>>$LOG  && systemctl status nginx &>>$LOG
Stat $?

Head "npm start"
npm start 
Stat $?
