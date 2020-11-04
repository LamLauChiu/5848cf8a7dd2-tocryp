#!/bin/bash
filename='host.txt'

#create the host file

while read ip_address; do
	# reading each line
	echo $ip_address `geoiplookup $ip_address| awk -F: '{print $2}'| awk -F',' '{print $2}'`
	
done < $filename
