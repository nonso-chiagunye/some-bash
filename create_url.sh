#!/bin/bash

readarray -t urls < <(cat urls.txt)

for url in ${urls[@]};
do 
 filename=$(echo $url | awk -F '.' '{print $2}')
 location="${HOME}/bash_course/while_loop/${filename}.txt"
 curl --head $url > $location 
 echo "$url sent to $location"
done 