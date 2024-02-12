#!/bin/bash 

PS3="What is the day of the week? "

select day in mon tue wed thu fri sat sun;
do 
 echo "Today is $day" 
break
done 


