#!/bin/bash

cd "$1" || exit 1
: ' By using the above command we navigate to the directory specified
	by the argument (filename) passed to the script when running it from
	the terminal. 
'

grep -c Author hotel_*.dat | sort -t : -k2nr | sed 's/\.dat:/ /'
: ' Using the grep -c command we can search all the hotel files and find
	the number of lines that contain "Author" which will give us the number
	of reviews. We then sort the data output by the grep command. Using the sed
	command we change the output of the data from hotel_218100.dat:52 to
	hotel_218100 52
'