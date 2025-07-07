#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "Error:: please run this script as root user"
    exit 1                    #give other than 0 upto 127
else
    echo "You are running this script as root user"


fi                             # fi is used to end the if statement

VALIDATE(){
    if [ $? -eq 0 ]          # $? is used to check the exit status of the last command executed, if it is equal to 0 then it means that the command was successful
    then
        echo "Installing $1 is........ successful"
    else
        echo "Installing $1 is........ failed"
        exit 1                 # exit with error code 1 ,this is used to indicate that the script did not run successfully
    fi
}





dnf list installed mysql         # this command is used to check whether mysql is installed or not
if [ $? -ne 0 ]                  # $? is used to check the exit status of the last command executed, if it is not equal to 0 then it means that the command failed
then
    echo "mysql is not installed.... going to install mysql"
    dnf install mysql -y   
    VALIDATE $? "MYSQL"     # $? is first input as $1,  mysql is second input as $2
else
    echo "mysql is already installed.... nothing to do"
fi
    

dnf list installed nginx         # this command is used to check whether nginx is installed or not
if [ $? -ne 0 ]                  # $? is used to check the exit status of the last command executed, if it is not equal to 0 then it means that the command failed
then
    echo "nginx is not installed.... going to install nginx"
    dnf install nginx -y       # this command is used to install nginx server, -y is used to automatically answer yes to all prompts
    VALIDATE $? "NGINX"
else
    echo "nginx is already installed.... nothing to do"
    
    exit 0


fi
dnf list installed python3 
if [ $? -ne 0 ]
then
    echo "python is not installed.... going to install python"
    dnf install python3 -y
    VALIDATE $? "PYTHON"
    

else
    echo "python3 is already installed.... nothing to do"
    # the command is successful then it means that python3 is already installed
    # so we can exit the script with success code 0
    exit 0


fi

