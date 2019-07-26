#!/bin/bash

cd "$1" || exit 1

grep "<Overall>" hotel_*.dat | sed 's/\.dat:<Overall>/ /' |  awk '{sum[$1] += $2; counts[$1]++;} END {for (i in sum) printf "%s %.3g\n",  i, sum[i]/counts[i];}'  | sort -nrk2