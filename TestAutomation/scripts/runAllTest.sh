#!/bin/bash

parentdir="$PWD"

echo "\"data\"["
for test_case in testCases/*; do
	test_id=$(jq .'test_id' $test_case)
	echo "\"test_id\": "\"$test_id"\","
	import_dir="$parentdir/$(jq -r .'extra_path[]' $test_case)"
	requirement=$(jq .'requirement' $test_case)
	inputs=$(jq .'inputs[]' $test_case)
	driver_name=$(jq -r .'driver_name' $test_case)
	echo "\"driver_name\": "\"$driver_name"\","
	method_tested=$(jq -r .'method_tested' $test_case)
	echo "\"method_tested\": "\"$method_tested"\","
	echo "\"inputs\": "\"$inputs"\","
	expected_output=$(jq -r .'output' $test_Case)
	echo "\"expected_output\": "\"$expected_output"\","
	output=$(python $driver_name $inputs $import_dir)
	echo "\"actual_output\": "\"$output"\","
	
	


done

echo "]"
