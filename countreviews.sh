#!/bin/bash

#goes to directory as declared by the argument passed
cd "$1" || exit 1

#ranks hotels based on the number of reviews they have
grep -c "<Author>" hotel_*.dat | sort -t : -k2nr | sed 's/\.dat:/ /'
