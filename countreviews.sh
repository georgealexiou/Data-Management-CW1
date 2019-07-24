#!/bin/bash

#loop that goes through all the files in the given directory


#grep sort sed

#awk
cd "$1" || exit 1
grep -c Author hotel_*.dat | sort -t : -k2nr | sed 's/\.dat:/ /'

: '
for file in *; do 
	if [ -f "$file" ]; then 

        n=1
        reviews_count=0

        declare -a hotel_files
       	declare -a hotel_reviews_count

        while read line; do
			#reading line
			line="$n : $line"

			#check if line contains <Author> which signifies the beggining of a review
			if [[ $line == *"<Author>"* ]]; then
				((reviews_count++))
			fi

			#increments n
			n=$((n+1))
		done< $file
		echo "$file  :  $reviews_count"
		hotel_files[$n-1]='file'
		hotel_reviews_count[$n-1]=reviews_count
	fi 
done
echo "orange"

for ((i = 0; i<${#hotel_reviews_count[@]}; i++)) 
do
      
    for((j = i; j<${#hotel_reviews_count[@]}-i-1; j++)) 
    do
      
        if ((${hotel_reviews_count[j]} > ${hotel_reviews_count[$((j+1))]})) 
        then
        	echo "yello"
            # swap reviews_count
            temp = ${hotel_reviews_count[$j]} 
            hotel_reviews_count[$j] = ${hotel_reviews_count[$((j+1))]}   
            hotel_reviews_count[$((j+1))] = $temp 

            # swap files
            temp = ${hotel_files[$j]} 
            hotel_files[$j] = ${hotel_files[$((j+1))]}   
            hotel_files[$((j+1))] = $temp 

        fi
    done
done

echo ${hotel_reviews_count[*]}

#########################################################
filename=$1 #command line argument

n=1
reviews_count=0
while read line; do
	#reading line
	line="$n : $line"

	#check if line contains <Author> which signifies the beggining of a review
	if [[ $line == *"<Author>"* ]]; then
		((reviews_count++))
	fi

	#increments n
	n=$((n+1))
done< $filename


echo "The number of reviews for this hotel is: $reviews_count"
'


