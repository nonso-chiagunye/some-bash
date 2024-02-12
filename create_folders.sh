#!/bin/bash 

while read line;
do 
 mkdir "$(dirname $1)/$line"
done < <(cat $1) 




