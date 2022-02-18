#!/bin/bash

#help
nep_warning()
{
  echo "The format is: Out Src Ext"
  echo "  Out >> Output_File_Name"
  echo "  Src >>  Source_Directory"
  echo "  Ext >> Filename_Extension"
  exit
}

out=$1
src=$2
ext=$3

if [[ $# -eq 0 ]]; then
  echo ">> No parameters"
  nep_warning
elif [[ -z $src ]]; then
  echo ">> No 2nd and 3d parameter"
  nep_warning
elif  [[ ! -d $src ]]; then
  echo ">> Error. Directory $src does not exist" >&2
  exit
elif [[ -z $ext ]]; then
  echo ">> No 3d parameter"
  nep_warning
else
  find $src -maxdepth 1 -type f -name "*$ext" -printf "%f\n" | sort -o $out
  echo "#Mission complete"
fi
