#!/bin/bash

#Create an absolute path to the test case directory
parentdir="$PWD"
files=($parentdir/testCases/*)
#make last variable to tell when to stop json commas
pos=$((${#files[*]} - 1))
last=${files[$pos]}

echo "{" > reports/output.json

#Colorblind mode, run with -c
if [[ "$1" = "-c" ]]; then
	echo "\"pass_color\": \"blue\"," >> reports/output.json
	echo "\"fail_color\": \"yellow\"," >> reports/output.json
else
	echo "\"pass_color\": \"green\"," >> reports/output.json
	echo "\"fail_color\": \"red\"," >> reports/output.json
fi

echo "\"results\": [" >> reports/output.json

#variables that count the number of tests passed or failed
passed=0
failed=0
for test_case in testCases/*; do
	echo "{"  >> reports/output.json
	#grab variables from the test case file
	test_id=$(jq .'test_id' $test_case)
	import_dir="$parentdir/$(jq -r .'extra_path[]' $test_case)"
	requirement=$(jq .'requirement' $test_case)
	inputs=$(jq .'inputs[]' $test_case)
	driver_name=$(jq -r .'driver_name' $test_case)
	method_tested=$(jq -r .'method_tested' $test_case)
	expected_output=$(jq -r .'output' $test_case)


	#build json object attributes to send to output
	echo "\"test_id\": "\"$test_id"\"," >> reports/output.json
	echo "\"requirement\": "$requirement"," >> reports/output.json
	echo "\"driver_name\": "\"$driver_name"\"," >> reports/output.json
	echo "\"method_tested\": "\"$method_tested"\"," >> reports/output.json
	echo "\"inputs\": "$(jq .'inputs' $test_case)"," >> reports/output.json
	echo "\"expected_output\": "\"$expected_output"\"," >> reports/output.json

	#run the driver with inputs and put real output in json object
	output=$(python $driver_name $inputs $import_dir)
	echo "\"actual_output\": $output," >> reports/output.json
	
	#add boolean value for if it passed to output
	if [[ $output == \"$expected_output\" ]]
	then
		echo "\"did_pass\": true" >>  reports/output.json
		passed=$((passed + 1))
		
	else
		failed=$((failed +1 ))
		echo "\"did_pass\": false" >> reports/output.json
	fi

	#if last file, no comma after json
	if [[ $PWD/$test_case == $last ]]
	then
		echo "}"  >> reports/output.json
		break
	else
		echo "},"  >> reports/output.json
	fi
done

echo "]," >> reports/output.json
echo "\"tests_passed\":$passed ," >> reports/output.json	
echo "\"tests_failed\": $failed " >> reports/output.json
echo "}" >> reports/output.json

#Call the render_engine on the output.json to turn to html
python reports/render_engine.py  
#open report with xdg
xdg-open reports/test_results.html &
