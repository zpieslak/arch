#!/bin/bash

INPUT_DIR=/wd2/backup/iphone/
BASE_OUTPUT_DIR=/wd2/media
COUNT=$(find $INPUT_DIR -type f | wc -l)
ITERATOR=0

shopt -s globstar

for file in $INPUT_DIR/**/*
do
  # Increment iterator
  ITERATOR=$(expr $ITERATOR + 1)

  # Print process
  echo "[file] $ITERATOR/$COUNT"

  # Verify file
  if [[ ! -f "$file" ]]
  then
    continue
  fi

  # Verify mime type
  VALID="0"
  OUTPUT_DIR=$BASE_OUTPUT_DIR
  MIME=$(file -bi "$file")

  if [[ $MIME =~ video ]]; then
    OUTPUT_DIR="$OUTPUT_DIR/video"
    VALID="1"
  elif [[ $MIME =~ image ]] && [[ ! $MIME =~ "image/png" ]]; then
    OUTPUT_DIR="$OUTPUT_DIR/photo"
    VALID="1"
  fi

  # Ignore if file is invalid mime
  if [ $VALID != "1" ]
  then
    echo "[file][ignore] $file"
    continue
  fi

  # Get date and extension
  DATE=$(exiftool -q -q -p '${CreateDate#;DateFmt("%Y-%m-%dT%H:%M:%S")}' -p '${CreateDate#;DateFmt("%Y-%m-%dT%H:%M:%S")}.${SubSecTimeOriginal}' "$file" | tail -1)
  EXTENSION=$(exiftool -FileTypeExtension -S -s "$file")

  if [[ -z $DATE ]]
  then
    echo "[file][error] $file"
    continue
  fi

  YEAR=$(date -d "$DATE" +"%Y")
  MONTH=$(date -d "$DATE" +"%m")
  OUTPUT_PATH="${DATE//:/}.$EXTENSION"
  OUTPUT_DIR="$OUTPUT_DIR/$YEAR/$MONTH"

  mkdir -p "$OUTPUT_DIR"
  cp "$file" "$OUTPUT_DIR/$OUTPUT_PATH"
  # echo "$file" "$OUTPUT_DIR/$OUTPUT_PATH"
done
