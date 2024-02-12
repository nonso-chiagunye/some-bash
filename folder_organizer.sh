#!/bin/bash

# Author: Nonso Chiagunye
# Date Created: 12-02-2024
# Date Modified: 12-02-2024
# Description: Organnizes files into sub directories based on file type (extension)
# Usage: ./folder_organizer.sh 

read -p "Enter directory to organize " directory

while read file;
do
 case ${file} in
  *.jpg|*.jpeg|*.png)
   sub_directory="images" ;;
  *.doc|*.docx|*.txt|*.pdf)
   sub_directory="documents" ;;
  *.xls|*.xlsx|*.csv)
   sub_directory="spreadsheet" ;;
  *.sh)
   sub_directory="scripts" ;;
  *.tar|*.zip|*.tar.gz|*.tar.gz.bz2)
   sub_directory="archives" ;;
  *.ppt|*.pptx)
   sub_directory="presentations" ;;
  *.mp3)
   sub_directory="audio" ;;
  *.mp4)
   sub_directory="video" ;;
  *)
   sub_directory="." ;;
 esac 

 if [[ ! -d "$directory/$sub_directory" ]];
 then 
  mkdir "$directory/$sub_directory"
 fi 

 mv $file $directory/$sub_directory

done < <(find $directory -type f -exec ls {} \;)
