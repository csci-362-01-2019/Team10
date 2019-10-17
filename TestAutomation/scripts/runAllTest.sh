#!/bin/bash

parentdir="$(dirname "$PWD")"

for test_case in ../testCases/*; do
	import_dir="$parentdir/$(jq -r .'extra_path[]' $test_case)"
	echo "thsi is the import dir $import_dir"
	echo "$test_case" 	
	requirement=$(jq .'requirement' $test_case)
	echo "This is our requirement: $requirement"
	inputs=$(jq .'inputs[]' $test_case)
	driver_name=$(jq -r .'driver_name' $test_case)
	
	output=$(python $driver_name $inputs $import_dir)
	echo "$output"
	expected_output=$(jq .'output' $test_case)


done
