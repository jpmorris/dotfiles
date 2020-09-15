#!/bin/bash

# convert produces huge files without -compress zip
#

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -f|--filename) filename="$2"; shift ;;
        -a|--adf) adf=1 ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

if [[ -z "$filename" ]]; then
  filename="out.pdf"
fi


if [[ "$adf" -eq 1 ]]; then
  rm -rf /tmp/*.tiff
  scanimage \
    --device "airscan:w0:Brother" \
    --progress \
    --source ADF \
    --format tiff \
    --resolution 300 \
    --batch=/tmp/out%d.tiff
  convert -compress zip /tmp/out*.tiff $filename
  rm -rf /tmp/*.tiff
else
  scanimage \
    --device "airscan:w0:Brother" \
    --progress \
    --format pnm \
    --resolution 300 | \
    pnmtops -imageheight 11 -imagewidth 8.5 | \
    ps2pdf - $filename
fi

