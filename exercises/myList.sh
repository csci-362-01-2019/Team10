#!/bin/bash
echo "<DOCTYPE html><html><title>Current top level listng of directory $PWD</title><body> " > output.html
for file in *; do
	echo "<p>$file</p>" >> output.html
done
echo "</body></html>">> output.html
xdg-open output.html
