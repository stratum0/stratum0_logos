#!/bin/sh
DEFAULT_WIDTH_PNG=500

for dir in $(ls -d */);
do
	for svg in $(ls ${dir}*.svg);
	do
		fn=$(basename $svg)
		base="${dir}${fn%.*}"
		echo $base
		inkscape --file "$svg" --export-png "${base}.png" --export-width ${DEFAULT_WIDTH_PNG} --export-background-opacity 0
		inkscape --file "$svg" --export-pdf "${base}.pdf" 
	done;
done;