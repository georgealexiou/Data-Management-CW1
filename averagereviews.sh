#!/bin/bash

cd "$1" || exit 1
: ' By using the above command we navigate to the directory specified
	by the argument (filename) passed to the script when running it from
	the terminal. 
'

grep "<Overall>" hotel_*.dat | sed 's/\.dat:<Overall>/ /' | awk '{sum[$1] += $2; counts[$1]++;} END {for (i in sum) print i, sum[i]/counts[i];}'| sort -nrk2
