#!/bin/bash

# Author: Nonso Chiagunye 
# Date Created: Feb 18 2024
# Date Modified: Feb 18 2024 
# Description: Add a new user to a linux system 
# Usage: sudo ./add_users.sh USER_NAME [FULL_NAME]

# Enforce the script is run with root privilege 
# Redirect the error message to stderr
if [[ ${UID} -ne 0 ]]
then  
 echo "Your username is $(id -un), you do not have permission to perform this action" >&2
 exit 1
fi

# There must be at least one argument. The username [and optional FULL_NAME]
if [[ $# -lt 1 ]]
then 
  echo "Usage: sudo $0 USER_NAME [FULL_NAME] .... " >&2
  exit 1
fi 

# The first argument is the username
USER_NAME=${1}

# Remove the first argument to remain the rest
shift 

# Everything after the first argument is the full name 
FULL_NAME=${@}

# Generate random password (multiply seconds with nanoseconds, and take 1st 32chars of the hash)
PASSWORD=$(date +%s%N | sha256sum | head -c32) &> /dev/null 

# Create account. -m forces creation of /home directory 
useradd -c "${FULL_NAME}" -m ${USER_NAME} &> /dev/null 

# Confirm that the account was actually created (the last command exited with 0)
if [[ $? -ne 0 ]]
then 
  echo 'Account could not be created. Please try again later' >&2
  exit 1
fi 

# Set the password 
echo ${PASSWORD} | passwd --stdin ${USER_NAME} &> /dev/null 

# Check if the password was created
if [[ $? -ne 0 ]]
then 
  echo 'Password could not be set.' >&2
  exit 1
fi

# Force password change on first login
passwd -e ${USER_NAME} &> /dev/null 

# Display the information

echo 'Username'
echo ${USER_NAME}
echo 'Password'
echo ${PASSWORD}
echo 'Hostname' 
echo $(hostname)
exit 0 