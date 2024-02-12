#!/bin/bash 

# Author: Nonso Chiagunye
# Creation Date: 12-Feb-2024
# Modified Date: 12-Feb-2024
# Description: Removes crufts (Files unmodified for a certain age)
# Usage: ./cruft_remover.sh

read -p "Which directory do you want to delete from? " directory
read -p "How many days file do you want to delete? " date

readarray -t files < <(find $directory -maxdepth 3 -type f -mtime "+$date")

for file in "${files[@]}";
do
 rm -i "$file"
done 