#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0]
then
    echo "Error:: please run this script as root user"
fi #fi is used to end the if statement