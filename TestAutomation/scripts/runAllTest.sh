#!/bin/bash

for test_case in ../testCases/*; do
	echo "$test_case" 	
	echo  "$PWD/$test_case"
	requirement=$(jq .'requirement' $test_case)
	echo "This is our requirement: $requirement"
	inputs=$(jq .'inputs[]' $test_case)
	driver_name=$(jq .'driver_name' $test_case)
	output=$(python $driver_name $inputs)
	expected_output=$(jq .'output' $test_case)





done
