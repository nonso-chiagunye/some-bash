#!/bin/bash

# Author: Nonso Chiagunye
# Date Created: feb 24 2024
# Date Modified: feb 24 2024
# Description: This script gets country name from a specified city name
# Usage: ./get_country_by_city.sh 

# First go to geonames and create a username https://www.geonames.org/export/web-services.html
geonames_username="nonsoasoby" 

# This function uses the geonames.org api to retrieve country name from a specified city name
get_country() {
  local city=$1
  country=$(curl -s "http://api.geonames.org/searchJSON?q=${city}&maxRows=1&username=${geonames_username}" | jq -r '.geonames[0].countryName')
  echo "$country" 
}

# Prompt the user to select a city. 
# PS3 variable is used to store options in a bash select statement
PS3="Select a city from the list "

# Specify the names of cities to choose from. 
# You can pass these options as an argument from a file using command substitution like below;
# select city in $(cat $1)
select city in Tokyo London 'Los Angeles' Moscow Dubai Manchester "New York" "Paris Bangalore" Johannesburg Istanbul Milan "Abu Dhabi" Pune Nairobi Berlin Karachi Abuja Lagos Enugu;
do
 case "$city" in 
  Tokyo)
   get_country "Tokyo";;
  London)
   get_country "London";;
  'Los Angeles')
    get_country 'Los Angeles';;
  Moscow)
   get_country "Moscow";;
  Dubai)
   get_country "Dubai";;
  Manchester)
   get_country "Manchester";;
  "New York")
   get_country "New York";;
  "Paris Bangalore")
   get_country "Paris Bangalore";;
  Johannesburg)
   get_country "Johannesburg";;
  Istanbul)
   get_country "Istanbul";;
  Milan)
   get_country "Milan";;
  "Abu Dhabi")
   get_country "Abu Dhabi";;
  Pune)
   get_country "Pune";;
  Nairobi)
   get_country "Nairobi";;
  Berlin)
   get_country "Berlin";;
  Karachi)
   get_country "Karachi";;
  Abuja)
   get_country "Abuja";;
  Lagos)
   get_country "Lagos";;
  Enugu)
   get_country "Enugu";;
  *)
  echo "Please select the right option";;
 esac
break
done 
