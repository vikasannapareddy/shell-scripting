#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "Error:: please run this script as root user"
    exit 1 #exit with error code 1 ,this is used to indicate that the script did not run successfully
else
    echo "You are running this script as root user"


fi #fi is used to end the if statement

dnf list installed mysql         # this command is used to check whether mysql is installed or not
if [ $? -ne 0 ]                  # $? is used to check the exit status of the last command executed, if it is not equal to 0 then it means that the command failed
then
    echo "mysql is not installed.... going to install mysql"
    dnf install mysql -y       # this command is used to install mysql server, -y is used to automatically answer yes to all prompts
    if [ $? -eq 0 ]     
    then
        echo "Installing MYSQL server is........ successful"
    else
        echo "Installing MYSQL server is........ failed"
        exit 1
    fi
else
    echo "mysql is already installed.... nothing to do"
    # the command is successful then it means that mysql is already installed
    # so we can exit the script with success code 0
    exit 0


fi
dnf list installed nginx         # this command is used to check whether nginx is installed or not
if [ $? -ne 0 ]                  # $? is used to check the exit status of the last command executed, if it is not equal to 0 then it means that the command failed
then
    echo "nginx is not installed.... going to install nginx"
    dnf install nginx -y       # this command is used to install nginx server, -y is used to automatically answer yes to all prompts
    if [ $? -eq 0 ]     
    then
        echo "Installing NGINX server is........ successful"
    else
        echo "Installing NGINX server is........ failed"
        exit 1
    fi
else
    echo "nginx is already installed.... nothing to do"
    # the command is successful then it means that nginx is already installed
    # so we can exit the script with success code 0
    exit 0


fi
dnf list installed python3         # this command is used to check whether python3 is installed or not
if [ $? -ne 0 ]                  # $? is used to check the exit status of the last command executed, if it is not equal to 0 then it means that the command failed
then
    echo "python is not installed.... going to install python"
    dnf install python3 -y       # this command is used to install python3, -y is used to automatically answer yes to all prompts
    if [ $? -eq 0 ]     
    then
        echo "Installing python3 is........ successful"
    else
        echo "Installing python3 is........ failed"
        exit 1
    fi
else
    echo "python3 is already installed.... nothing to do"
    # the command is successful then it means that python3 is already installed
    # so we can exit the script with success code 0
    exit 0


fi

