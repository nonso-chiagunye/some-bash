#!/bin/bash 

# Author: Nonso Chiagunye
# Date Created: feb 20 2024
# Date Modified: feb 20 2024
# Description: Get IP and Geolocation information of over over 10 failed login entry in a syslog
# Usage: ./filter_atacker.sh LOG_FILE 

# Count the number of failed logins by IP address.
# If there are any IPs with over LIMIT failures, display the count, IP, and location.

LIMIT='10'
FILE="${1}" 

# Make sure a file was supplied as an argument.
if [[ ! -e "${FILE}" ]]
then
 echo "Cannot open log file: ${FILE}" >&2 
 exit 1
fi

# Save the CSV header to a file
echo 'Count,IP,Location' > attacker.csv

# Loop through the list of failed attempts and corresponding IP addresses.
grep Failed "${FILE}" | awk '{print $(NF - 3)}' | sort | uniq -c | sort -nr | while read COUNT IP
do
  # If the number of failed attempts is greater than the limit, display count, IP, and location.
 if [[ "${COUNT}" -gt "${LIMIT}" ]]
 then
   LOCATION=$(geoiplookup ${IP} | awk -F ', ' '{print $2}')
   echo "${COUNT},${IP},${LOCATION}" >> attacker.csv 
 fi 
done

exit 0 