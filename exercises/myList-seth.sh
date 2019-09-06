#!/bin/bash

echo "<DOCTYPE html><html>" > toplevel.html
echo "<title>Top-Level Directory</title>" >> toplevel.html
echo "<h1>Relative Top-Level Directory</h1>" >> toplevel.html

for file in *; do
	if [ "$file" = "toplevel.html" ]; then 
		continue
	fi	
		
	echo "<p><a href="file:///$PWD/$file">$file</a></p>" >> toplevel.html
done

echo "</html>" >> toplevel.html

xdg-open toplevel.html
