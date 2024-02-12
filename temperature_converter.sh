#!/bin/bash 

while getopts "f:c:" options;
do 
 case "$options" in 
  c)
   result=$(echo "scale=2; ((9 / 5) * $OPTARG) + 32" | bc);;
  f)
   result=$(echo "scale=2; (5 / 9) * ($OPTARG - 32)" | bc);;
  \?);;
 esac 
done 

echo $result 


