#!/bin/bash
requirement=$(jq .'requirement' test1.json)
echo "Requirement being tested!!!!: $requirement"
inputs=$(jq .'inputs[]' test1.json)
output=$(python testtt.py $inputs)
echo $output
expected_output=$(jq .'output' test1.json) 
echo "expected output $expected_output"
if [ $output = $expected_output ]; then
	echo "You got the right one!!!!"
else
	echo "Test failed!!!!"
fi
