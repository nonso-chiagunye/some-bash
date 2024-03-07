#!/bin/bash 

# Author: Nonso Chiagunye

# Date Created: 2024-02-06

# Last Modified: 2024-02-06

# Description: Creates backup of user's home directory  

# Usage: sudo ./backup_docs.sh 

if [[ "${UID}" -ne 0 ]] 
then 
 echo "You need to run this script with sudo." >&2
 exit 1
fi 

BACKUP_DIRECTORY="/tmp/backups" 

if [[ ! -e "${BACKUP_DIRECTORY}" ]] 
then 
 echo "Creating ${BACKUP_DIRECTORY}" 
 mkdir -p "${BACKUP_DIRECTORY}" 
fi 

tar -cvf "${BACKUP_DIRECTORY}/$(date +%d-%m-%Y_%H-%M-%S)".tar -C ~/* 2> "${BACKUP_DIRECTORY}/errors.log" 

if [[ "${?}" -ne 0 ]]
then 
 echo "Last exit status is: ${?}"
 echo "Backup was not created. Kindly try again later" >&2 
 exit 1
fi

echo "Backup created successfully" 

exit 0 
