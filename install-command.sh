#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0]
then
    echo "Error:: please run this script as root user"
    exit 1 #exit with error code 1 ,this is used to indicate that the script did not run successfully
fi #fi is used to end the if statement
# other than 0 exit code is used to indicate that the script did not run successfully from 1-127 the number may be anything
