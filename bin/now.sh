#!/bin/bash

ZETTEL=~/zettel
date=$(date -I)
day_before=$(date --date='yesterday' -I)
day_after=$(date --date='tomorrow' -I)

year=$(date '+%Y')
yeardir=$ZETTEL/data/daily/$year
mkdir -p $yeardir 

fname="$date".md
fname_path=$yeardir/$fname


time=$(date '+%H:%M')
if ! [ -e $fname_path ]; then
  echo "$fname_path created."
  echo "# $date" >  $fname_path
  echo "* [prev]($day_before.md)" >> $fname_path
  echo "* [next]($day_after.md)" >> $fname_path
fi
echo "## $time" >> $fname_path
echo "opening "$fname_path
hx $fname_path 
