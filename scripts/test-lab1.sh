#!/bin/bash 

TMP_FILE=g.txt

./arceos/verify_lab1.sh > $TMP_FILE 2>/dev/null

score=$(grep "Indicator:" $TMP_FILE | tail -n1 | sed -E 's/.*Indicator: ([0-9]+).*/\1/')

score=${score:-0}

echo "lab1_points=$score" >> "$GITHUB_OUTPUT"