
#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


LOGS_FOLDER="/var/log/shellscript-logs" #logs folder create chaysi log files store chayali var/log are standard log file in linux

SCRIPT_NAME=$(echo $0 | cut -d "." -f1) # $0 is the name of the script (creatinglogfile.sh) ani vachidi, cut command is used to remove the extension of the script file
# cut -d "." -f1 means cut the string using "." as delimiter and take the first field
# if the script name is creatinglogfile.sh then SCRIPT_NAME will be creatinglogfile
# LOG_FILE is the file where we will store the logs of the script execution

LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # this will create a log file with the name of the script in the logs folder
# if the script is creatinglogfile.sh then the log file will be /var/log/shellscript-logs/creatinglogfile.log

mkdir -p $LOGS_FOLDER # -p option is used to create the directory if it does not exist, it will not throw an error if the directory already exists

echo "Script started executing at: $(date)" | tee -a $LOG_FILE # tee command is used to write the output of the command to both the terminal and the log file


if [ $USERID -ne 0 ]
then
    # &>>$LOG_FILE is used to redirect the output of the command to the log file (ekkada ithe output avasam loo akada store chayali)
    echo -e "$R ERROR:: Please run this script with root access $N" | tee -a $LOG_FILE # tee command is used to write the output of the command to both the terminal and the log file and displays it
    exit 1 #give other than 0 upto 127
else
    echo "You are running with root access" | tee -a $LOG_FILE
fi

# validate functions takes input as exit status, what command they tried to install
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is ... $G SUCCESS $N" | tee -a $LOG_FILE
    else
        echo -e "Installing $2 is ... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    fi
}

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "MySQL is not installed... going to install it" | tee -a $LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MySQL"
else
    echo -e "Nothing to do MySQL... $Y already installed $N" | tee -a $LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "python3 is not installed... going to install it" | tee -a $LOG_FILE
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo -e "Nothing to do python... $Y already installed $N" | tee -a $LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it" | tee -a $LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e "Nothing to do nginx... $Y already installed $N" | tee -a $LOG_FILE
fi
