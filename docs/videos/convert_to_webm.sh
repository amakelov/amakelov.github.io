#!/bin/bash

# List your input files here, separated by spaces.
INPUT_FILES=("sup.mp4" "mem.mp4" "tldr.mp4" "versioning.mp4")

# Loop through the input files and convert them to WebM format.
for input_file in "${INPUT_FILES[@]}"; do
  output_file="${input_file%.*}.webm"
  
  echo "Converting $input_file to $output_file"
  
  ffmpeg -i "$input_file" -c:v libvpx-vp9 -b:v 0 -crf 30 -quality good -speed 1 -tile-columns 6 -frame-parallel 1 -auto-alt-ref 1 -lag-in-frames 25 -c:a libopus -b:a 128k -threads 8 -f webm "$output_file"
  
  echo "Finished converting $input_file to $output_file"
done

echo "All files have been converted."