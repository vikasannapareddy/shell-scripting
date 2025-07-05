#!/bin/bash
variable=$1
# Check if a variable is passed as an argument 
# -gt (greater than)
# -lt (less than)
# -eq (equal to)
# -ne (not equal to)




if [ $variable -lt 10 ] # Check if the variable is less than 10 using -lt (lessthan)
then
    echo "The $variable is less than 10"

else
    echo "The $variable is greater than or equal to 10"
fi