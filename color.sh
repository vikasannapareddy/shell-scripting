#!/bin/bash

USERID=$(id -u)

red="\e[31m"
green="\e[32m"
yellow="\e[33m"
nocolor="\e[0m"

if [ $USERID -ne 0 ]

then
    echo -e "$red ERROR:: please run this script with root access $nocolor"
    exit 1

else
    echo "you are running with root access"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "$Installing $2 is ....  $green SUCCESS $nocolor"
    else
        echo -e "installing $2 is ..... $red FAILURE $nocolor"
        exit 1
}

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo -e " Mysql is not installed.... going to install it"
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo -e " Mysql is  $yellow already installed.... nothing to do $nocolor"
fi


dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed... going to install it"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "Nothing to do python... $Y already installed $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "Nothing to do nginx... $Y already installed $N"
fi



