#!/bin/bash

#Count the total number of HTTP requests recorded by this access logfile

#grep HTTP ./access.log | wc -l
   
echo "Searching $1 at $2"

searchtext=$1
filelocation=$2


httpcount=`grep $searchtext $filelocation | wc -l`


echo "total $1 in file $2 ="$httpcount
