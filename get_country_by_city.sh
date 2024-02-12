#!/bin/bash

geonames_username="nonsoasoby" 

get_country() {
  local city=$1
  country=$(curl -s "http://api.geonames.org/searchJSON?q=${city}&maxRows=1&username=${geonames_username}" | jq -r '.geonames[0].countryName')
  echo "$country" 
}

PS3="Select a city from the list "

select city in Tokyo London 'Los Angeles' Moscow Dubai Manchester "New York" "Paris Bangalore" Johannesburg Istanbul Milan "Abu Dhabi" Pune Nairobi Berlin Karachi;
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
  *)
  echo "Please select the right option";;
 esac
break
done 




