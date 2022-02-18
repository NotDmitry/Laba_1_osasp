#!/bin/bash
#variant_1

#help
nep_warning()
{
  echo "The format is: Low High Dir"
  echo "  Low >> Lower border of file size in bytes"
  echo "  High >>  Higher border of file size in bytes"
  echo "  Dir >> Directory to search for files with size (Low; High)"
  exit
}

lo=$1
hi=$2
direct=$3

if [[ $# -eq 0 ]]; then
  echo ">> No parameters"
  nep_warning
elif [[ -z $hi ]]; then
  echo ">> No 2nd and 3d parameter"
  nep_warning
elif [[ -z $direct ]]; then
  echo ">> No 3d parameter"
  nep_warning
elif  [[ ! -d $direct ]]; then
  echo ">> Error. Directory $direct does not exist" >&2
else
  find $direct -maxdepth 1 -type f -size +${lo}c -size -${hi}c -printf "%s %p\n" | sort -n
fi

