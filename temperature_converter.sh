#!/bin/bash 


# Author: Nonso Chiagunye
# Date Created: feb 24 2024
# Date Modified: feb 24 2024
# Description: Convert temperature from one form to another
# Usage: ./temperature_converter.sh [-c DEGREES] [-f FAHRENHEIT]

# Display a usage help for the uiser if the options are wrong
usage() {
  echo "Usage: ${0} [-c DEGREES] [-f FAHRENHEIT]" >&2
  echo 'Convert temperature from one form to the other.' >&2
  echo '  -c DEGREES  Temperature in degrees.' >&2
  echo '  -f FAHRENHEIT Temperature in fahrenheit.' >&2
  exit 1
}

# Ensure user specifies a temperature as an argument
if [[ $# -lt 1 ]]
then 
 echo "You must specify a temperature in degrees or fahrenheit." >&2
 usage
fi 

# Convert the temperature from one form to another depending on user option
while getopts "f:c:" options;
do 
 case "$options" in 
  c)
   result=$(echo "scale=2; ((9 / 5) * $OPTARG) + 32" | bc);;
  f)
   result=$(echo "scale=2; (5 / 9) * ($OPTARG - 32)" | bc);;
  ?)
   usage ;;
 esac 
done 

# Print result. 
echo $result 


