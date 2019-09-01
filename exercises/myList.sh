#!/bin/bash
echo "<!DOCTYPE html>" > output.html
echo "<html>" >> output.html
echo "    <head>" >> output.html
echo "        <title>Current top level listing of directory $PWD</title>" >> output.html
echo "    </head>" >> output.html
echo "    <body>">> output.html
for file in *; do
    if [ "$file" = "output.html" ];
    then
        continue
    fi
    if test -d "$file"
    then
	    echo "        <p>$file/</p>" >> output.html
    else
        echo "        <p>$file</p>" >> output.html
    fi
done
echo "    </body>" >> output.html
echo "</html>" >>output.html
xdg-open output.html
