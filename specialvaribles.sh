#!/bin/bash

echo "all the variables passed to the script are $@"
echo "Number of variables passed to the script are $#"
echo "the name of the script is $0"
echo "the first variable passed to the script is $1"
echo "the second variable passed to the script is $2"
echo "the third variable passed to the script is $3"
echo "the fourth variable passed to the script is $4"
echo "current directory is $PWD"
echo "home directory is $HOME"
echo "pid of the current script is $$"
sleep 2 &
echo "pid of the last background process is $!"
echo "exit status of the last command is $?"
echo "current date and time is $(date)"
echo "current user is $USER"
echo "shell being used is $SHELL"
echo "terminal being used is $TERM"