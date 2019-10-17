#!/bin/bash
python3 shit.py $(jq .'inputs[]' test1.json)
