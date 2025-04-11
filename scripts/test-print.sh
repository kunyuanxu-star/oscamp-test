#!/bin/bash

cd arceos/ || exit

make run A=exercises/print_with_color/ > a.txt 

output=$(tail -n1 ./a.txt | grep -a "$(printf '\x1b')")

tail -n1 ./a.txt | grep -a "$(printf '\x1b')"

# 避免环境污染
rm a.txt

if [[ -z "$output" ]] ;then
    echo "print_with_color 不通过"
    exit 1
else 
    echo "print_with_color 通过"
    exit 0
fi