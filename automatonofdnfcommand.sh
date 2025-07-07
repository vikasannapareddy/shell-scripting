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
    dnf install mysql-server -y       # this command is used to install mysql server, -y is used to automatically answer yes to all prompts
    if [ $? -eq 0 ]     
    then
        echo "Installing MYSQL server is........ successful"
    else
        echo "Installing MYSQL server is........ failed"
        exit 1

else                           # if the command is successful then it means that mysql is already installed
    echo "mysql is already installed.... nothing to do"

fi

