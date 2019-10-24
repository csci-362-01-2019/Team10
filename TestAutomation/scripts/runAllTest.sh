#!/bin/bash

parentdir="$PWD"
files=($parentdir/testCases/*)
pos=$((${#files[*]} - 1))
echo $pos
last=${files[$pos]}
echo $last
echo "\"data\":[" > reports/output.json
for test_case in testCases/*; do
	echo "{"  >> reports/output.json
	test_id=$(jq .'test_id' $test_case)
	echo "\"test_id\": "\"$test_id"\"," >> reports/output.json
	import_dir="$parentdir/$(jq -r .'extra_path[]' $test_case)"
	requirement=$(jq .'requirement' $test_case)
	inputs=$(jq .'inputs[]' $test_case)
	driver_name=$(jq -r .'driver_name' $test_case)
	echo "\"driver_name\": "\"$driver_name"\"," >> reports/output.json
	method_tested=$(jq -r .'method_tested' $test_case)
	echo "\"method_tested\": "\"$method_tested"\"," >> reports/output.json
	echo "\"inputs\": "\"$inputs"\"," >> reports/output.json
	expected_output=$(jq -r .'output' $test_case)
	echo "\"expected_output\": "\"$expected_output"\"," >> reports/output.json
	output=$(python $driver_name $inputs $import_dir)
	echo "\"actual_output\": "\"$output"\"" >> reports/output.json
	echo $PWD/$test_case
	echo $last
	if [[ $PWD/$test_case == $last ]]
	then
		echo "}"  >> reports/output.json
		break
	else
		echo "},"  >> reports/output.json
	fi
done

echo "]" >> reports/output.json
