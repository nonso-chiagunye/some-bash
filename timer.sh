#!/bin/bash 

time_seconds=""

while getopts m:s: options;
do 
 case $options in 
  m)
   time_seconds=$(( $time_seconds + $OPTARG * 60 ));;
  s)
   time_seconds=$(( $time_seconds + $OPTARG ));;
  \?);;

 esac 
done 

while [[ $time_seconds -gt 0 ]];
do 
 echo $time_seconds 
 time_seconds=$(( $time_seconds - 4 ))
 sleep 1s 
done 

echo "Time's Up!"

