#!/bin/bash 

# Author: Nonso Chiagunye

# Date Created: 2024-02-06

# Last Modified: 2024-02-06

# Description: Creates backup of the home directory

# Usage: sudo ./backup_script

if [[ "${UID}" -eq 0 ]] 
then 
 echo "You are not allowed to run this script with sudo." >&2
 exit 1
fi 

echo "Hello, ${USER^}"
echo
echo "I will now backup your home directory, $HOME"
echo 

currentdir=$(pwd) 

echo "You are running this script from $currentdir"
echo
echo "Therefore, I will save the backup in $currentdir"
echo



#BACKUP_DIRECTORY="${PWD}/bash_course" 

#if [[ ! -e "${BACKUP_DIRECTORY}" ]] 
#then 
# echo "Creating ${BACKUP_DIRECTORY}" 
# mkdir -p "${BACKUP_DIRECTORY}" 
#fi 

tar -cf "${currentdir}/my_backup_$(date +%d-%m-%Y_%H-%M-%S)".tar -C ${HOME}/* 2>/dev/null  

echo "Backup completed successfully"
#sleep 10

#if [[ "${?}" -ne 0 ]]
#then 
# echo "Last exit status is: ${?}"
# echo "Backup was not created. Kindly try again later" >&2 
# exit 1
#fi

#echo "Backup created successfully" 

exit 0 
