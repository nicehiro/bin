#!/bin/bash
# rename file

count=1;
for img in `find $1 -iname '*.jpg' -o -iname '*.png' -type f -maxdepth 1`
do
	new=image-$count.${img##*.}

	echo "Renaming $img to $new"
	mv "$img" "$1/$new"
	let count++
done
