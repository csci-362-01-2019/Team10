#!/bin/bash

parentdir="$PWD"
files=($parentdir/testCases/*)
pos=$((${#files[*]} - 1))
last=${files[$pos]}
echo "{" > reports/output.json

if [[ "$1" = "-c" ]]; then
	echo "\"pass_color\": \"yellow\"," >> reports/output.json
	echo "\"fail_color\": \"blue\"," >> reports/output.json
else
	echo "\"pass_color\": \"green\"," >> reports/output.json
	echo "\"fail_color\": \"red\"," >> reports/output.json
fi

echo "\"results\": [" >> reports/output.json



passed=0
failed=0
for test_case in testCases/*; do
	echo "{"  >> reports/output.json
	test_id=$(jq .'test_id' $test_case)
	echo "\"test_id\": "\"$test_id"\"," >> reports/output.json
	import_dir="$parentdir/$(jq -r .'extra_path[]' $test_case)"
	requirement=$(jq .'requirement' $test_case)
	echo "\"requirement\": "$requirement"," >> reports/output.json
	inputs=$(jq .'inputs[]' $test_case)
	driver_name=$(jq -r .'driver_name' $test_case)
	echo "\"driver_name\": "\"$driver_name"\"," >> reports/output.json
	method_tested=$(jq -r .'method_tested' $test_case)
	echo "\"method_tested\": "\"$method_tested"\"," >> reports/output.json
	echo "\"inputs\": "$(jq .'inputs' $test_case)"," >> reports/output.json
	expected_output=$(jq -r .'output' $test_case)
	echo "\"expected_output\": "\"$expected_output"\"," >> reports/output.json
	output=$(python $driver_name $inputs $import_dir)
	echo "\"actual_output\": $output," >> reports/output.json

	echo "output: $output,       expected: $expected_output"
	if [[ $output == \"$expected_output\" ]]
	then
		echo "\"did_pass\": true" >>  reports/output.json
		passed=$((passed + 1))
		
	else
		failed=$((failed +1 ))
		echo "\"did_pass\": false" >> reports/output.json
	fi

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


python reports/render_engine.py  
xdg-open reports/test_results.html &
