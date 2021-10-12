#!/bin/bash

name="Ipin"
echo "Get ready, $name!"
echo 

# Get filename
folder=$1
overwrite=${2:-0}

cd $folder
for entry in "."/*
do
  f="$(basename -- $entry)"
  pngquant $entry
  if [ $overwrite = 1 ]; then
    rm $entry
    mv "${f%.png}-fs8.png" $entry
  fi
done
