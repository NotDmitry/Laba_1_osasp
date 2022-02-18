#!/bin/bash

src=$1
out=$2

if [[ $# -eq 0 ]]; then
  echo ">> No parameters: The format is: \"Source_Filename Output_Filename\"" >&2
  exit
elif [[ -z $2 ]]; then
  echo ">> Not enough parameters: Output_Filename is missing">&2
  exit
else
  gcc $1 -o $2 && ./$2
fi
