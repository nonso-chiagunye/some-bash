#!/bin/bash 

# Author: Nonso Chiagunye
# Date Created: 12-02-2024
# Date Modified: 12-02-2024
# Description: Choose the script to run between cruft remover and directory organizer
# Usage: ./toolkit.sh 


PS3="Select the script to run: " 

select script in "cruft_remover" "folder_organizer";
do 
 "${PWD}/${script}".sh 
 break 
done 
